# Get Bearer Token from Entra ID using Enterprise App
$tenantId = "<YOUR_TENANT_ID>"
$clientId = "<YOUR_CLIENT_ID>"
$clientSecret = "<YOUR_CLIENT_SECRET>"
$scope = "https://api.securitycopilot.microsoft.com/.default"  # Security Copilot API scope

# Construct the token request
$body = @{
    client_id     = $clientId
    scope         = $scope
    client_secret = $clientSecret
    grant_type    = "client_credentials"
}
$tokenUrl = "https://login.microsoftonline.com/$tenantId/oauth2/v2.0/token"

$response = Invoke-RestMethod -Uri $tokenUrl -Method Post -Body $body -ContentType "application/x-www-form-urlencoded"
$bearerToken = $response.access_token

# Calculate date range for the last week
$endDate = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss.fffZ")
$startDate = (Get-Date).AddDays(-365).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss.fffZ")

# Function to fetch and export Security Copilot data
function Get-SecurityCopilotData {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("prompts", "evaluations")]
        [string]$ResourceType,
        
        [Parameter(Mandatory=$true)]
        [string]$BearerToken,
        
        [Parameter(Mandatory=$true)]
        [string]$StartDate,
        
        [Parameter(Mandatory=$true)]
        [string]$EndDate,
        
        [int]$MaxRetries = 5,
        
        [int]$InitialWaitTime = 60
    )
    
    # Build API URL with date filters
    $apiUrl = "https://api.securitycopilot.microsoft.com/exports/$ResourceType`?startDate=$([System.Uri]::EscapeDataString($StartDate))&endDate=$([System.Uri]::EscapeDataString($EndDate))"
    
    Write-Host "`n-------------------------------------------------------------" -ForegroundColor DarkGray
    Write-Host "[$($ResourceType.ToUpper())] Fetching data from $StartDate to $EndDate" -ForegroundColor Magenta
    Write-Host "-------------------------------------------------------------" -ForegroundColor DarkGray
    Write-Host "[API CALL] " -ForegroundColor Yellow -NoNewline
    Write-Host "$apiUrl" -ForegroundColor Cyan
    Write-Host "-------------------------------------------------------------" -ForegroundColor DarkGray
    
    $headers = @{
        "Authorization" = "Bearer $BearerToken"
        "Content-Type" = "application/json"
    }
    $continuationToken = $null
    $allData = @()
    $retryCount = 0
    $waitTime = $InitialWaitTime
    
    do {
        try {
            $apiResponse = Invoke-RestMethod -Uri $apiUrl -Method Get -Headers $headers
            $retryCount = 0  # Reset retry count on successful call
        } catch {
            $statusCode = $_.Exception.Response.StatusCode.value__
            if ($statusCode -eq 429) {
                $retryCount++
                if ($retryCount -le $MaxRetries) {
                    Write-Host "`n[WARNING] Rate limit exceeded. Attempt $retryCount of $MaxRetries" -ForegroundColor Yellow
                    Write-Host "[INFO] Waiting for $waitTime seconds before retrying..." -ForegroundColor Cyan
                    Start-Sleep -Seconds $waitTime
                    $waitTime = $waitTime * 2  # Exponential back-off
                    continue
                } else {
                    Write-Host "`n[ERROR] Max retries reached. Exiting..." -ForegroundColor Red
                    break
                }
            } else {
                Write-Host "`n[ERROR] $($_.Exception.Message)" -ForegroundColor Red
                break
            }
        }

        $waitTime = $InitialWaitTime

        # Accumulate data from each response
        if ($apiResponse.$ResourceType) {
            $allData += $apiResponse.$ResourceType
            
            # Display each prompt in a fancy way
            if ($ResourceType -eq "prompts") {
                foreach ($prompt in $apiResponse.$ResourceType) {
                    Write-Host "`n  -----------------------------------------------------------" -ForegroundColor DarkCyan
                    Write-Host "  | " -ForegroundColor DarkCyan -NoNewline
                    Write-Host "Session ID  : " -ForegroundColor Gray -NoNewline
                    Write-Host "$($prompt.sessionId)" -ForegroundColor White
                    Write-Host "  | " -ForegroundColor DarkCyan -NoNewline
                    Write-Host "Prompt ID   : " -ForegroundColor Gray -NoNewline
                    Write-Host "$($prompt.promptId)" -ForegroundColor White
                    Write-Host "  | " -ForegroundColor DarkCyan -NoNewline
                    Write-Host "Source      : " -ForegroundColor Gray -NoNewline
                    Write-Host "$($prompt.source)" -ForegroundColor Cyan
                    Write-Host "  | " -ForegroundColor DarkCyan -NoNewline
                    Write-Host "Prompt Type : " -ForegroundColor Gray -NoNewline
                    Write-Host "$($prompt.promptType)" -ForegroundColor Yellow
                    
                    # If prompt type is "prompt", display the content (no skill name)
                    if ($prompt.promptType -eq "prompt") {
                        Write-Host "  | " -ForegroundColor DarkCyan -NoNewline
                        Write-Host "Content     : " -ForegroundColor Gray -NoNewline
                        Write-Host "$($prompt.content)" -ForegroundColor Green
                    }
                    # If prompt type is "skill", display skill name and inputs
                    elseif ($prompt.promptType -eq "skill") {
                        Write-Host "  | " -ForegroundColor DarkCyan -NoNewline
                        Write-Host "Skill Name  : " -ForegroundColor Gray -NoNewline
                        Write-Host "$($prompt.skillName)" -ForegroundColor Magenta
                        Write-Host "  | " -ForegroundColor DarkCyan -NoNewline
                        Write-Host "Inputs      : " -ForegroundColor Gray -NoNewline
                        Write-Host "$($prompt.inputs)" -ForegroundColor Cyan
                    }
                    
                    Write-Host "  -----------------------------------------------------------" -ForegroundColor DarkCyan
                }
            }
        }
        
        Write-Host "`n[INFO] Fetched $($apiResponse.$ResourceType.Count) $ResourceType in this batch" -ForegroundColor Cyan
        
        # Stop if no data returned
        if ($null -eq $apiResponse.$ResourceType -or $apiResponse.$ResourceType.Count -eq 0) {
            Write-Host "`n[WARNING] No more $ResourceType to fetch" -ForegroundColor Yellow
            break
        }
        
        $continuationToken = $apiResponse.sessionsContinuationToken
        if ($null -ne $continuationToken) {
            $apiUrl = "https://api.securitycopilot.microsoft.com/exports/$ResourceType`?startDate=$([System.Uri]::EscapeDataString($StartDate))&endDate=$([System.Uri]::EscapeDataString($EndDate))&continuationToken=$([System.Uri]::EscapeDataString($continuationToken))"
        }
        
        Write-Host "[PROGRESS] Total $ResourceType fetched so far: $($allData.Count)" -ForegroundColor DarkGray
        
        Start-Sleep -Seconds 1
    } while ($null -ne $continuationToken)
    
    # Export all data to CSV
    $outputFile = "$($ResourceType)_export.csv"
    $allData | Export-Csv -Path $outputFile -NoTypeInformation -Encoding UTF8
    
    Write-Host "`n-------------------------------------------------------------" -ForegroundColor DarkGray
    Write-Host "[SUCCESS] Exported $($allData.Count) $ResourceType to $outputFile" -ForegroundColor Green
    Write-Host "-------------------------------------------------------------`n" -ForegroundColor DarkGray
    
    return $allData
}

# Fetch prompts
$allPrompts = Get-SecurityCopilotData -ResourceType "prompts" -BearerToken $bearerToken -StartDate $startDate -EndDate $endDate

# Fetch evaluations
$allEvaluations = Get-SecurityCopilotData -ResourceType "evaluations" -BearerToken $bearerToken -StartDate $startDate -EndDate $endDate
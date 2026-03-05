Import-Module MSAL.PS
Write-Host "`n=============================================================" -ForegroundColor Magenta
Write-Host "   Microsoft Security Copilot API Demo" -ForegroundColor Magenta
Write-Host "=============================================================`n" -ForegroundColor Magenta

# CONFIGURATION
$TenantId = "<YOUR_TENANT_ID>"
$ClientId = "<YOUR_CLIENT_ID>"
$WorkspaceId = "default"

Write-Host "[AUTH] Initiating delegated authentication..." -ForegroundColor Yellow
$tokenResponse = Get-MsalToken -ClientId $ClientId `
                                -TenantId $TenantId `
                                -Scopes "SecurityCopilotWorkspaces.ReadWrite.All" `
                                -Interactive

$accessToken = $tokenResponse.AccessToken
Write-Host "[SUCCESS] Authenticated as: " -ForegroundColor Green -NoNewline
Write-Host "$($tokenResponse.Account.Username)" -ForegroundColor Cyan

## RETRIEVE ALL THE PLUGINS
Write-Host "`n-------------------------------------------------------------" -ForegroundColor DarkGray
Write-Host "[PLUGINS] Retrieving Plugin List" -ForegroundColor Magenta
Write-Host "-------------------------------------------------------------" -ForegroundColor DarkGray
$uri = "https://graph.microsoft.com/beta/security/securityCopilot/workspaces/$WorkspaceId/plugins"
$response = Invoke-RestMethod -Uri $uri -Method GET -Headers @{ Authorization = "Bearer $accessToken" }
foreach ($plugin in $response.value) {
    Write-Host "`n  - " -ForegroundColor DarkGray -NoNewline
    Write-Host "$($plugin.displayName)" -ForegroundColor Cyan
    Write-Host "    Status: " -ForegroundColor DarkGray -NoNewline
    Write-Host $(if ($plugin.isEnabled) { "Enabled" } else { "Disabled" }) -ForegroundColor $(if ($plugin.isEnabled) { 'Green' } else { 'Yellow' })
}



## CREATE A SESSION
Write-Host "`n-------------------------------------------------------------" -ForegroundColor DarkGray
Write-Host "[SESSION] Creating Session: 'Who am I'" -ForegroundColor Magenta
Write-Host "-------------------------------------------------------------" -ForegroundColor DarkGray
$uri = "https://graph.microsoft.com/beta/security/securityCopilot/workspaces/$WorkspaceId/sessions"
$body = @{
    displayName = "Who am I"
} | ConvertTo-Json
$response = Invoke-RestMethod -Uri $uri -Method POST -Headers @{ 
    Authorization = "Bearer $accessToken"
    "Content-Type" = "application/json"
} -Body $body
Write-Host "[SUCCESS] Session created with ID: " -ForegroundColor Green -NoNewline
Write-Host "$($response.id)" -ForegroundColor Cyan
$sessionId = $response.id


## SUBMITTING A PROMPT TO THE SESSION
Write-Host "`n-------------------------------------------------------------" -ForegroundColor DarkGray
Write-Host "[PROMPT] Submitting Prompt: 'Who am I?'" -ForegroundColor Magenta
Write-Host "-------------------------------------------------------------" -ForegroundColor DarkGray
$uri = "https://graph.microsoft.com/beta/security/securityCopilot/workspaces/$WorkspaceId/sessions/$sessionId/prompts"
$body = @{
    content = "Who am I?"
    type    = "prompt"
} | ConvertTo-Json
$response = Invoke-RestMethod -Uri $uri -Method POST -Headers @{
    Authorization = "Bearer $accessToken"
    "Content-Type" = "application/json"
} -Body $body
Write-Host "[SUCCESS] Prompt submitted with ID: " -ForegroundColor Green -NoNewline
Write-Host "$($response.id)" -ForegroundColor Cyan
$promptId = $response.id

## EVALUATING THE PROMPT
Write-Host "`n-------------------------------------------------------------" -ForegroundColor DarkGray
Write-Host "[EVALUATION] Starting Prompt Evaluation" -ForegroundColor Magenta
Write-Host "-------------------------------------------------------------" -ForegroundColor DarkGray
$uri = "https://graph.microsoft.com/beta/security/securityCopilot/workspaces/$WorkspaceId/sessions/$sessionId/prompts/$promptId/evaluations"
$body = @{
} | ConvertTo-Json
$response = Invoke-RestMethod -Uri $uri -Method POST -Headers @{
    Authorization = "Bearer $accessToken"
    "Content-Type" = "application/json"
} -Body $body
Write-Host "[SUCCESS] Evaluation submitted with ID: " -ForegroundColor Green -NoNewline
Write-Host "$($response.id)" -ForegroundColor Cyan
$evaluationId = $response.id

## PRINTING THE EVALUATION STATUS UNTIL COMPLETED
Write-Host "`n[MONITOR] Checking evaluation status..." -ForegroundColor Yellow
$state = "unknown"
while ($state -ne "completed") {
    $uri = "https://graph.microsoft.com/beta/security/securityCopilot/workspaces/$WorkspaceId/sessions/$sessionId/prompts/$promptId/evaluations/$evaluationId"
    $response = Invoke-RestMethod -Uri $uri -Method GET -Headers @{
        Authorization = "Bearer $accessToken"
    }
    $state = $response.state
    Write-Host "  > Current state: " -ForegroundColor DarkGray -NoNewline
    Write-Host "$state" -ForegroundColor Yellow
    Start-Sleep -Milliseconds 500
}
Write-Host "`n[SUCCESS] Evaluation completed!" -ForegroundColor Green

## RETRIEVING THE EVALUATION RESULTS
Write-Host "`n-------------------------------------------------------------" -ForegroundColor DarkGray
Write-Host "[RESPONSE] Result" -ForegroundColor Magenta
Write-Host "-------------------------------------------------------------" -ForegroundColor DarkGray
Write-Host "$($response.result.content)" -ForegroundColor Cyan
Write-Host "`n=============================================================" -ForegroundColor Magenta
Write-Host "   Demo Complete" -ForegroundColor Magenta
Write-Host "=============================================================`n" -ForegroundColor Magenta

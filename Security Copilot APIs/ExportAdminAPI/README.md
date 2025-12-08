# Security Copilot Export Admin APIs

A PowerShell script to export prompts and evaluations data from Microsoft Security Copilot using the Admin Export APIs.


## Overview

This script demonstrates how to authenticate with Microsoft Security Copilot's Admin APIs and export telemetry data including prompts and evaluations from your workspace. It's useful for auditing, compliance, analytics, and understanding usage patterns within your Security Copilot environment.

<div align="center">
  <img src="https://github.com/mariocuomo/Security-Copilot/blob/main/Images/SecuirtyCopilotAPIs/ExportAdminSchema.png" width="700"> </img>
</div>


## Features

- **Authentication**: Uses Entra ID Enterprise Application credentials (Client ID/Secret) to obtain Bearer tokens
- **Date Range Filtering**: Configurable time range for data export (default: last 365 days)
- **Pagination Support**: Handles continuation tokens to retrieve all available data
- **Rate Limiting**: Implements exponential back-off retry logic for HTTP 429 responses
- **Formatted Console Output**: Color-coded display of exported data in real-time
- **CSV Export**: Automatically exports data to CSV files for further analysis
- **Two Resource Types**:
  - **Prompts**: User queries, skills executed, and agent interactions
  - **Evaluations**: Assessment results and metrics

## Prerequisites

- PowerShell 5.1 or higher
- Microsoft Security Copilot instance
- Entra ID Enterprise Application with:
  - Client ID
  - Client Secret
  - Tenant ID
  - Security Copilot Owner role

## Setup

### 1. Create an Enterprise Application in Entra ID

1. Navigate to **Azure Active Directory** > **App registrations** > **New registration**
2. Name your application (e.g., "Security Copilot Export")
3. Register the application
4. Note the **Application (client) ID** and **Directory (tenant) ID**

<div align="center">
  <img src="https://github.com/mariocuomo/Security-Copilot/blob/main/Images/SecuirtyCopilotAPIs/EnterpriseApp.png" width="700"> </img>
</div>


### 2. Generate Client Secret

1. Go to **Certificates & secrets** > **New client secret**
2. Add a description and set expiration
3. Copy the secret value (you won't be able to see it again)

<div align="center">
  <img src="https://github.com/mariocuomo/Security-Copilot/blob/main/Images/SecuirtyCopilotAPIs/EnterpriseAppSecret.png" width="700"> </img>
</div>

### 3. Configure API Permissions

1. Provide the **Security Copilot Owner role** to the application as described [here](https://learn.microsoft.com/en-us/copilot/security/activity-export-api#authenticating-with-a-service-principal)

<div align="center">
  <img src="https://github.com/mariocuomo/Security-Copilot/blob/main/Images/SecuirtyCopilotAPIs/EnterpriseAppGroup.png" width="700"> </img>
</div>

### 4. Update Script Variables

Edit the script and replace the following variables with your values:

```powershell
$tenantId = "YOUR-TENANT-ID"
$clientId = "YOUR-CLIENT-ID"
$clientSecret = "YOUR-CLIENT-SECRET"
```

⚠️ **Security Warning**: Never commit credentials to version control. Consider using Azure Key Vault or environment variables for production use.

## Usage

Run the script in PowerShell:

```powershell
.\SecurityCopilotExportAdminAPIs.ps1
```

The script will:
1. Authenticate with Entra ID
2. Fetch all prompts from the specified date range
3. Fetch all evaluations from the specified date range
4. Display formatted output in the console
5. Export data to CSV files:
   - `prompts_export.csv`
   - `evaluations_export.csv`

## Configuration

### Date Range

Modify the date range by adjusting these variables:

```powershell
$endDate = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss.fffZ")
$startDate = (Get-Date).AddDays(-365).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss.fffZ")
```

### Retry Settings

Adjust rate limiting behavior:

```powershell
Get-SecurityCopilotData -ResourceType "prompts" `
    -BearerToken $bearerToken `
    -StartDate $startDate `
    -EndDate $endDate `
    -MaxRetries 5 `
    -InitialWaitTime 60
```

- `MaxRetries`: Maximum number of retry attempts for rate limiting (default: 5)
- `InitialWaitTime`: Initial wait time in seconds before retrying (default: 60)

## Output Data Structure

### Prompts Export

The prompts CSV includes fields such as:
- `sessionId`: Unique session identifier
- `promptId`: Unique prompt identifier
- `source`: Origin of the prompt (e.g., immersive, LogicApp)
- `promptType`: Type (Prompt or Skill)
- `content`: The actual prompt text (for promptType="prompt")
- `skillName`: Name of the skill executed (for promptType="skill")
- `inputs`: Skill input parameters
- `createdAt`: Timestamp of creation
- `workspaceId`: Workspace identifier

### Evaluations Export

Contains evaluation metrics and assessment results for executed prompts.

## API Endpoints

The script uses the following Security Copilot Admin APIs:

```
GET https://api.securitycopilot.microsoft.com/exports/prompts?startDate={date}&endDate={date}
GET https://api.securitycopilot.microsoft.com/exports/evaluations?startDate={date}&endDate={date}
```

## Error Handling

The script includes robust error handling for:
- **HTTP 429 (Rate Limiting)**: Exponential back-off retry logic
- **Authentication failures**: Clear error messages
- **Empty responses**: Graceful termination
- **Network errors**: Exception catching and reporting

## Example Output

```
-------------------------------------------------------------
[PROMPTS] Fetching data from 2023-12-08T00:00:00.000Z to 2024-12-08T00:00:00.000Z
-------------------------------------------------------------
[API CALL] https://api.securitycopilot.microsoft.com/exports/prompts?startDate=...

  -----------------------------------------------------------
  | Session ID  : d3b69430-80bf-40fc-a9bf-109318330977
  | Prompt ID   : ac156bf3-9a45-44c3-8bab-60402c2dea4c
  | Source      : immersive
  | Prompt Type : Skill
  | Skill Name  : ExecuteADXQuery
  | Inputs      : @{kqlquery=SigninLogs}
  -----------------------------------------------------------

[INFO] Fetched 50 prompts in this batch
[PROGRESS] Total prompts fetched so far: 50

-------------------------------------------------------------
[SUCCESS] Exported 828 prompts to prompts_export.csv
-------------------------------------------------------------
```

## Security Best Practices

1. **Credential Management**: 
   - Use Azure Key Vault for production environments
   - Rotate client secrets regularly
   - Never commit secrets to source control

2. **Principle of Least Privilege**: 
   - Grant only necessary API permissions
   - Use dedicated service accounts

3. **Data Protection**: 
   - Encrypt exported CSV files at rest
   - Control access to export data
   - Implement data retention policies

## Troubleshooting

### Authentication Errors
- Verify client ID, secret, and tenant ID are correct
- Check if the client secret has expired

### Rate Limiting
- Increase `InitialWaitTime` or `MaxRetries`
- Reduce the date range to fetch less data per execution
- Consider scheduling exports during off-peak hours

### Empty Results
- Verify the date range includes activity
- Check if you have access to the workspace
- Ensure prompts/evaluations exist in the specified timeframe

## License

This project is provided as-is for educational and demonstration purposes.

## Contributing

Contributions, issues, and feature requests are welcome!

## Author

[Mario Cuomo](https://www.linkedin.com/in/mariocuomo/)

## References

- [Microsoft Security Copilot Documentation](https://learn.microsoft.com/en-us/security-copilot/)
- [Entra ID Registration](https://learn.microsoft.com/en-us/azure/active-directory/develop/quickstart-register-app)
- [Security Copilot API Documentation](https://learn.microsoft.com/en-us/copilot/security/activity-export-api)


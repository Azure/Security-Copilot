# Security Copilot Graph API

A PowerShell script to interact with Microsoft Security Copilot using the Microsoft Graph API for managing workspaces, sessions, prompts, and evaluations.

## Overview

This script demonstrates how to authenticate with Microsoft Security Copilot's Graph API using delegated user authentication and perform common operations such as listing plugins, creating sessions, submitting prompts, and evaluating responses. It's useful for automation, testing, and integrating Security Copilot capabilities into custom workflows.

## Features

- **Delegated Authentication**: Uses interactive login with MSAL for user-based authentication
- **Plugin Management**: Retrieve and display all available plugins and their status
- **Session Management**: Create new Security Copilot sessions programmatically
- **Prompt Submission**: Submit prompts to sessions and receive prompt IDs
- **Evaluation Workflow**: Start evaluations and monitor their completion status
- **Formatted Console Output**: Color-coded display with clear visual sections
- **Real-time Monitoring**: Polls evaluation status until completion
- **Response Display**: Shows the final evaluation results

## Prerequisites

- PowerShell 5.1 or higher
- MSAL.PS PowerShell module
- Microsoft Security Copilot instance
- Entra ID account with appropriate permissions
- Microsoft Graph API permissions:
  - `SecurityCopilotWorkspaces.ReadWrite.All`

## Setup

### 1. Install MSAL.PS Module

Open PowerShell and install the MSAL.PS module:

```powershell
Install-Module -Name MSAL.PS -Scope CurrentUser
```

### 2. Register Application in Entra ID (Optional for Delegated Flow)

For delegated authentication, you can use the public client app registration or create your own:

1. Navigate to **Azure Active Directory** > **App registrations** > **New registration**
2. Name your application (e.g., "Security Copilot Graph Client")
3. Set **Platform** to **Mobile and desktop applications**
4. Add redirect URI: `http://localhost` or `https://login.microsoftonline.com/common/oauth2/nativeclient`
5. Note the **Application (client) ID** and **Directory (tenant) ID**

<div align="center">
  <img src="https://github.com/mariocuomo/Security-Copilot/blob/main/Images/SecuirtyCopilotAPIs/GraphApiRedirect.png" width="700"> </img>
</div>

### 3. Configure API Permissions

1. Go to **API permissions** > **Add a permission**
2. Select **Microsoft Graph** > **Delegated permissions**
3. Add `SecurityCopilotWorkspaces.ReadWrite.All`
4. Grant admin consent if required by your organization

<div align="center">
  <img src="https://github.com/mariocuomo/Security-Copilot/blob/main/Images/SecuirtyCopilotAPIs/GraphApiPermissions.png" width="700"> </img>
</div>

### 4. Update Script Variables

Edit the script and replace the following variables with your values:

```powershell
$TenantId = "YOUR-TENANT-ID"
$ClientId = "YOUR-CLIENT-ID"
$WorkspaceId = "default"  # or your specific workspace ID
```

## Usage

Run the script in PowerShell:

```powershell
.\SecurityCopilotGraphApi.ps1
```

The script will:
1. Prompt for interactive authentication (browser popup)
2. Retrieve and display all available plugins with their status
3. Create a new session named "Who am I"
4. Submit the prompt "Who am I?"
5. Start an evaluation of the prompt
6. Monitor the evaluation status until completion
7. Display the final response

## Configuration

### Workspace ID

By default, the script uses `"default"` as the workspace ID. To use a specific workspace:

```powershell
$WorkspaceId = "your-workspace-guid"
```

### Authentication Scopes

The script requests the following scope:

```powershell
-Scopes "SecurityCopilotWorkspaces.ReadWrite.All"
```

You can modify this based on your permission requirements.

### Polling Interval

Adjust the evaluation monitoring frequency:

```powershell
Start-Sleep -Milliseconds 500  # Check every 500ms
```

## API Operations

The script demonstrates the following Graph API endpoints:

### 1. List Plugins

```
GET https://graph.microsoft.com/beta/security/securityCopilot/workspaces/{workspaceId}/plugins
```

Returns all available plugins (skills) and their enabled status.

### 2. Create Session

```
POST https://graph.microsoft.com/beta/security/securityCopilot/workspaces/{workspaceId}/sessions
```

Creates a new Security Copilot session with a display name.

### 3. Submit Prompt

```
POST https://graph.microsoft.com/beta/security/securityCopilot/workspaces/{workspaceId}/sessions/{sessionId}/prompts
```

Submits a prompt to an existing session.

### 4. Start Evaluation

```
POST https://graph.microsoft.com/beta/security/securityCopilot/workspaces/{workspaceId}/sessions/{sessionId}/prompts/{promptId}/evaluations
```

Initiates evaluation of a submitted prompt.

### 5. Check Evaluation Status

```
GET https://graph.microsoft.com/beta/security/securityCopilot/workspaces/{workspaceId}/sessions/{sessionId}/prompts/{promptId}/evaluations/{evaluationId}
```

Retrieves the current state and results of an evaluation.


## Example Output

```
=============================================================
   Microsoft Security Copilot API Demo
=============================================================

[AUTH] Initiating delegated authentication...
[SUCCESS] Authenticated as: user@contoso.com

-------------------------------------------------------------
[PLUGINS] Retrieving Plugin List
-------------------------------------------------------------

  - Microsoft Defender XDR
    Status: Enabled
    
  - Microsoft Entra
    Status: Enabled
    
  - Natural Language to KQL for Microsoft Sentinel
    Status: Disabled

-------------------------------------------------------------
[SESSION] Creating Session: 'Who am I'
-------------------------------------------------------------
[SUCCESS] Session created with ID: d3b69430-80bf-40fc-a9bf-109318330977

-------------------------------------------------------------
[PROMPT] Submitting Prompt: 'Who am I?'
-------------------------------------------------------------
[SUCCESS] Prompt submitted with ID: ac156bf3-9a45-44c3-8bab-60402c2dea4c

-------------------------------------------------------------
[EVALUATION] Starting Prompt Evaluation
-------------------------------------------------------------
[SUCCESS] Evaluation submitted with ID: 7f8e9d2c-1b3a-4c5d-8e9f-1a2b3c4d5e6f

[MONITOR] Checking evaluation status...
  > Current state: running
  > Current state: running
  > Current state: completed

[SUCCESS] Evaluation completed!

-------------------------------------------------------------
[RESPONSE] Result
-------------------------------------------------------------
You are user@contoso.com, authenticated with Microsoft Security Copilot 
using delegated permissions...

=============================================================
   Demo Complete
=============================================================
```

## Error Handling

The script includes basic error handling. Common issues:

- **Authentication Failures**: Check tenant ID, client ID, and permissions
- **API Errors**: Ensure you have proper Graph API permissions
- **Module Not Found**: Install MSAL.PS module
- **Workspace Access**: Verify you have access to the specified workspace


### Retrieving Session History

Get all prompts from a session:

```powershell
$uri = "https://graph.microsoft.com/beta/security/securityCopilot/workspaces/$WorkspaceId/sessions/$sessionId/prompts"
$response = Invoke-RestMethod -Uri $uri -Method GET -Headers @{ 
    Authorization = "Bearer $accessToken" 
}
```

## Security Best Practices

1. **Token Management**: 
   - MSAL.PS handles token caching automatically
   - Tokens are stored securely in user profile
   - Consider token lifetime for long-running scripts

2. **Principle of Least Privilege**: 
   - Request only necessary scopes
   - Use read-only scopes when modification isn't needed

3. **Data Protection**: 
   - Be cautious with sensitive data in prompts
   - Implement logging controls for compliance
   - Consider data residency requirements


## Troubleshooting

### Module Import Errors
```powershell
Import-Module MSAL.PS -Force
```

### Authentication Popup Issues
- Ensure your browser allows popups
- Check if conditional access policies block the sign-in
- Try using `-DeviceCode` parameter for MSAL authentication

### Permission Errors
- Verify the required permissions are granted
- Ensure admin consent is provided if required
- Check if the user has access to the workspace

### API Version Issues
- The script uses `/beta` endpoints
- Some features may change; consult the latest documentation


## License

This project is provided as-is for educational and demonstration purposes.

## Contributing

Contributions, issues, and feature requests are welcome!

## Author

[Mario Cuomo](https://www.linkedin.com/in/mariocuomo/)

## References

- [Microsoft Security Copilot Documentation](https://learn.microsoft.com/en-us/security-copilot/)
- [Microsoft Graph API Documentation](https://learn.microsoft.com/en-us/graph/)
- [Security Copilot Graph API Reference](https://learn.microsoft.com/en-us/graph/api/resources/security-copilot-api-overview)
- [MSAL.PS Module](https://github.com/AzureAD/MSAL.PS)
- [Entra ID Authentication](https://learn.microsoft.com/en-us/azure/active-directory/develop/)

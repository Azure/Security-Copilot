# Security Copilot Custom Plugin - Sentinel KQL - GCPAudit Logs

#### Security Copilot Plugin to run a Dynamic KQL Query for a particluar user, IP Address and time and date range against the GCPAudit logs in a Microsoft Sentinel workspace.

### Pre-requisites

* [Security Copilot Enabled](https://learn.microsoft.com/en-us/security-copilot/get-started-security-copilot#onboarding-to-microsoft-security-copilot)
* [Access to upload custom plugins](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#managing-custom-plugins)
* [Microsoft Sentinel Workspace](https://learn.microsoft.com/en-us/azure/sentinel/quickstart-onboard) created.
* Microsoft Sentinel [GCP Audit Logs Connector](https://learn.microsoft.com/en-us/azure/sentinel/connect-google-cloud-platform?tabs=terraform%2Cauditlogs) enabled.
* Parameters for KQL Plugin - Microsoft Sentinel Workspace Name, Subscription ID, Resource Group Name and Entra Tenant ID

### Instructions
#### Upload the Custom Plugin

1. Obtain the file [KQL-Sentinel-GCP.yaml](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Microsoft%20Sentinel%20Custom%20Plugin%20Scenarios/GCP%20Audit%20Logs/KQL-Sentinel-GCP.yaml) from this directory.
2. Modify the yaml file to specify your specific Entra TentantId, SubscriptionId, ResourceGroupName and WorkspaceName for your Sentinel instance.



3. [Upload the custom plugin](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#add-custom-plugins) and verify it's activated.

### Plugin Utilization

Here's some sample queries you can utilize to trigger this plugin - You can mix and match UPN or IP Address (or both) parameters, but always include a time and date range.

* Can you describe in detail over a few paragraphs the GCP Audit Log operations associated with user@contoso.com over the last 90 days??
* Can you describe in detail over a few paragraphs the GCP Audit Log operations associated with the ip 165.234.23.52 between March 4, 2024 and March 7, 2024?

![O365Logs](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Images/gcp-masked.png)

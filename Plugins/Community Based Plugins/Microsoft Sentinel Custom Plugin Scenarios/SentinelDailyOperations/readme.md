# Security Copilot Custom Plugin - Sentinel KQL - SentinelDailyOperations

### Pre-requisites

* [Security Copilot Enabled](https://learn.microsoft.com/en-us/security-copilot/get-started-security-copilot#onboarding-to-microsoft-security-copilot)
* [Access to upload custom plugins](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#managing-custom-plugins)
* [Microsoft Sentinel Workspace](https://learn.microsoft.com/en-us/azure/sentinel/quickstart-onboard) created.
* Parameters for KQL Plugin - Microsoft Sentinel Workspace Name, Subscription ID, Resource Group Name and Entra Tenant ID

### Instructions
#### Upload the Custom Plugin

1. Obtain the file [KQL_SentinelDailyOperationsSample.yaml](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Microsoft%20Sentinel%20Custom%20Plugin%20Scenarios/SentinelDailyOperations/KQL_SentinelDailyOperationsSample.yml) from this directory.
2. Modify the yaml file to specify your specific Entra `TentantId`, `SubscriptionId`, `ResourceGroupName` and `WorkspaceName` for your Sentinel instance.
3. Upload the custom plugin
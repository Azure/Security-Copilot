# Creating a Security Copilot KQL Plugin to Query Sentinel Watchlists

## Utilize the information you maintain in Microsoft Sentinel Watchlists in Security Copilot.

### Pre-requisites

-   [Security Copilot Enabled](https://learn.microsoft.com/en-us/security-copilot/get-started-security-copilot#onboarding-to-microsoft-security-copilot)
-   [Access to upload custom plugins](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#managing-custom-plugins)
-   [Microsoft Sentinel Workspace](https://learn.microsoft.com/en-us/azure/sentinel/quickstart-onboard) created.
-   Parameters for KQL Plugin - Microsoft Sentinel Workspace Name, Subscription ID, Resource Group Name and Entra Tenant ID

### Instructions

#### Upload the Custom Plugin

1.  Obtain the file KQL_Plugin_Watchlist.yaml from this directory.
2.  Modify the yaml file to specify your specific Entra TentantId, SubscriptionId, ResourceGroupName and WorkspaceName for your Sentinel instance.
3.  Modify the KQL query to reference the Microsoft Sentinel Watchlist for which you want Security Copilot to access.
4.  Upload the custom plugin

For more information, see: [Creating a Security Copilot KQL Plugin to Query Sentinel Watchlists](https://rodtrent.substack.com/p/creating-a-copilot-for-security-kql)

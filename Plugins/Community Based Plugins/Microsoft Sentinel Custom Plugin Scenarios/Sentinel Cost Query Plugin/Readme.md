# Security Copilot Custom Plugin - Sentinel KQL - Sentinel Costs

#### Security Copilot Plugin to run a Dynamic KQL Query to estimate Microsoft Sentinel Costs for a specific time and date range by running a KQL query against the Usage table in Microsoft Sentinel.

### Pre-requisites

* [Security Copilot Enabled](https://learn.microsoft.com/en-us/security-copilot/get-started-security-copilot#onboarding-to-microsoft-security-copilot)
* [Access to upload custom plugins](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#managing-custom-plugins)
* [Microsoft Sentinel Workspace](https://learn.microsoft.com/en-us/azure/sentinel/quickstart-onboard) created.
* Parameters for KQL Plugin - Microsoft Sentinel Workspace Name, Subscription ID, Resource Group Name and Entra Tenant ID

### Instructions
#### Upload the Custom Plugin

1. Obtain the file [KQL-Sentinel-SentinelCost.yaml](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Microsoft%20Sentinel%20Custom%20Plugin%20Scenarios/Sentinel%20Cost%20Query%20Plugin/KQL-SentinelCost.yaml) from this directory.
2. Modify the yaml file to specify your specific Entra TentantId, SubscriptionId, ResourceGroupName and WorkspaceName for your Sentinel instance. You can also modify the KQL query at the bottom of the plugin to adjust your specific $ Per GB rate for Sentinel data ingestion (size * 4.3).



3. [Upload the custom plugin](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#add-custom-plugins) and verify it's activated.

![CopilotForSecurity](https://learn.microsoft.com/en-us/security-copilot/media/add-plugin-button.png)

### Plugin Utilization

Here's some sample queries you can utilize to trigger this plugin - Always include a time and date range.

* Can you lookup what my Sentinel costs were in the past 7 days?
* Can you provide me a summary of my total Sentinel costs between March 1, 2024 and March 15, 2024?
* Can you provide a detailed summary of my total Sentinel costs for the past 90 days? Be sure to explain what each table is used for within Sentinel and the security value it provides. Also total up all the costs to give me an average monthly cost. Also be sure to give any cost saving recommendations based on my data ingestion.

![O365Logs](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Images/sentinel-cost.png)
![O365Logs](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Images/sentinel-cost-2%20.png)

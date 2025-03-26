
# Copilot for Security Custom Plugin - Sentinel Entities on MITRE

#### Copilot for Security Plugin to Summarize Microsoft Sentinel Entities across MITRE tactics for a specified time and date range.

### Pre-requisites

* [Copilot for Security Enabled](https://learn.microsoft.com/en-us/security-copilot/get-started-security-copilot#onboarding-to-microsoft-security-copilot)
* [Access to upload custom plugins](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#managing-custom-plugins)
* [Microsoft Sentinel Workspace](https://learn.microsoft.com/en-us/azure/sentinel/quickstart-onboard) created.
* Parameters for KQL Plugin - Microsoft Sentinel Workspace Name, Subscription ID, Resource Group Name and Entra Tenant ID

### Instructions
#### Upload the Custom Plugin

1. Obtain the file [KQL-Sentinel-Entities-on-MITRE.yaml](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Sentinel%20Entities%20on%20MITRE/KQL-Sentinel-Entities-on-MITRE.yaml) from this directory.
2. Modify the yaml file to specify your specific Entra TentantId, SubscriptionId, ResourceGroupName and WorkspaceName for your Sentinel instance. You can also modify the KQL query at the bottom of the plugin to adjust your specific $ Per GB rate for Sentinel data ingestion (size * 4.3).

![KQLConnection](https://github.com/SCStelz/CopilotForSecurity/blob/main/Images/kql-connection.png)

3. [Upload the custom plugin](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#add-custom-plugins) and verify it's activated.

![CopilotForSecurity](https://learn.microsoft.com/en-us/security-copilot/media/add-plugin-button.png)

### Plugin Utilization

Here's some sample queries you can utilize to trigger this plugin - Always include a time and date range.

* Please share sentinel entities on MITRE for last 30 days in a tabular format
* Please share sentinel entities on MITRE for last 30 days
* Cloud you please provide sentinel entities on MITRE for since April 1st in a tabular format


![image](https://github.com/samikroy/Copilot-For-Security/assets/20562985/b38bf92d-8b0a-40c3-acae-50ec8d6b7c6d)


![image](https://github.com/samikroy/Copilot-For-Security/assets/20562985/fd3a2849-8148-4743-b6cb-66f051e286d7)


![image](https://github.com/samikroy/Copilot-For-Security/assets/20562985/9f13440d-1a0f-4a63-862b-d7b166595d38)


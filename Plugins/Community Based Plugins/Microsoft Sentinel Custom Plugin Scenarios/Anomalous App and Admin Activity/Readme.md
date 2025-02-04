# Security Copilot Custom KQL Plugin - Detect Anomalous App and User Activty using Microsoft Sentinel UEBA Insights

#### Security Copilot Plugin to that brings in data from Microsoft Sentinel UEBA insights focussed on anomalies related to Applications and administrative user activity. For details refer to this blog: 
 [link](https://techcommunity.microsoft.com/t5/microsoft-security-copilot-blog/harnessing-the-power-of-kql-plugins-for-enhanced-security/ba-p/4221891)

### Pre-requisites

* [Security Copilot Enabled](https://learn.microsoft.com/en-us/security-copilot/get-started-security-copilot#onboarding-to-microsoft-security-copilot)
* [Access to upload custom plugins](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#managing-custom-plugins)
* [Microsoft Sentinel Workspace](https://learn.microsoft.com/en-us/azure/sentinel/quickstart-onboard) created.
* [Microsoft Sentinel UEBA enabled](https://learn.microsoft.com/en-us/azure/sentinel/identify-threats-with-entity-behavior-analytics)
* Parameters for KQL Plugin - Microsoft Sentinel Workspace Name, Subscription ID, Resource Group Name and Entra Tenant ID

### Instructions
#### Upload the Custom Plugin

1. Obtain the file [AnomalousAppandUserActivity.yaml](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Microsoft%20Sentinel%20Custom%20Plugin%20Scenarios/Anomalous%20App%20and%20Admin%20Activity/AnomalousAppandAdminActivity.yaml) from this directory.
2. Modify the KQL query as needed to suit your specific requirements. One such edit might be your Time Zone as converted in this line:  | where datetime_utc_to_local(TimeGenerated, "US/Eastern") between ( fromDateTime .. toDateTime ).


3. [Upload the custom plugin](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#add-custom-plugins) and enter your Tenant ID, Subscription ID, Workspace name, Resource group that hosts your Sentinel worksapce in the resulting dialog box.  Verify that the plugin is activated.

![CopilotForSecurity](https://learn.microsoft.com/en-us/security-copilot/media/add-plugin-button.png)


4. [Enter your workspace details in the Security Copilot UI](https://github.com/Azure/Copilot-For-Security/blob/main/Images/KQL Plugin images/Workspacedetails.png)




# Security Copilot Custom Plugin - ADX KQL - Get Entra Sign-in Logs from Azure Data Explorer

#### Security Copilot Plugin to retrieve Entra ID Sign-in logs from an Azure Data Explorer cluster.

### Pre-requisites

* [Security Copilot Enabled](https://learn.microsoft.com/en-us/security-copilot/get-started-security-copilot#onboarding-to-microsoft-security-copilot)
* [Access to upload custom plugins](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#managing-custom-plugins)
* [An Azure Data Explorer cluster](https://techcommunity.microsoft.com/t5/microsoft-sentinel-blog/using-azure-data-explorer-for-long-term-retention-of-microsoft/ba-p/1883947) with Entra ID Sign in logs exported from the Signinlogs table in Sentinel to ADX

### Instructions
#### Upload the Custom Plugin

1. Obtain the file [KQL-ADX-SignInLogs.yaml](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Microsoft%20Sentinel%20Custom%20Plugin%20Scenarios/HuntSignInLogs-ADX/KQL-ADX-SignInLogs.yaml) from this directory.
2. Modify the .yaml file and specify your *ADX Cluster URL*, your *ADX Database* and your *Entra TenantId* parameters.
  
3. [Upload the custom plugin](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#add-custom-plugins) and verify it's activated.

![CopilotForSecurity](https://learn.microsoft.com/en-us/security-copilot/media/add-plugin-button.png)

### Plugin Utilization

Here's some sample queries you can utilize to trigger this plugin - You can mix and match UPN or IP Address (or both) parameters, but always include a time and date range.

 * Can you describe the Sign in log results in detail from the ADX Long Term Archive store over a few paragraphs for user@contoso.com between Oct 23, 2023 and Oct 27, 2023?
* Can you describe the Sign in log results in detail from the ADX Long Term Archive store over a few paragraphs for the IP 165.87.34.123 in the last 30 days?
 * Can you describe in detail the sign-in's where Conditional Access status was a failure from the ADX Long Term Archive store for user@contoso.com during December 2023?  Be sure to include timestamps for the sign-in activities.
<br>

![ADX](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Images/adx-masked.png)

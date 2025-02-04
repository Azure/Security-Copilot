# Security Copilot Custom Plugin - API - Get IP Information from IP Quality Score

#### Security Copilot Plugin to gather type, location, reputation score, and abuse velocity for an IP Address using IP Quality Score

### Pre-requisites

* [Security Copilot Enabled](https://learn.microsoft.com/en-us/security-copilot/get-started-security-copilot#onboarding-to-microsoft-security-copilot)
* [Access to upload custom plugins](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#managing-custom-plugins)
* [API Key](https://www.ipqualityscore.com/proxy-vpn-tor-detection-service) from IP Quality Score

### Instructions
#### Upload the Custom Plugin

1. Obtain the file [ipqs-manifest.yaml](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/IPQualityScore/ipqs-manifest.yaml) from this directory.
2. [Upload the custom plugin](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#add-custom-plugins) and verify it's activated.
3. After plugin upload put in your [IPQS API Key](https://learn.microsoft.com/en-us/security-copilot/plugin_api#configure-authentication-1).

![CopilotForSecurity](https://learn.microsoft.com/en-us/security-copilot/media/add-plugin-button.png)

### Plugin Utilization

Here's some sample queries you can utilize to trigger this plugin

* Summarize the information for the IP 1.1.1.1 from IPQS
* Summarize the information for the IP 4.4.4.4 from IPQS as bullet points
* Give me the location, ISP and reputation score of the IP address 8.8.8.8 from IPQS in form of a table
<br>
<img src="https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Images/ipqs-example-screenshot-1.png"/>
<br>
<img src="https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Images/ipqs-example-screenshot-2.png"/>

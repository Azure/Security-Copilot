# Security Copilot Custom Plugin - API - Get User Account Breach Information from Have I Been Pwned

#### Security Copilot Plugin to gather list of breaches for a user account using Have I Been Pwned

### Pre-requisites

* [Security Copilot Enabled](https://learn.microsoft.com/en-us/security-copilot/get-started-security-copilot#onboarding-to-microsoft-security-copilot)
* [Access to upload custom plugins](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#managing-custom-plugins)
* [API Key](https://haveibeenpwned.com/API/Key) from Have I Been Pwned

### Instructions
#### Upload the Custom Plugin

1. Obtain the file [hibp-manifest.yaml](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/HaveIBeenPwned/hibp-manifest.yaml) from this directory.
2. [Upload the custom plugin](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#add-custom-plugins) and verify it's activated.
3. After plugin upload put in your [Have I Been Pwned API Key](https://learn.microsoft.com/en-us/security-copilot/plugin_api#configure-authentication-1).

![CopilotForSecurity](https://learn.microsoft.com/en-us/security-copilot/media/add-plugin-button.png)

### Plugin Utilization

Here's some sample queries you can utilize to trigger this plugin
Note: you can use the keyword 'Have I Been Pwned' or 'HIBP' in your queries

* Check if the user test@email.com is part of any data breaches from Have I Been Pwned
* Give me the list of breaches for the user test@email.com from Have I Been Pwned as bullet points
* Summarize the list of data breaches for the user test@email.com from Have I Been Pwned
<br>
<img src="https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Images/hibp-example-screenshot.png"/>

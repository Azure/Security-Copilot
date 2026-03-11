# Copilot for Security Custom Plugin - API - CrowdStrike Falcon API

#### Copilot for Security Plugin to query alerts, hosts, IoCs and incidents from CrowdStrike Falcon

### Pre-requisites

* [Copilot for Security Enabled](https://learn.microsoft.com/en-us/security-copilot/get-started-security-copilot#onboarding-to-microsoft-security-copilot)
* [Access to upload custom plugins](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#managing-custom-plugins)
* [Client ID/Client Secret](https://falcon.us-2.crowdstrike.com/documentation/page/a2a7fc0e/crowdstrike-oauth2-based-apis) from CrowdStrike document

### Instructions
#### Upload the Custom Plugin

1. Get URL of Manifest file from Copilot for Security Github Repository
2. Upload the custom plugins [Setting up custom plugin guide](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#add-custom-plugins)
3. Config Client Secret and Client ID for authentication [CrowdStrike Falcon API Key](https://learn.microsoft.com/en-us/security-copilot/plugin_api#configure-authentication-1)
![CFS](https://raw.githubusercontent.com/truongphung12947/copilot-manifest/main/crowdstrike-falcon/Screenshot%20from%202024-07-18%2009-33-58.png)


4. Activate plugin
![CFS](https://raw.githubusercontent.com/truongphung12947/copilot-manifest/main/crowdstrike-falcon/Screenshot%20from%202024-07-17%2017-06-46.png)
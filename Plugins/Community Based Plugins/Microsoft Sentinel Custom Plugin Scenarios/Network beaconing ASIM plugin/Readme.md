# Security Copilot Plugin: Leveraging Security Copilot with ASIM-based KQL plugins for investigation scenarios

### **Bring in insights from Microsoft Sentinel using source-agnostic queries based on ASIM - Advanced Security Information Model**

### Pre-requisites

-   [Security Copilot Enabled](https://learn.microsoft.com/en-us/security-copilot/get-started-security-copilot#onboarding-to-microsoft-security-copilot)
-   [Access to upload custom plugins](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#managing-custom-plugins)
-   [Microsoft Sentinel Workspace](https://learn.microsoft.com/en-us/azure/sentinel/quickstart-onboard) created.
-   Parameters for KQL Plugin - Microsoft Sentinel Workspace Name, Subscription ID, Resource Group Name and Entra Tenant ID

### Instructions

#### Upload the Custom Plugin

1.  Obtain the file PotentialNetworkBeaconingActivity.yaml from this directory.
2.  Upload the custom plugin
3.  Input your specific Entra TentantId, SubscriptionId, ResourceGroupName and WorkspaceName in the resulting dialog box within Security Copilot

### Link to blog post

Refer to the blog in this [link](https://techcommunity.microsoft.com/blog/securitycopilotblog/leveraging-asim-based-kql-plugins-in-microsoft-security-copilot-for-investigatio/4357680)

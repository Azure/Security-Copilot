# Attack Paths Analysis with Defender CSPM in Defender for Cloud (Custom Plugin for Security Copilot) 

The skill in this custom pluging allows to retrieve the list of "Attack Paths" identified the Defender CSPM (Cloud Security Posture Management) feature of Microsoft Defender for Cloud in the protected Azure, AWS and GPC cloud environments.


### Prerequisites:
* Defender CSPM with Attack Paths enabled in Defender for Cloud (https://learn.microsoft.com/en-us/azure/defender-for-cloud/how-to-manage-attack-path)
* Continuous Export enabled in Defender for Cloud (https://learn.microsoft.com/en-us/azure/defender-for-cloud/continuous-export)


### Instructions: 
1. Download the YAML file in this folder. Save it locally in your PC and open in for editing its content
2. Set the values for these parameters: 
    * TenantId: [Write your Tenant Id]
    * SubscriptionId: [Write your Subscription Id]
    * ResourceGroupName: [Write the name of your resource group]
    * WorkspaceName: [Write the name of your Log Analytics or Sentinel workspace] 
3. Add the plugin by uploading the YAML in Security Copilot (https://learn.microsoft.com/en-us/copilot/security/manage-plugins?tabs=securitycopilotplugin)


### Additional references: 
* [Operationalizing Attack Path Insights](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/operationalizing-attack-path-insights/ba-p/4121643), by Giulio Astori
* [Sharing my first experiences on how to build custom KQL plugins for Security Copilot](https://www.linkedin.com/feed/update/urn:li:activity:7199175292278505472/), my blog post on how this plugin was designed and developed

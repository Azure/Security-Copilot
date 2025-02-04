# Security Copilot Custom Plugin - KQL - DevSecOps with Defender for Cloud (based on GhAS and GAzDO)

This custom plugins contains two skills: 
* The first skill (GetNewDevSecOpsAlertsInTheLastTimespan) returns the list of new alerts related to DevSecOps and generated within a user-defined past period, relative to the current timestamp. The user must specificy the timespan to consider in the past (e.g. 1d for 1 day, 4h for 4 hours, etc...). Only new alerts are shown: if an alert is repeated but was already fired with the same identical information in a period of time before the considered timespan, then this alert is not returned. 
* The second skill (GetDevSecOpsAlertsInTheLastTimespan) returns the list of all the unique alerts related to DevSecOps and generated within a user-defined past period, relative to the current timestamp. The user must specificy the timespan to consider in the past (e.g. 1d for 1 day, 4h for 4 hours, etc...). All alerts are considered but they are listed only once, considering all their details (name of the alert, target resources, ect...). Additionally, for each of these unique alerts, the query returns the timestamp (within the considered timespan) of the first and last occurrence as well as the number of occurrences.

### Prerequisites:
* DevOps Security enabled in Defender for Cloud (https://learn.microsoft.com/en-us/azure/defender-for-cloud/devops-support)
* Continuous Export enabled in Defender for Cloud (https://learn.microsoft.com/en-us/azure/defender-for-cloud/continuous-export)

### Notes: 
* The DevSecOps alerts returned by these skills are produced by Code Scanning (SAST by CodeQL), Dependency Scanning (SCA), Secrets Scanning  and Infrastructure as Code (IaC) Scanning. Code Scanning, Dependency Scanning and Secrets Scanning are made available by GitHub Advanced Security (GhAS) in GitHub and GitHub Advanced Security for Azure DevOps (GAzDO) in Azure DevOps. Infrastructure as Code (IaC) Scanning is made available by enabling the DevOps Security capability of Defender for Cloud (Defender CSPM) in GitHub or Azure DevOps.
* DevOps Security in Defender for Cloud supports also GitLab Enterprise environments but the KQL in this plugin doesn't support this source 


### Instructions: 
1. Download the YAML file in this folder. Save it locally in your PC and open in for editing its content
2. Set the values for these parameters: 
    * TenantId: [Write your Tenant Id]
    * SubscriptionId: [Write your Subscription Id]
    * ResourceGroupName: [Write the name of your resource group]
    * WorkspaceName: [Write the name of your Log Analytics or Sentinel workspace] 
   Note: these parameters should be set in both skills defined in the YAML file.
3. Add the plugin by uploading the customized YAML in Security Copilot (https://learn.microsoft.com/en-us/copilot/security/manage-plugins?tabs=securitycopilotplugin)

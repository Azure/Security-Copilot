# SecurityCopilot-Sentinel-Incident-Investigation
**Author: Pratik Lal, Innocent Wafula, Stefano Pescosolido**

## Overview

This Logic App automates incident investigation within Microsoft Sentinel using the Microsoft Security Copilot prompt and built-in skills. It is designed to:
- Read Microsoft Sentinel incident entities.
- Process and normalize the entities.
- Submit prompts to Security Copilot to analyze each entity type.
- Summarize the outputs in a predefined format.
- Update the Microsoft Sentinel incident comments for the incident investigator to review.

By leveraging this Logic App, Security Operations Center (SOC) and incident response teams can significantly reduce investigation time, gain consistent analysis outputs, and enhance their incident response process.

## Prerequisites
- The user or service principal deploying this logic app should have Contributor role on the Azure Resource Group.
- Microsoft Security Copilot should be enabled on the Azure tenant.
- The user should have access to Microsoft Security Copilot to submit prompts by authenticating to Microsoft Security Copilot connector within the logic app.
- Microsoft Sentinel workspace should be set up.
- Get AbuseIPDB API key to perform IP address reputation check. [Learn more.](https://learn.microsoft.com/en-us/copilot/security/plugin-abuseipdb)
- Enable ProcessAnalyzer, GetEntraUserDetails, GetIntuneDevices and AbuseIPDB skills from copilot settings.


## Deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FSecurity-Copilot%2Fmain%2FLogic%2520Apps%2FSecurityCopilot-Sentinel-Incident-Investigation%2Fazuredeploy.json" target="_blank">
<img src="https://aka.ms/deploytoazurebutton"/>
</a>
<br>

## Post-Deployment
- Authenticate Microsoft Sentinel and Security Copilot connectors within the logic app. You can choose Oauth, Service principal or Managed identity based authentication for Microsoft Sentinel trigger.
     <br>
     <img src="https://github.com/pratik-lal/Security-Copilot/blob/SecurityCopilot-Sentinel-Incident-Investigation/Logic%20Apps/SecurityCopilot-Sentinel-Incident-Investigation/images/sentinel-trigger-authentication.png"/></br>
- Choose Client Certificate Auth or Oauth (using user account that can submit prompts) to create connection with Microsoft Security Copilot logic app connector.
     <br>
     <img src="https://github.com/pratik-lal/Security-Copilot/blob/SecurityCopilot-Sentinel-Incident-Investigation/Logic%20Apps/SecurityCopilot-Sentinel-Incident-Investigation/images/copilot-for-security-authentication.png"/>
     </br>
- Assign the role of 'Microsoft Sentinel Responder' to the Managed Identity of the Logic App within the Resource Group that contains the Sentinel's Log Analytics workspace.  
- Set the values for the Logic App parameters  
<img src="./images/params.png"/>
- Automate Sentinel incident investigation by adding the Logic App to Microsoft Sentinel automation rule. Alternatively, this logic app can be called on-demand by right-clicking on a Sentinel incident, choose **Run Playbook** option.

## Microsoft Security Copilot skills
- Following built-in skills are being used to perform investigation on a given incident entity type

| Incident entity | Security Copilot skill |
| --------------- | -------------------------- |
| Process name / commandline | ProcessAnalyzer |
| Account name | GetEntraUserDetails |
| Device name | GetIntuneDevices |
| IP address | AbuseIPDB |
| Indicator of Compromise (IoC) | GetReputationsForIndicators |


## Incident Investigation Template
- Automated incident investigation summary is structured in following order. Modify the prompt to re-order or change the investigation template.
    - Incident overview:
    - Incident description:
    - Analysis on incident entities:
    - Possible mitigation steps:
    - Conclusion
<br>
<img src="https://github.com/pratik-lal/Security-Copilot/blob/SecurityCopilot-Sentinel-Incident-Investigation/Logic%20Apps/SecurityCopilot-Sentinel-Incident-Investigation/images/copilot-for-security-investigation-prompt.png"/>
</br>

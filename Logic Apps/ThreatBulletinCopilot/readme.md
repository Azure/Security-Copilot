# Security Copilot-ThreatBulletin
Author: Sean Wasonga
## Overview
This playbook serves as a cornerstone for Security Copilot, facilitating integration with Microsoft Defender Threat Intelligence (MDTI) to swiftly provide the latest threat bulletins for threat articles. By consolidating this connection, users can efficiently access comprehensive threat article information. Over time, this foundational playbook may expand to incorporate additional capabilities. 

## Pre-deployment Instructions

Prior to beginning the installation process, it's crucial to confirm that you have met the following prerequisites:
- The user that will deploy this Logic app need to have a Contributor Role.
- You enabled the Security Copilot license on your tenant
- The user authenticated within the CoPilot logic app action and has permission to send emails.
- Define the email you want the daily logic app to be sent too

## Deployment

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FSecurity-Copilot%2Fmain%2FLogic%2520Apps%2FThreatBulletinCopilot%2Fazuredeploy.json" target="_blank">
    <img src="https://aka.ms/deploytoazurebutton"/>

</a>


### Post-Deployment Instructions

1. Select the freaquency on how many times you want the Logic App to run 
2. Authenticate the Copilot Prompts with a User that has Access to Security Copilot 
3. Proceed to run the Logic app and Prepare for the results 

Logic App View
![Threat Bulletin Logic App](https://github.com/Azure/Copilot-For-Security/blob/main/Logic%20Apps/ThreatBulletinCopilot/threatbulletinlogicapp.png)

Results of the Logic APP
![Threat Bulletin Image](https://github.com/Azure/Copilot-For-Security/blob/main/Logic%20Apps/ThreatBulletinCopilot/Threatbulletin.png)

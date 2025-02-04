# Security Copilot-ThreatActor
Author: Sean Wasonga
## Overview
This playbook emphasizes the capability to conduct thorough threat actor profiling, search for associated threat articles, CVEs, and perform comprehensive hunting across your environment. By leveraging Security Copilot's integration with Microsoft Defender Threat Intelligence (MDTI), users can efficiently gather intelligence on threat actors, associated articles, and CVEs, enhancing their understanding of potential threats. Additionally, the playbook facilitates proactive investigation by summarizing the findings from hunting activities, empowering users to strengthen their security posture. As this foundational playbook evolves, it aims to further enhance threat intelligence gathering and investigation capabilities.

## Pre-deployment Instructions

Prior to beginning the installation process, it's crucial to confirm that you have met the following prerequisites:
- The user that will deploy this Logic app need to have a Contributor Role.
- You enabled the Security Copilot license on your tenant
- The user authenticated within the CoPilot logic app action and has permission toaccess M365 Defender environment 
- The user authenticated within the CoPilot logic app action and has permission to send emails.

Define the email you want the daily logic app to be sent too

## Deployment

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FSecurity-Copilot%2Fmain%2FLogic%2520Apps%2FThreatactorCopilot%2Fazuredeploy.json" target="_blank">
  <img src="https://aka.ms/deploytoazurebutton"/>
</a>


### Post-Deployment Instructions

1. Select the freaquency on how many times you want the Logic App to run 
2. Authenticate the Copilot Prompts with a User that has Access to Security Copilot 
3. Make sure you define the Threat actor you want to leverage in the playbook . For example this one comes preset with APT 28
3. Proceed to run the Logic app and Prepare for the results 


Results of the Logic APP
![Threat Actor](https://github.com/KwachSean/SecurityCopilot/raw/main/playbooks/ThreatactorCopilot/threatactor.png)


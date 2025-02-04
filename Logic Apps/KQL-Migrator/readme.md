# Security-Copilot-KQLMigrator
Author: Hiten Sharma and Hesham Abdelaal
## Overview
This playbook emphasizes the capability to convert and migrate custom SIEM, EDR/XDR queries and rules to KQL.

## Pre-deployment Instructions

Prior to beginning the installation process, it's crucial to confirm that you have met the following prerequisites:
- The user that will deploy this Logic app need to have a Contributor Role.
- You enabled the Security Copilot license on your tenant
- The user authenticated within the CoPilot logic app action and has permission to access M365 Defender / Microsoft Sentinel environment 
- The user authenticated within the CoPilot logic app action and has permission to create and manage Analytics rules in Microsoft Sentinel


## Deployment

 <a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FCopilot-For-Security%2Fmain%2FLogic%2520Apps%2FKQL-Migrator%2FKQLMigratorPlaybook-SecCopilot.json" target="_blank">
  <img src="https://aka.ms/deploytoazurebutton"/>
</a>

you environement settings.


### Post-Deployment Instructions

1. Select the frequency on how many times you want the Logic App to run 
2. Authenticate the Copilot Prompts with a User that has Access to Security Copilot 
3. Make sure you upload and define the watchlist item from Microsoft Sentinel (two examples provided one for AQL queries and the other for YARA rules) you want to leverage in the playbook and app registeration if you want to automate creating Microsoft Sentinel analytics rules via the playbook, remember that you might need to edit the Logic App playbook with the watchlist required ones.
3. Proceed to run the Logic app and Prepare for the results 


Results of the Logic APP
![KQLMigrator](https://github.com/Azure/Security-Copilot/blob/main/Logic%20Apps/KQL-Migrator/KQLMigratorPlaybook.png)



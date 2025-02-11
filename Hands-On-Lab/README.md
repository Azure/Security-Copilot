# Welcome to Security Copilot Hands On Lab

![Security CoPilot Logo](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)

Authors - Jamil Mirza & Sean Wesonga
## Introduction

These labs will help you to get ramped up with Microsoft Security Copilot and provide hands-on practical experience for product features, capabilities, and scenarios.

The lab deploys a Microsoft Azure Resource Group, a Microsoft Security Copilot workspace, and a Microsoft Sentinel workspace and ingests pre-recorded data to simulate scenarios that showcase various Microsoft Security Copilot features. To complete the Beginner & Advanced modules you should expect a cost no more than $150 for Security Compute Units (SCU) and this will allow you to complete the scenarios in under 3 hours (for up to 3 users). The SCUs must be removed to ensure there is no additional cost. The additional modules will cost an extra $150 and a further 2 hours of your time. The SCUs must be removed once complete, to ensure there is no additional cost.

**NOTE:** If for any reason you cannot complete the lab and would like to resume at a later date please [click here](Modules/Deleting-SCU.md#exercise-1---delete-scu-capacity) for instructions to delete the environment immediately to stop SCU costs. If you would like to resume at a later date then you can complete Module 1, Exercise 1.

## Prerequisites 
### Beginner and Advanced Modules
- To deploy the Microsoft Security Copilot, you must have a Microsoft Azure subscription. If you do not have an existing Azure subscription, you can sign up for a free trial [here](https://azure.microsoft.com/free/) with a work/business email.
- 3 hours of your uninterrupted time to work through the scenarios as SCUs cannot be paused (Additional Modules will require more time & SCU's).
- Note: The Beginner & Advanced modules only guides you through standalone Security Copilot scenarios and not the embedded experience. For the embedded experience you can complete the Additional Modules (this will require additional SCU's) or to read more about the embedded experience please click [here](https://learn.microsoft.com/en-us/copilot/security/experiences-security-copilot)
<!--- - Permissions to create a resource group in your Azure subscription --->
- Note: Installing Security Copilot and Sentinel needs Global Admin for the very first time in a Subscription.

### Additional Modules
- To deploy the Microsoft Security Copilot, you must have a Microsoft Azure subscription.
- Security Copilot must exist on the same tenant as the Microsoft first Party products  
- You must have licenses for the products in the additional modules
- Note: When working through the advanced modules, you will need access to other Microsoft first party products. Therefore, Security Copilot will be accessing live company data. For more information about how Security Copilot handles privacy and data please click [here](https://learn.microsoft.com/en-us/copilot/security/privacy-data-security)
<!--- - Permissions to create a resource group in your Azure subscription --->
- Note: Installing Security Copilot needs Global Admin for the very first time in a Subscription.
## Getting Started

All the [modules](Modules) that are part of this lab are listed below. Although in general they can be completed in any order, you must start with [Module 1](Modules/Module-1-Setting-up-the-environment.md) as this deploys the lab environment itself.

### Modules

| Level    | Modules | Time Taken |
|----------|---------|------------|
| Beginner | [Module 1 - Setting up the environment](Modules/Module-1-Setting-up-the-environment.md) <br> [Module 2 - How to analyze a script using Security Copilot](Modules/Module-2-Script-analysis.md) <br> [Module 3 - How to leverage Threat Intelligence using Security Copilot](Modules/Module-3-Threat-intelligence-scenarios.md) <br> [Module 4 - Leveraging Security Copilot for data summarization and reports](Modules/Module-4-Summarization-of-data.md) | 1 hour |
| Advanced | [Module 5 - Using KQL in Security Copilot](Modules/Module-5-Generating-KQL-queries.md) <br> [Module 6 - Knowledge base in Security Copilot](Modules/Module-6-Knowledge-base-in-Copilot-for-Security.md) <br> [Module 7 - Microsoft Sentinel Security Copilot Scenarios](Modules/Module-7-Microsoft-Sentinel-Copilot-For-Security-Scenarios.md) <br> [Module 8 - Automation with Logic Apps](Modules/Module-8-Automation-with-Logic-Apps.md) <br>  | 2 hours |
| Additional Modules | [Add more SCUs to complete the Additional Modules](Modules/AdditionalSCUs.md) <br> [Module 9 - Embedded Features in Microsoft Defender](Modules/Module-9-Embedded-Features-in-Microsoft-Defender.md) <br> [Module 10 - Embedded Features in Microsoft Purview](Modules/Module-10-eDiscovery-Search-in-Microsoft-Purview.md) <br> [Module 11 - Embedded Features in Microsoft Intune](Modules/Module-11-Embedded-Features-in-Microsoft-Intune.md) <br> [Module 12 -Embedded Features in Microsoft Entra](Modules/Module-12-Embedded-Features-in-Microsoft-Entra.md) <br>  | 2 hours |
| SCU Delete Module | [Deleting the SCU Capacity](Modules/Deleting-SCU.md) | 10 mins
| Survey | [Feedback Form](https://forms.office.com/r/UbeFd7uuBc)

## Modules

[**Module 1 - Setting up the environment**](Modules/Module-1-Setting-up-the-environment.md)
- [Exercise 1 - Deploy Security Copilot](Modules/Module-1-Setting-up-the-environment.md#exercise-1-deploy-copilot-for-security)
<!--- - [Exercise 2 - Deploy the SCU timer Logic App](Modules/Module-1-Setting-up-the-environment.md#exercise-2-deploy-the-scu-timer-logic-app) (**NOTE:** This step is important to make sure the SCUs are automatically removed after 3 hours, so you won't incur any additional costs.)--->


[**Module 2 - How to analyze a script using Security Copilot**](Modules/Module-2-Script-analysis.md)
- [Exercise 1 - Log into your Security Copilot instance](Modules/Module-2-Script-analysis.md#exercise-1--using-the-script-analysis-promptbook)
- [Exercise 2 - Custom Prompts to Investigate Script Analysis](Modules/Module-2-Script-analysis.md#exercise-2-custom-prompts-to-investigate-script-analysis)
- [Exercise 3 - Using the Security Copilot to Decode a Script](Modules/Module-2-Script-analysis.md#exercise-3--using-the-copilot-for-security-to-decode-a-script)

[**Module 3 - How to leverage Threat Intelligence using Security Copilot**](Modules/Module-3-Threat-intelligence-scenarios.md)
- [Exercise 1 - Get Recent Threat Intelligence](Modules/Module-3-Threat-intelligence-scenarios.md#exercise-1-get-recent-threat-intelligence)
- [Exercise 2 - Get Information on Vulnerabilities (CVEs)](Modules/Module-3-Threat-intelligence-scenarios.md#exercise-2-get-information-on-vulnerabilities-cves)
- [Exercise 3 - Use Threat Intelligence to Get Information on Threat Actors](Modules/Module-3-Threat-intelligence-scenarios.md#exercise-3-use-threat-intelligence-to-get-information-on-threat-actors)

[**Module 4 - Leveraging Security Copilot for data summarization and reports**](Modules/Module-4-Summarization-of-data.md)
- [Exercise 1 - Summarization of vulnerability Data](Modules/Module-4-Summarization-of-data.md#exercise-1---summarization-of-vulnerability-data)
- [Exercise 2 - Using Security Copilot for reports](Modules/Module-4-Summarization-of-data.md#exercise-2---using-copilot-for-security-for-reports)

[**Module 5 - Using KQL in Security Copilot**](Modules/Module-5-Generating-KQL-queries.md)
- [Exercise 1 - Using Security Copilot to Generate queries](Modules/Module-5-Generating-KQL-queries.md#exercise-1-using-copilot-for-security-to-generate-queries)
- [Exercise 2 - Leveraging Security Copilot to Explain KQL Queries](Modules/Module-5-Generating-KQL-queries.md#exercise-2-leveraging-copilot-for-security-to-explain-kql-queries)

[**Module 6: Knowledge base in Security Copilot**](Modules/Module-6-Knowledge-base-in-Copilot-for-Security.md)
- [Exercise 1 - Upload a File to Security Copilot](Modules/Module-6-Knowledge-base-in-Copilot-for-Security.md#exercise-1-upload-a-file-to-copilot-for-security)
- [Exercise 2 - Prompting for an Uploaded File in Security Copilot](Modules/Module-6-Knowledge-base-in-Copilot-for-Security.md#exercise-2-prompting-for-an-uploaded-file-in-copilot-for-security)

[**Module 7: Microsoft Sentinel Security Copilot Scenarios**](Modules/Module-7-Microsoft-Sentinel-Copilot-For-Security-Scenarios.md)
- [Exercise 1: Setting Up the Microsoft Sentinel Training Lab](Modules/Module-7-Microsoft-Sentinel-Copilot-For-Security-Scenarios.md#exercise-1-setting-up-the-microsoft-sentinel-training-lab)
- [Exercise 2: Setting Up the Microsoft Sentinel Connector on Microsoft Security Copilot](Modules/Module-7-Microsoft-Sentinel-Copilot-For-Security-Scenarios.md#exercise-2-setting-up-the-microsoft-sentinel-connector-on-microsoft-copilot-for-security)
- [Exercise 3: Incident Triage, Management, and Reporting using Security Copilot for Sentinel Incidents](Modules/Module-7-Microsoft-Sentinel-Copilot-For-Security-Scenarios.md#exercise-3-incident-triage--management-and-reporting-using-copilot-for-security-for-sentinel-incidents)
- [Exercise 4: Generating Hunting Queries to Hunt for Information in Your Sentinel Environment](Modules/Module-7-Microsoft-Sentinel-Copilot-For-Security-Scenarios.md#exercise-4-generating-hunting-queries-to-hunt-for-information-in-your-sentinel-evironment)

[**Module 8: Automation with Logic Apps**](Modules/Module-8-Automation-with-Logic-Apps.md)
- [Exercise 1: Deploying Threat Article Bulletin Logic App](Modules/Module-8-Automation-with-Logic-Apps.md#exercise-1-deploying-threat-article-bulletin-logic-app)
- [Bonus Module: Test the Additional Playbooks on GitHub and Create Your Own](Modules/Module-8-Automation-with-Logic-Apps.md#bonus-module-test-the-additional-playbooks-on-github-and-create-your-own)

[**Add more SCUs to complete the additional modules**](Modules/AdditionalSCUs)

[**Module 9: Embedded Features in Microsoft Defender**](Modules/Module-9-Embedded-Features-in-Microsoft-Defender.md)
- [Exercise 1: Accessing Microsoft Defender Investigation AI Capabilities](Modules/Module-9-Embedded-Features-in-Microsoft-Defender.md#exercise-1-accessing-microsoft-defender-investigation-ai-capabilities)
- [Exercise 2: Guided Response](Modules/Module-9-Embedded-Features-in-Microsoft-Defender.md#exercise-2-guided-response)
- [Exercise 3: Incident Report](Modules/Module-9-Embedded-Features-in-Microsoft-Defender.md#exercise-3-incident-report-)
- [Exercise 4: Pivoting to stand alone Microsoft Security Copilot](Modules/Module-9-Embedded-Features-in-Microsoft-Defender.md#exercise-4-pivoting-to-stand-alone-microsoft-security-copilot-)
- [Exercise 5: Analyzing Code](Modules/Module-9-Embedded-Features-in-Microsoft-Defender.md#exercise-5-analyzing-code-)

[**Module 10: Embedded Features in Microsoft Purview**](Modules/Module-10-eDiscovery-Search-in-Microsoft-Purview.md)
- [Exercise 1: Using Security Copilot to Create eDiscovery Search Queries](Modules/Module-10-eDiscovery-Search-in-Microsoft-Purview.md#exercise-1-using-security-copilot-to-create-ediscovery-search-queries)
- [Exercise 2: Summarize Evidence Collected via eDiscovery with Security Copilot](Modules/Module-10-eDiscovery-Search-in-Microsoft-Purview.md#exercise-2-summarize-evidence-collected-via-ediscovery-with-security-copilot)
- [Exercise 3: Summarizing DLP alerts with Security Copilot](Modules/Module-10-eDiscovery-Search-in-Microsoft-Purview.md#exercise-3-summarizing-dlp-alerts-with-security-copilot)

[**Module 11: Embedded Features in Microsoft Intune**](Modules/Module-11-Embedded-Features-in-Microsoft-Intune.md)
- [Exercise 1: Accessing Microsoft Intune and analyzing a device](Modules/Module-11-Embedded-Features-in-Microsoft-Intune.md#exercise-1-accessing-microsoft-intune-and-analyzing-a-device)
- [Exercise 2: Analyzing error code](Modules/Module-11-Embedded-Features-in-Microsoft-Intune.md#exercise-2-analyzing-error-code)
- [Exercise 3: Comparing devices](Modules/Module-11-Embedded-Features-in-Microsoft-Intune.md#exercise-3-comparing-devices)
- [Exercise 4: Comparing devices with AI help](Modules/Module-11-Embedded-Features-in-Microsoft-Intune.md#exercise-4-comparing-devices-with-ai-help)
- [Exercise 5: Summarize More Details](Modules/Module-11-Embedded-Features-in-Microsoft-Intune.md#exercise-5-summarize-more-details)
- [Exercise 6: Run a query](Modules/Module-11-Embedded-Features-in-Microsoft-Intune.md#exercise-6-run-a-query)

[**Module 12: Embedded Features in Microsoft Entra**](Modules/Module-12-Embedded-Features-in-Microsoft-Entra.md)
- [Exercise 1: Accessing Microsoft Entra and Using Security Copilot Chat](Modules/Module-12-Embedded-Features-in-Microsoft-Entra.md#exercise-1-accessing-microsoft-entra-and-using-security-copilot-chat)
- [Exercise 2: Troubleshooting Access Failures](Modules/Module-12-Embedded-Features-in-Microsoft-Entra.md#exercise-2-troubleshooting-access-failures)

[**Deleting the SCU Capacity**](Modules/Deleting-SCU.md)
- [Exercise 1 - Delete SCU capacity](Modules/Deleting-SCU.md#exercise-1---delete-scu-capacity)

## Feedback
Once you have completed the Hands On Lab it would be appreciated if you could spend a few minutes to provide feedback. Please click [here](https://forms.office.com/r/UbeFd7uuBc) to complete the feedback form.

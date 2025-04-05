
# Prerequisites

> <img src="https://raw.githubusercontent.com/Azure/Security-Copilot/refs/heads/main/Logic%20Apps/ciso-reporting/images/yt.png" alt="YouTube" width="28" height="20"> <a href="https://youtu.be/O4gT5yRwIpI" target="_blank">Mini-video showing the prerequisites (2m): [CISO Reporting with Security Copilot - Prototype setup - **#0** Prerequisites]</a>

1. The approach and logic used in this solution can be applied with Security Copilot connected to any data source.
   However, the sample custom plugins and promptbooks provided are designed to work in an environment where security is managed in the Unified SOC portal (Defender + Sentinel).

2. This procedure assumes that you already have some experience with Security Copilot and an existing baseline compute capacity deployed.
   If this is not the case, before starting the steps described below, create a minimum capacity of at least 1 SCU, which will be needed to access and configure Security Copilot.
   Later in the procedure, you will be instructed to increase the number of SCUs for the initial test and for scheduled execution.   

4. The custom Logic Apps that invoke Security Copilot access it through an OAuth connection authenticated with user credentials.
   Security Copilot accesses the target source systems through an impersonated access model; therefore, the credentials used in the OAuth connection from the Logic App
   must have the right to read the security data in the target source systems. In the promptbooks provided in this solution, the sources are Defender, Entra, and Sentinel.
   To my knowledge, at the time of this writing, it is not possible to specify 'Managed Identities' for the connection from Logic Apps to Security Copilot.
   'User credentials' are then required, even though these credentials will generally not be used by humans but only by this Logic App.
   As a prerequisite for proceeding with this installation, then, it is necessary to create user credentials with the following minimum 'active' permissions
   (note that 'eligible' permissions in PIM are not adequate for use in automation):
   - Security Reader at tenant level (for reading data in Defender and Entra)
   - Microsoft Sentinel Reader at the level of the Sentinel's resource group (for reading data in the Sentinel workspace)
   - Contributor on Microsoft Security Copilot (for accessing and interacting with Security Copilot)  
   
   These credentials also need to have an Microsoft 365 Exchange Online license assigned because they will be used to send the scheduled report email. 
   It is recommended to create and use a dedicated user with a clear name (such as 'Security Copilot Automation Account') and to monitor its usage to ensure that
   any anomalous logon attempts with these credentials generate an alert.  
   Before starting this setup procedure, it is highly recommended to prepare a browser session authenticated with the credentials of the new Security Copilot Automation Account,
   where you have already successfully accessed:
   - The user's mailbox in Exchange Online with Outlook web access
   - The Unfied SOC Portal (Defender + Sentinel, security.microsoft.com)
   - The Sentinel blade in Azure (portal.azure.com)
   - The Security Copilot portal (at the very first access, it requires you to acknowledge some introductory topics)

6. If you want to generate a report on the recommendations identified by Defender for Cloud (as in the third prompt in the sample Posture Analysis promptbook documented and shared here),
   you also need to enable Continuous Export from Defender for Cloud (in the relevant Azure subscriptions) to Log Analytics/Sentinel. 
   
7. Before starting this setup procedure, make sure to have the following information available:
   - Credentials for the "Security Copilot Automation Account"
   - Identification parameters for Sentinel (Subscription ID, Resource Group Name, Sentinel Workspace Name)
# Setup Procedure

## [**STEP 1**] Create the promptbooks

   > <img src="https://raw.githubusercontent.com/Azure/Security-Copilot/refs/heads/main/Logic%20Apps/ciso-reporting/images/yt.png" alt="YouTube" width="28" height="20"> <a href="https://youtu.be/JflMLaEJEQ0" target="_blank">Mini-video showing the promptbooks creation (3m): [CISO Reporting with Security Copilot - Prototype setup - **#1** Create promptbooks]</a>

On the Security Copilot portal, accessed with credentials with the Owner role:
- [promptbook-incident-analysis](https://github.com/Azure/Security-Copilot/blob/main/Logic%20Apps/ciso-reporting/promptbook-incident-analysis.md)
- [OPTIONAL] [promptbook-posture-analysis](https://github.com/Azure/Security-Copilot/blob/main/Logic%20Apps/ciso-reporting/promptbook-posture-analysis.md)\
  NOTES:
  - This promptbook for posture analysis and the related automation are in a very preliminary draft state.
    Not only are these prompts not optimized in terms of compute capacity consumption, but the overall promptbook is also very incomplete.
    Please refer to [this article](https://www.linkedin.com/pulse/periodic-reporting-security-managers-cisos-using-stefano-pescosolido-fm80f/)
    for further details.  
  - If you have not enabled the Continuous Export feature in Defender for Cloud, you should not include the third prompt in this sample promptbook.

## [**STEP 2**] Deploy the Logic App [ciso-get-users-status.json](https://github.com/Azure/Security-Copilot/blob/main/Logic%20Apps/ciso-reporting/ciso-get-users-status.json) used by one of the skills in the custom plugin for Incidents Analysis

   > <img src="https://raw.githubusercontent.com/Azure/Security-Copilot/refs/heads/main/Logic%20Apps/ciso-reporting/images/yt.png" alt="YouTube" width="28" height="20"> <a href="https://youtu.be/ETpt88CddQU" target="_blank">Mini-video showing the creation of the Logic App **ciso-get-users-status** (>2m): [CISO Reporting with Security Copilot - Prototype setup - **#2** Install GetUsersStatus]</a>

On the Azure portal, accessed with credentials with an administrative role:
  - NOTE: Currently, it has no "Deploy in Azure" button; it is necessary to perform a manual deployment.
  - Edit its connection to Security Copilot and authenticate with the credentials of the Security Copilot Automation Account

## [**STEP 3**] Deploy the Logic App [CfS-SendPromptbookResultsByEmail](https://github.com/Azure/Security-Copilot/tree/main/Logic%20Apps/CfS-SendPromptbookResultsByEmail) to create the "**CISO Incidents Analysis**" automation

   > <img src="https://raw.githubusercontent.com/Azure/Security-Copilot/refs/heads/main/Logic%20Apps/ciso-reporting/images/yt.png" alt="YouTube" width="28" height="20"> <a href="https://youtu.be/F3PMAPl7ptc" target="_blank">Mini-video showing the creation of the Logic App **CISO Incidents Analysis** (>5m): [CISO Reporting with Security Copilot - Prototype setup - **#3** Install Incidents Analysis Automation]</a>

On the Azure portal, accessed with credentials with an administrative role:
  - Use the "Deploy in Azure" button
  - Edit its connection to Security Copilot and authenticate with the credentials of the Security Copilot Automation Account
  - Edit its connection to Office 365 and authenticate with the credentials of the Security Copilot Automation Account
  - Chose the promptbook "promptbook-incident-analysis" and specify its parameters. Typically you may want to specify:
    - TOP_INCIDENTS_NUMBER = 10
    - SEVERITIES = High and Medium
    - TIME_FRAME = last week (NOTE: if you change this value, you have to modify the content of the ReplacePromptsInOutput workflow paramter accordingly)
    - RESPONSE_LANGUAGE = set a language supported by Security Copilot
    - RESPONSE_LANGUAGE = 10
    - TOP_IMPACTED_USERS_NUMBER = 5 (the value of this number has an important impact on the consumption - and, then, costs - of the solution.)
  - Set all the Logic App parameters. Specifically, ensure that you have set:
    - The Email Title and Email Subject
    - The EmailRecipients
    - The SkipPromptsInOutput and ReplacePromptsInOutput as specified at the end of the file
      [promptbook-incident-analysis](https://github.com/Azure/Security-Copilot/blob/main/Logic%20Apps/ciso-reporting/promptbook-incident-analysis.md)
  - Set the recurrence. Typically it has to be set to be run once per week, like on Monday morning at 6 am.
  - For the time being, keep the Logic App disabled (we will enable it when all the required configurations are in place) 
 

## [**STEP 4**] [OPTIONAL] Deploy the Logic App [CfS-SendPromptbookResultsByEmail](https://github.com/Azure/Security-Copilot/tree/main/Logic%20Apps/CfS-SendPromptbookResultsByEmail) to create the "**CISO Posture Analysis**" automation  
  NOTE: this automation and the related promptbook are in a very preliminary draft state.
  Not only are these prompts not optimized in terms of compute capacity consumption, but the overall promptbook is also very incomplete.
  Please refer to [this article](https://www.linkedin.com/pulse/periodic-reporting-security-managers-cisos-using-stefano-pescosolido-fm80f/)
  for further details on how this promptbook should be improved.

   > <img src="https://raw.githubusercontent.com/Azure/Security-Copilot/refs/heads/main/Logic%20Apps/ciso-reporting/images/yt.png" alt="YouTube" width="28" height="20"> <a href="https://youtu.be/yBmJhBJohMg" target="_blank">Mini-video showing the creation of the Logic App **CISO Posture Analysis** (~4m): [CISO Reporting with Security Copilot - Prototype setup - **#4** Install Posture Analysis Automation]</a>
  
  - Use the "Deploy in Azure" button
  - Edit its connection to Security Copilot and authenticate with the credentials of the Security Copilot Automation Account
  - Edit its connection to Office 365 and authenticate with the credentials of the Security Copilot Automation Account
  - Chose the promptbook "promptbook-posture-analysis" and specify its parameters. Typically you may want to specify:
    - WORDS_NUMBER = 50
    - NUMBER_OF_DAYS = 30
    - NUMBER_OF_RECOMMENDATIONS = 10
    - SEVERITIES = High and Medium 
  - Set all the Logic App parameters. Specifically, ensure that you have set:
    - The HtmlBodyHeader to change the color shade of the email
      (see [promptbook-posture-analysis](https://github.com/Azure/Security-Copilot/blob/main/Logic%20Apps/ciso-reporting/promptbook-posture-analysis.md))
    - The Email Title and Email Subject
    - The EmailRecipients
  - Set the recurrence. Typically it has to be set to be run once per week, like on Monday morning at 6 am.
  - For the time being, keep the Logic App disabled (we will enable it when all the required configurations are in place)

## [**STEP 5**] Deploy the Custom Plugins

   > <img src="https://raw.githubusercontent.com/Azure/Security-Copilot/refs/heads/main/Logic%20Apps/ciso-reporting/images/yt.png" alt="YouTube" width="28" height="20"> <a href="https://youtu.be/SKWVNzeDx6g" target="_blank">Mini-video showing the creation of the Custom Plugins (8m): [CISO Reporting with Security Copilot - Prototype setup - **#5** Custom plugins]</a>
  
  - Prepare and deploy the [ciso-incidents-summary-man](https://github.com/Azure/Security-Copilot/blob/main/Logic%20Apps/ciso-reporting/ciso-incidents-summary-man.yaml)
    custom plugin (used by the "**CISO Incidents Analysis**" automation)  
    NOTES:
    - This custom plugin loops through the users specified in the input and queries Entra for their enablement status and risk status.
      Due to the existance of the loop, it may consume a high level of compute units. You should decide if this evidence adds value to your report.
      If you want to include this evidence in the output report, it is recommended to limit the number of users included in the loop
      by setting a low value number in the TOP_IMPACTED_USERS_NUMBER parameter specified in the "**CISO Posture Analysis**" Logic App for the call to the
      [promptbook-incident-analysis](https://github.com/Azure/Security-Copilot/blob/main/Logic%20Apps/ciso-reporting/promptbook-incident-analysis.md)
      promptbook.
      If, instead, you decide to remove the call to that loop, you should not only remove the related prompt in the promptbook but also reorganize
      accordingly the values for the SkipPromptsInOutput and ReplacePromptsInOutput parameters in the same "**CISO Posture Analysis**" Logic App.
    - In this first draft release of this solution, the OpenAPI specification file
      [ciso-incidents-summary-api-spec.yaml](https://github.com/Azure/Security-Copilot/blob/main/Logic%20Apps/ciso-reporting/ciso-incidents-summary-api-spec.yaml)
      contains two placeholders whose value must be replaced accorinding to the components of the full URL of the trigger for the deployed Logic App
      [ciso-get-users-status.json](https://github.com/Azure/Security-Copilot/blob/main/Logic%20Apps/ciso-reporting/ciso-get-users-status.json).
      Specifically, you need to set:
      - <BASE_PATH> equal to the base path of that URL (e.g. https://prod-32.northeurope.logic.azure.com:443)
      - <WORKFLOW_ID> equal to the Workload ID in that URL (e.g. 836c758b842f46549f57c861ca856c7b)
      You have then to save the edited file in a public storage on the Internet that is accessible to Security Copilot, for example in another public GitHub repo.
      You then have to modifiy your copy of the file [ciso-incidents-summary-man.yaml](https://github.com/Azure/Security-Copilot/blob/main/Logic%20Apps/ciso-reporting/ciso-incidents-summary-man.yaml)
      by replacing the placehoder in the OpenApiSpecUrl parameter with the public URL of your modified OpenAPI specification file.
  - [OPTIONAL] Deploy the [ciso-posture-summary-man](https://github.com/Azure/Security-Copilot/blob/main/Logic%20Apps/ciso-reporting/ciso-incidents-summary-man.yaml)
    custom plugin (used by the "**CISO Posture Analysis**" automation). This deployment deployment does not require any specific customization: just download the
    file from the template in GitHub and upload it in your Security Copilot.
  - [OPTIONAL] Deploy the [Sentinel-SOC-Optimization-CustomPlugin] https://github.com/stefanpems/cfs/tree/main/Sentinel-SOC-Optimization-CustomPlugin
    custom plugin (used by the "**CISO Posture Analysis**" automation). This deployment deployment does not require any specific customization: just download the
    file from the template in GitHub and upload it in your Security Copilot.  
    NOTES:
    - While adding this custom plugin, you need to provide the Identification parameters for your Sentinel (Subscroption ID, Resource Group Name, Sentinel Workspace Name)
    - If you do not want to install this custom plugin, you need to remove the second prompt from the
      [promptbook-posture-analysis](https://github.com/Azure/Security-Copilot/blob/main/Logic%20Apps/ciso-reporting/promptbook-posture-analysis.md) that you deployed in one of the previous steps.


## [**STEP 6**] Enable the "**CISO Incidents Analysis**" automation and wait for the completion of its first automatic execution

   > <img src="https://raw.githubusercontent.com/Azure/Security-Copilot/refs/heads/main/Logic%20Apps/ciso-reporting/images/yt.png" alt="YouTube" width="28" height="20"> <a href="https://youtu.be/eX5VCtuWTac" target="_blank">Mini-video showing the first execution of the Incidents Analysis automation (4m): [CISO Reporting with Security Copilot - Prototype setup - **#6** Run Incidents Analysis]</a>

   On the Security Copilot portal, accessed with credentials with the Security Copilot Automation Account:
   - [**STEP 6.1**] Ensure that all the custom plugins just installed are enabled.
     Optionally, test the [ciso-get-users-status.json](https://github.com/Azure/Security-Copilot/blob/main/Logic%20Apps/ciso-reporting/ciso-get-users-status.json) Logic App
     by invoking the "CISO Get Users Staus" skill in the [ciso-incidents-summary-man](https://github.com/Azure/Security-Copilot/blob/main/Logic%20Apps/ciso-reporting/ciso-incidents-summary-man.yaml).
     For this purpose, use the following inputs:
     - api-version = 2016-10-01
     - sp = /triggers/AnalyzeUPNsCall/run
     - sv = 1.0
     - users_upn = one or more comma separated UPNs of users in your tenant


   On the Security Copilot portal, accessed with credentials with the Owner role:
   - [**STEP 6.2**] Increment temporarily the number of SCUs to ensure the first "test" executions can be completed successfully.
  
   On the Azure portal, accessed with credentials with an administrative role:   
   - [**STEP 6.3**] Enable the "**CISO Incidents Analysis**" automation and wait its first automatic execution
  
## [**STEP 7**] Enable the "**CISO Posture Analysis**" automation and wait for the completion of its first automatic execution

   > <img src="https://raw.githubusercontent.com/Azure/Security-Copilot/refs/heads/main/Logic%20Apps/ciso-reporting/images/yt.png" alt="YouTube" width="28" height="20"> <a href="https://youtu.be/4wZ4vEebCEo" target="_blank">Mini-video showing the first execution of the Incidents Posture automation (~1m): [CISO Reporting with Security Copilot - Prototype setup - **#7** Run Posture Analysis]</a>
  
   On the Azure portal, accessed with credentials with an administrative role:   
   - Enable the "**CISO Posture Analysis**" automation and wait its first automatic execution

## [**STEP 8**] Schedule the execution of the reporting together with the required periodic increment of SCUs

   > <img src="https://raw.githubusercontent.com/Azure/Security-Copilot/refs/heads/main/Logic%20Apps/ciso-reporting/images/yt.png" alt="YouTube" width="28" height="20"> <a href="https://youtu.be/Z6UKUyInMGY" target="_blank">Mini-video showing the setup of the periodic assignment of SCUs and of the recurrence for the reporting automations (>8m): [CISO Reporting with Security Copilot - Prototype setup - **#8** Scheduling SCUs and reporting]</a>
   
  - Set the recurrence on the "**CISO Incidents Analysis**" Logic App
  - Set the recurrence on the "**CISO Posture Analysis**" Logic App
  - Schedule the automatic deployment of the compute units (SCUs) dedicated to the execution of these automations
    to ensure that there is enough capacity (on top of your "baseline" capacity used by your users and other automations) everytime that the are executed.
    For example, deploy 2 instances of the [cfs-set-X-SCUs](https://github.com/stefanpems/cfs/tree/main/cfs-set-X-SCUs) Logic App:
    - One to increase the capacity by N SCUs over the baseline
    - One to decrease the capacity by N SCUs when the execution of these automations is completed 
    



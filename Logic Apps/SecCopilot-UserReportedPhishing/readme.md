# Sec-Copilot-UserReportedPhishing
Author: Yaniv Shasha




By initiating the deployment process, you will set up an Azure Logic App integrated with Security Copilot Actions.<br>
This setup activates when a user reports a phishing attempt in Outlook.<br>
As configured by Defender for Office, these reported emails are rerouted to a designated shared mailbox.<br>
Each new email arriving in this shared mailbox triggers the Security Copilot automation, initiating an automated investigation process.<br> 
During this phase, Security Copilot examines the email to determine the likelihood of it being a phishing attempt.<br>
Depending on the assessed risk level, the system will send a notification email.<br>
Additionally, if the phishing probability exceeds 75%, a Sentinel Incident will be automatically generated.<br>


### Before starting the installation, ensure you have fulfilled these prerequisites:

• The user deploying this Logic app must possess a Contributor Role.<br>
• Activation of the Security Copilot license on your tenant is required.<br>
• The user authenticated in the Copilot logic app action should have Security Admin permissions and the role of a Microsoft Sentinel contributor, as this is necessary for creating incident comments.<br>
• Upload and enable custom KQL plugin, this need to be on the same user profile that running automation. <br>

<img src="./images/upload01.png"/>

<img src="./images/enable_skill.png"/>

 
<br>

<br>





### Deployment 

To deploy the above logic app, you need to<br>
•   Press on the Deploy option, select your subscription and the resource group (select the same tenant that Security Copilot is enabled)<br>


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FSecurity-Copilot%2Fmain%2FLogic%2520Apps%2FSecCopilot-UserReportedPhishing%2Fazuredeploy.json" target="_blank">
<img src="https://aka.ms/deploytoazurebutton"/>



###  Full Logic App view

<img src="./images/full_view.png"/>
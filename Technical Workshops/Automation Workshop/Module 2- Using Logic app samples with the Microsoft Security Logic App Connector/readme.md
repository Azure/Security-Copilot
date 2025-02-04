## Leveraging the Microsoft Security Copilot Logic App Connector

![Security CoPilot Logo](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)

#### ⌛ Estimated time to complete this lab: 30 minutes
#### 🎓 Level: 200 (Proficient to Expert level)

Logic app connector documentation: [Link](https://learn.microsoft.com/en-us/security-copilot/connector_logicapp)

#### Objectives
Upon completing this technical guide, you will gain the following abilities:

* Deploy an Azure Logic Apps capable of handling Microsoft Security Copilot prompts using the Logic app connector.
* Leverage the Microsoft Security Copilot GitHub to access logic app samples for testing.

#### Prerequisites
To successfully complete this task, you must meet the following prerequisites:

1. You need your own tenant and Microsoft Security Copilot instance.
2. **Azure Subscription**: You need an active [Azure subscription](https://azure.microsoft.com/en-us/free/) to create and deploy a Logic App.
3. **Azure Resource Group**: Logic Apps are deployed within [Azure resource groups](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups). Ensure that you have an appropriate resource group created or create one during the deployment process.
4. **Access Permissions**: Ensure that you have the necessary [permissions](https://docs.microsoft.com/en-us/azure/role-based-access-control/overview) to create resources in the Azure subscription and resource group where you plan to deploy the Logic App.
5. **ACCESS to GitHub for Security Copilot:** ensure you have access to the [public repository](https://github.com/Azure/Copilot-For-Security/tree/main) where you will get access to the Logic app Samples.

#### Steps to Follow
Now that we have successfully launched a Logic App utilizing the Security Copilot connector in the previous module, we can now progress to utilize existing samples available in our [public repository](https://github.com/Azure/Copilot-For-Security/tree/main). These samples cover various security scenarios. In this module, we will focus on two specific scenarios.

---

#### **Scenario 1: Threat Article Bulletin**

In this technical workshop, participants will learn how to deploy a Logic App designed to produce threat bulletins sourced from Microsoft Defender Threat Intelligence (MDTI) and send them to a designated email address. The workshop will cover the process of setting up the Logic App to gather threat intelligence information, create bulletins, and automate the distribution process via email.

#### Steps to Follow 
- Access the Logic app folder on the GitHub: [Azure Security Copilot - Logic Apps](https://github.com/Azure/Copilot-For-Security/tree/main/Logic%20Apps)
- Proceed to Deploy

## Deployment
[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FCopilot-For-Security%2Fmain%2FLogic%2520Apps%2FThreatBulletinCopilot%2Fazuredeploy.json)
### Post-Deployment Instructions

1. Select the frequency on how many times you want the Logic App to run.
2. Authenticate the Copilot Prompts with a User that has Access to Security Copilot.
3. Proceed to run the Logic app and Prepare for the results.

#### Logic App View
![Threat Bulletin Logic App](https://github.com/KwachSean/SecurityCopilot/raw/main/playbooks/ThreatBulletinCopilot/threatbulletinlogicapp.png)

#### Results of the Logic App
![Threat Bulletin Image](https://github.com/KwachSean/SecurityCopilot/raw/main/playbooks/ThreatBulletinCopilot/Threatbulletin.png)

---

#### **Scenario 2: Sentinel Investigation Logic App**

In this comprehensive technical workshop, participants will delve into the deployment process of a specialized Logic App. Activating the 'Deploy' button will initiate the deployment of an Azure Logic App integrated with Security Copilot Actions, which utilizes a Microsoft Sentinel incident trigger. This Logic App will transition the incident status to active, generate dynamic tags (labels), and append them to the Sentinel incident tags. Furthermore, the automation will determine and adjust the incident severity based on MDTI enrichment. It will also comprehensively document the investigation findings and the logic behind the incident classification in the comments section of the Microsoft Sentinel incident.

#### Steps to Follow 
- Access the Logic app folder on the GitHub: [Azure Security Copilot - Logic Apps](https://github.com/Azure/Copilot-For-Security/tree/main/Logic%20Apps)
- Proceed to Deploy

## Deployment 

To deploy the above logic app, you need to:

* Press on the Deploy option, select your subscription and the resource group (select the same tenant that Security Copilot is enabled).

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FYaniv-Shasha%2FSecurityCopilot%2Fmain%2FPlaybooks%2FCopilot-Sentinel_investigation-DynamicSev%2Fazuredeploy.json)

### Post Deployment

* Authenticate with the users mentioned above (you can use different users for the Copilot actions and to the Sentinel actions).
* To run the logic app manually, open the Microsoft Sentinel incident page, right-click on a specific incident, and press run playbook. Select the logic app you just deployed and press run.
* To run the logic in an automatic way, create an automation rule in Sentinel and connect this playbook as the action for this rule.

![Sentinel Investigation Logic App](https://github.com/Yaniv-Shasha/SecurityCopilot/blob/ccbd305c539800eea2a1f7c1a0905aff954e2e25/Playbooks/Copilot-Sentinel_investigation-DynamicSev/images/full_logic_app.jpg)


---

#### **Bonus Module: Test the additional playbooks on Github and Create your own**

- Access the Logic app folder on the GitHub: [Azure Security Copilot - Logic Apps](https://github.com/Azure/Copilot-For-Security/tree/main/Logic%20Apps)

![Logic App Image](https://github.com/Azure/Copilot-For-Security/raw/main/Images/Logicapp%20images/logicapp10.png)

- Proceed to Deploy

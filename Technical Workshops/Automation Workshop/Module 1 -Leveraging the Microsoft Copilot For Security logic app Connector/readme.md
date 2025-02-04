## Leveraging the Microsoft Security Copilot Logic App Connector

![Security CoPilot Logo](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)

#### ⌛ Estimated time to complete this lab: 15 minutes
#### 🎓 Level: 100 (Beginner)

Logic app connector documentation: [Link](https://learn.microsoft.com/en-us/security-copilot/connector_logicapp)

#### Objectives
Upon completing this technical guide, you will gain the following abilities:<br>

* Deploy an Azure Logic App capable of handling Microsoft Security Copilot prompts using the Logic app connector.<br>

#### Prerequisites
To successfully complete this task, you must meet the following prerequisites:<br>

1. You need your own tenant and Microsoft Security Copilot instance.<br>
2. **Azure Subscription**: You need an active [Azure subscription](https://azure.microsoft.com/en-us/free/) to create and deploy a Logic App.
3. **Azure Resource Group**: Logic Apps are deployed within [Azure resource groups](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups). Ensure that you have an appropriate resource group created or create one during the deployment process.
4. **Access Permissions**: Ensure that you have the necessary [permissions](https://docs.microsoft.com/en-us/azure/role-based-access-control/overview) to create resources in the Azure subscription and resource group where you plan to deploy the Logic App.

#### Steps to Follow

### 1. Create a consumption logic app resource that's hosted in multi-tenant Azure logic apps 

- In the Azure portal search box, enter logic apps, and select Logic apps.
![Logic App Image](https://github.com/Azure/Copilot-For-Security/raw/main/Images/Logicapp%20images/logicapp1.png)
- On the Logic apps page toolbar, select Add.
- On the Create Logic App page, first select the Plan type for your logic app resource. That way, only the options for that plan type appear.
- When you're done, your settings look similar to the following example:
![Logic App Image](https://github.com/Azure/Copilot-For-Security/raw/main/Images/Logicapp%20images/logicapp2.png)
- When you're ready, select Review + Create.
- On the validation page that appears, confirm all the provided information, and select Create.

### 2. Select the blank logic app workflow template.
- After Azure successfully deploys your logic app resource, select Go to resource. Or, find and select your logic app resource by typing the name in the Azure search box
![Logic App Image](https://github.com/Azure/Copilot-For-Security/raw/main/Images/Logicapp%20images/logicapp3.png)
- Scroll down past the video and the section named Start with a common trigger.
- Under Templates, select Blank Logic App.
![Logic App Image](https://github.com/Azure/Copilot-For-Security/raw/main/Images/Logicapp%20images/logicapp4.png)

### 3. Add a trigger that specifies when to run the workflow.
- on the workflow designer, select a trigger 
![Logic App Image](https://github.com/Azure/Copilot-For-Security/raw/main/Images/Logicapp%20images/logicapp5.png)
- Choose the Recurrence Trigger and Select the Logic app should be initiated once a day 
![Logic App Image](https://github.com/Azure/Copilot-For-Security/raw/main/Images/Logicapp%20images/logicapp6.png)

### 4. Add the Security Copilot Logic App connector within the workflow 
- Select the Logic App Security Copilot Connector 
![Logic App Image](https://github.com/Azure/Copilot-For-Security/raw/main/Images/Logicapp%20images/logicapp7.png)
- Authenticate the Logic App Security Copilot Connector 
- Add context on the prompt 

![Logic App Image](https://github.com/Azure/Copilot-For-Security/raw/main/Images/Logicapp%20images/logicapp9.png)
- Review the parameters in the Logic App Security Copilot connector
![Logic App Image](https://github.com/Azure/Copilot-For-Security/raw/main/Images/Logicapp%20images/logicapp8.png)

Optional Parameters and Inputs:

Prompt Content: Prompt to be evaluated 
- Session Id: Session context
- Skill Inputs: Optional JSON body specifying values for required plugin (skill) parameters
- Skill Name: Call directly to a skill (bypass planner)
- Skillsets: Call directly to a skillset (bypass planner)
- Save the workflow 

### 5. Run your workflow.
- Run the workflow (success)

### 6. View the Outcome of the Workflow on the Logic app connector and the Standalone Portal  

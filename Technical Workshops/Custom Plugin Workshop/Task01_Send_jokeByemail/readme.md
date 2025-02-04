# Introduction
![Security CoPilot Logo](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)
#### ⌛ Estimated time to complete this lab: 10 minutes
#### 🎓 Level: 100 (Beginner)

#### Objectives

Upon completing this technical guide, you will gain the following abilities:<br>

* Upload a Microsoft Security Copilot custom plugin of the Logic App type.<br>
* Deploy an Azure Logic App capable of handling Microsoft Security Copilot prompts.<br>
* Create a Microsoft Security Copilot session that triggers this Logic App.<br>

#### Scenario
In this technical workshop, participants will learn how to upload a Microsoft Security Copilot custom plugin of the Logic App type and deploy the corresponding Logic App. To successfully complete this task, you must meet the following prerequisites:<br>

* You need your own tenant and Microsoft Security Copilot instance.<br>
* You should have permission to upload a custom plugin.<br>
* You should have permission to deploy a Logic App.<br>


####  Instruction

## Deploy Logic app 

	1. Deploy the Logic App above by clicking the "Deploy to Azure" button

Select the subscription, resource group and logicapp name.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FYaniv-Shasha%2FSecurityCopilot%2Fmain%2FWorkshop%2FCustom_Plugin%2FTask01_Send_jokeByemail%2FWorkshop01-sendJokeByemail%2Fazuredeploy.json" target="_blank">
    <img src="https://aka.ms/deploytoazurebutton"/>
</a>
<br>

<img src="./Images/deploy_logic_app.jpg"/>

<br>
	2. Once the Logic App is created, locate it and authenticate the "send email" action with a user who has a mailbox in O365.

<img src="./Images/auth_logicapp.jpg"/>

    

### Upload the Custom Plugin 

Downalod a local copy of "SendJokeByEmail.yml" file located in the same folder and edit it.<br>
Add the following information:

1. The SubscriptionId where you deployed your Logic App.
2. The ResourceGroup where you deployed the Logic App.
2. If you changed the default logic app name adapt the logic app name.

<img src="./Images/yaml_subid.jpg"/>

3. Upload the custom plugin and check if its turn on

<img src="./Images/upload_plugin.jpg"/>


<img src="./Images/check_if_plugin_isON.jpg"/>

4. **Execute the following prompts:**

* Tell me a security-related joke for today.<br>
* Run the logic to send the above joke to this email: <youremailaddress@email.com>..<br>

<img src="./Images/prompts.jpg"/>

5. To monitor the process, open the Logic App you just created and check the last runs.

<img src="./Images/run_history.jpg"/>

6. Open your inbox and examine the email.<br>

###  See you in the next Task!


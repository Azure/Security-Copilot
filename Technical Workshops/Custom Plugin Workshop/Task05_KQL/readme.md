# Introduction 
![Security CoPilot Logo](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)
#### 🎓 Level: 100 (Beginner)
#### ⌛ Estimated time to complete this lab: 10 minutes

### Objectives

After finishing this technical guide, you will acquire the following skills:<br>

* Ability to upload a custom plugin of the KQL type.<br>
* Understanding of how to enhance user information using an external user list.<br>
* Proficiency in generating reports utilizing the custom plugin source.<br>

### Scenario
In this technical workshop, participants will learn how to upload a Microsoft Security Copilot custom plugin of the API type.<br> 
To successfully complete this task, you must meet the following prerequisites:<br>

* You need your own tenant and Microsoft Security Copilot instance.<br>
* You should have permission to upload a custom plugin.<br>



###  Instruction
    

#### Upload the Custom Plugin 


1. Retrieve the file titled **"UsersHR.yml"** from the specified directory..<br>
2. Examine a plugin of the KQL type.<br>
3. Alter the configuration in the YAML file to include your subscription, resource group (where sentinel to deploy), and log analytics workspace (where sentinel is deploy).<br>

<img src="./images/update_config.jpg"/>

<br>

> ⭐ Notice: <br>

To obtain the **Tenant ID, Subscription ID, Resource Group, and Log Analytics Workspace name**, please refer to the Azure documentation. <br>

4. Upload the custom plugin and confirm its activation.<br>


<img src="./images/upload_plugin.jpg"/>

<br>
<img src="./images/upload_plugin_wood.jpg"/>


####  Use case


As a SOC Analyst at Woodgrove Domain, you are involved in investigating an SAP incident. During this investigation, you identified a user engaging in suspicious activity, specifically downloading a file from the SAP system. To respond swiftly, it's crucial to rapidly enrich this user's profile with data from your HR system, known as **WoodgroveHR**.<br> 

Given that this incident occurred in an air-gapped environment, your colleague from Woodgrove-airgap has provided the incident details in a Json format, which you need to access and utilize for further analysis.<br> 


**Your task is:**<br>

1. Fetch air-gapped sentinel incident into Copilot Session memory. 
> ⭐ Notice: <br>

To use the FetchURL option, the Public **Web plugin** must be enabled

<img src="./images/public_web.jpg"/><br>

2. Use  **WoodgroveHR User Directory** custom plugin you just uploaded and call it explicitly. <br> 
  Hint: you can do it by typing  **/wood** <br> 

<img src="./images/call_plugin.jpg"/>

3. Search the victim user from the incident <br> 

<img src="./images/add_paramter.jpg"/>

4. Generate report that includes the incident summary and the user enriched data from the WoodgroveHR.<br> 


####   Example prompts:

1. Fetch url https://raw.githubusercontent.com/Yaniv-Shasha/SecurityCopilot/main/Workshop/Custom_Plugin/Task05_KQL/Sentinel_Incident.json.<br> 



2. You need to call  explictly the custom skill you uploaded,  by typing **/woodgroveHD**.<br> 

> ⭐ Notice: <br>
  Hint: you can do it by typing  **/wood** <br> 

<img src="./images/call_plugin.jpg"/>

3. Add the user name as input paramter for the **/woodgroveHD** plugin.<br> 

<img src="./images/add_paramter.jpg"/>

4. Generate report that summarize the incident and include the user information.

<br> 


####  ✅  Final Results:
<img src="./images/final_results.jpg"/>


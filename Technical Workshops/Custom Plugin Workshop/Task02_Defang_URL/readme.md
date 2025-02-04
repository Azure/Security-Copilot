# Introduction 
![Security CoPilot Logo](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)
#### 🎓 Level: 100 (Beginner)
#### ⌛ Estimated time to complete this lab: 10 minutes

### Objectives

Upon completing this technical guide, you will gain the following abilities:<br>

* Upload a custom plug from GPT type.<br>
* Learn how to use the fetchUrl skill.<br>
* Learn how to use the DefangUrl skill.<br>
* Generete report that will levrage MDTIO data and the custom plugin source.<br>



### Scenario
In this technical workshop, participants will learn how to upload a Microsoft Security Copilot custom plugin of the GPT type.<br> 
To successfully complete this task, you must meet the following prerequisites:<br>

* You need your own tenant and Microsoft Security Copilot instance.<br>
* You should have permission to upload a custom plugin.<br>



###  Instruction
    

#### Upload the Custom Plugin 


1. Obtain the file named **"DefangsURLs.yaml"** from this directory.<br>
2. Inspect it to appreciate the simplicity of creating a GPT-type plugin.<br>
3. Upload the custom plugin and verify if it's activated.<br>

<img src="https://github.com/Yaniv-Shasha/SecurityCopilot/blob/cfcd1baf606277478b7512be8bf3e43c7074f870/Workshop/Custom_Plugin/Task01_Send_jokeByemail/Images/upload_plugin.jpg"/>


<img src="https://github.com/Yaniv-Shasha/SecurityCopilot/blob/f15ba2df94fbba97cb9adf70426cdf4d471b28fb/Workshop/Custom_Plugin/Task02_Defang_URL/images/plugin-turnON.jpg"/>


####  Use case

You are an incident response analyst currently investigating a prolonged incident.<br> 
Your colleague has provided you with a Json file containing DNS lookup activity from the DNS server<br>


**Your task is:**<br>

1. Fetch DNS information into Copilot Pilot Context session.

> ⭐ Notice: <br>

To use the FetchURL option, the Public **Web plugin** must be enabled

<img src="./images/public_web.jpg"/><br>

2. Extract only the URLs from this file.
3. Use the MDTI reputation score Skill to assess these URLs.
4. Identify URLs with scores exceeding 75.
5. In order to compile a report with your findings, utilize the custom plugin you recently uploaded to neutralize **(Defang)** the suspicious URLs.


####  How to accomplish this

* Use the "fetchurl" skill to access the file located in the same directory. It's important to ensure you retrieve the raw representation of the file.<br> 
* Use the MDTI skill and the DefangUrl to create report.


####   Example prompt:

1. Fetchurl https://raw.githubusercontent.com/Yaniv-Shasha/SecurityCopilot/main/Workshop/Custom_Plugin/Task02_Defang_URL/UrlstoFetch_Task02.json.<br> 

2. Distinct all the DNS query from this file.<br> 

3. Check reputation score for the above domains.<br> 

4. Defang URL for all the domains with reputation score higher than 75

5. Create report that include only the defanged url and the reputation score.<br> 

####  ✅  Final Results:


<img src="./images/final_result.jpg"/>






# Introduction 
![Security CoPilot Logo](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)
#### 🎓 Level: 100 (Beginner)
#### ⌛ Estimated time to complete this lab: 10 minutes

### Objectives

Upon completing this technical guide, you will gain the following abilities:<br>

* Upload a Custom plug from API type.<br>
* Learn how to use script analysis promptbook.<br>
* Learn how to analze and encode Script.<br>
* Generete report that will levrage the custom plugin source.<br>

### Scenario
In this technical workshop, participants will learn how to upload a Microsoft Security Copilot custom plugin of the API type.<br> 

> ⭐ Notice: <br>
**When utilizing a custom plugin from an API type, be aware that data is transferred out of your tenant and sent to a remote endpoint. In this lab, we are working with sample data. Please keep this in consideration when handling internal data.**
<br>

To successfully complete this task, you must meet the following prerequisites:<br>

* You need your own tenant and Microsoft Security Copilot instance.<br>
* You should have permission to upload a custom plugin.<br>



###  Instruction
    

#### Upload the Custom Plugin 

> ⭐ Notice: <br>
If you have already completed Module 4, there is no need to upload the plugin again.<br>


1. Obtain the file named **"Geo.yaml"** from this directory.<br>
2. Inspect it to appreciate the simplicity of creating a API-type plugin.<br>
3. Upload the custom plugin and verify if it's activated.<br>

<img src="./images/upload_plugin.jpg"/>


<img src="./images/plugin_turn_on.jpg"/>


####  Use case


You are Soc Analyst in woodgrove Domain, During an endpoint Incident investigation, you found suspicious script that run on your DMZ server, your job is to analyze this script, and share your final to your team member.<br> 



**Your task is:**<br>

1. Input this information about the script from the script_decode.txt and ask Copilot to decode it
2. Extract only the IPs from this script.
3. Employ the MDTI reputation score to assess these Ip.
4. Identify IPs with scores
5. In order to compile a report with your findings, utilize the custom plugin you recently uploaded to GeoIP the suspicious Ips.
6. Share report that include the reputation score and the Geo IP data.



####   Example prompts:

1. Decode the above script "Replace this with the script you copied".<br> 

<img src="./images/decode.png"/>

2. check reputation score for the above ip.<br> 

3. Use Geo location for the above IP.<br> 

4. create report that include the reputation score and the Geo Ip address.<br> 


####  ✅  Final Results:


<img src="./images/final_free%20text.png"/>



 ⭐**Bouns task:** <br>

1. Copy the script from script_decode.txt .<br> 

<img src="./images/prompbooks.jpg"/> <br> 


2. Launch the 'Suspicious Script Analysis' tool Promptbooks.
3. Paste the script you copied in Step One into the designated field and click 'Run'. 
4. Distribute the generated report and assess whether the script is malicious


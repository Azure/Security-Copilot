# Introduction 
![Security CoPilot Logo](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)
#### 🎓 Level: 100 (Beginner)
#### ⌛ Estimated time to complete this lab: 10 minutes

### Objectives

Upon completing this technical guide, you will gain the following abilities:<br>

* Upload a cusotm plug from API type.<br>
* Learn how to use the fetchUrl skill.<br>
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


1. Obtain the file named **"Geo.yaml"** from this directory.<br>
2. Inspect it to appreciate the simplicity of creating a API-type plugin.<br>
3. Upload the custom plugin and verify if it's activated.<br>

<img src="https://github.com/Yaniv-Shasha/SecurityCopilot/blob/5cd2b8bb01eb8e3762371631aef03dd55697aded/Workshop/Custom_Plugin/Task03_GEO_IP_report/images/upload_plugin.jpg"/>


<img src="./images/plugin_turn_on.jpg"/>


####  Use case

You are preparing an enrichment report based on a previous incident. As part of the evidence collection, you have received a file containing lists of IP addresses.<br> 
Your task is to assess the reputation score of these IPs and share the ones with a reputation score exceeding 70.<br> 

Your SOC manager has requested that you include both the IP address and its complete geographical location in the report.<br> 



**Your task is:**<br>

1. Input this information from the CSV into Copilot Pilot.(use the raw version)
2. Extract only the IPs from this file.
3. Employ the MDTI reputation score to assess these Ips.
4. Identify IPs with scores exceeding 75.
5. In order to compile a report with your findings, utilize the custom plugin you recently uploaded to GeoIP the suspicious Ips.
6. Share report that include the reputation score and the Geo IP data.


####  How to accomplish this

1. Use the **"fetchurl"** skill to access the file located in the same directory. It's important to ensure you retrieve the raw representation of the file.<br> 

####   Example prompts:

1. Fetchurl https://raw.githubusercontent.com/Yaniv-Shasha/SecurityCopilot/main/Workshop/Custom_Plugin/Task03_GEO_IP_report/CiscoSEG.csv<br> 

> ⭐ Notice: <br>

To use the FetchURL option, the Public **Web plugin** must be enabled

<img src="./images/public_web.jpg"/><br>

<br> 

2. From this file distinct all the DeviceAddress.<br> 

3. Check reputation score for the above Ip's.<br> 

4. Tell me the Geolocation for the IP that its reputation is above 75.<br> 

5. Generate reports that include ip address reputation score and geo location information.<br> 


####  ✅  Final Results:


<img src="./images/final_results.jpg"/>





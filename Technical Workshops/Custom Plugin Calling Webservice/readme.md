# Introduction 
![Security CoPilot Logo](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)
### Create a custom plugin calling a Webservice
#### 🎓 Level: 200 (Intermediate)

### Objectives

This folder contains a three plugins to send data via GET (with and without parameters) and POST (parameters sent using JSON). The plugins make REST calls to a Python/Flask based website which is available in the folder FlaskWebsite. The objective of the plugins YAML files and the Flask website is to show how you can make a call to specific REST API, along with making the correct prompts so that Security Copilot planner/orchestrator selects your plugin and makes the REST call. Since the calls are made to a custom webserice you can see the what type of data exchange takes place between the Security Copilot and your WebService. 

### Steps

1. While we can use any standard application that exposes a REST API, it will be easier and more clearer from the server-side if we build a simple web service of our own and have our plugin call it. We have build this web service in Python using the Flask web framework and first make the webservice work in your local machine and test it via a browser by entering the URL http://127.0.0.1:5000 

2. Once you have proven your Flask web application is running locally, you will now need to run the above website in a host that is reachable from the Internet since Security Copilot is a Cloud based application. The best option  is to use an Azure App Service and instructions to host and run a Python web application in Azure App Service are given [here](https://learn.microsoft.com/en-us/azure/app-service/quickstart-python?tabs=flask%2Cwindows%2Cazure-cli%2Czip-deploy%2Cdeploy-instructions-azportal%2Cterminal-bash%2Cdeploy-instructions-zip-azcli). Azure App Service also builds a TLS layer on your website (allowing you to use https) even though our webservice is non-TLS. The other option is to run the webserver from an Azure hosted VM, but you will not have the benefit of a TLS layer. While Security Copilot can call both http and https websites, for any production application TLS is a must.

3. Upload the OpenAPI document (with _OAPI_ in filename) in an Internet accessible location or download from this github. You can also use the Flask Webservice to serve them by moving the files in the <i>Files</i> folder.

4. Make sure the URLs for the OpenAPI specification document is correct in the main YAML files (one without the _OAPI_. There will be a corresponding main YAML file for each YAML file with the _OAPI_ name).

5. Upload the main YAML document (one for each plugin) in Copilot and confirm the upload is successful. You can now start using the plugin. 

More instructions on using these plugins are give in this Microsoft Techcommunity [Article](https://techcommunity.microsoft.com/t5/microsoft-security-copilot-blog/how-to-build-a-copilot-for-security-api-plugin-part-1/ba-p/4107604). 



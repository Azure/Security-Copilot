![Security Copilot Overview](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)

# Security Copilot Guide to Create your Custom Plug-in

**Name of Plugin
**Author: John DOE**
**Publisher: Example**

This plugin enables users to enrich investigations using threat intelligence from custom sources:   
	1. Scan a URL or domain
	2. Scan an IP Address

Technical Blog
https://learn.microsoft.com/en-us/security-copilot/

**Note**  
Ensure you have enough API tokens before invoking any skills to avoid displeasure

## **Pre-requisites**
1. Login to your Example Account  

2. To create new "API Key", click on "Add & Integration Key"  

   ![APIKey](https://learn.microsoft.com/en-us/security-copilot/media/plugin-button.png)  
   
3. You’ll see a dialog box to enter your API name. Give your key a short, but descriptive name, such as "Security Copilot API Key"  

4. Copy the API key to a safe place and then dispose carefully. 


## Select or upload the attached manifest file into your Security Copilot console
1. Click on Deploy to Azure  
[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://aka.ms/LINK)
  

2. Enter the following API key in the value key
	```
	"API Key": x-apikey
	```
	## Invoking the Plugin and Skills
1. **Important**  
   After selecting or uploading, click the "Set Up" button and enter the copied API key from the Pre-requisites above and press "Save."

2. Use a Natural Language prompt from below examples or use Direct Skill Invocation ("/")


## Skills & Prompts
1. Skill 1: Ask Example Plugin about this URL 
- Example Prompt(s): Tell me about this [URL]; What does Example Plugin say about this [domain]
- Inputs: [URL] 
2. Skill 2: Ask Example Plugin about this IP address


## Frequently Asked Questions (FAQ)
1. **Important**  
   If prompts fail to invoke, please ensure you're using a supported Prompt above. Otherwise, invoke it using Direct Skill Invocation "/"      

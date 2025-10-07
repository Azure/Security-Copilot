# GreyNoise Enterprise
**Author: Shiv Patel + Brad Chiappetta**

**Publisher: Microsoft + GreyNoise**

This plugin enables users to enrich investigations using threat intelligence from GreyNoise:   
1. Query information on an IP
2. Execute a GreyNoise Query

Product Information:
https://www.greynoise.io/greynoise-product

**Note**  
Ensure you have a GreyNoise subscription with sufficient Search capacity for your usage

## **Pre-requisites**
1. Login to your [GreyNoise Account](https://viz.greynoise.io/account/plan)
2. Access your GreyNoise API key on the [My API Key Tab](https://viz.greynoise.io/account/api-key)
3. Copy the API key to enter into Co-Pilot. 


## Select or upload the attached manifest file into your Copilot for Security console
1. From the Plugin manager, locate the GreyNoise Enterprise Plugin and enable it
![Enable Plugin](images/GreyNoiseEnterprise_plugin.png)

    ## Invoking the Plugin and Skills
2. **Important**  
   After selecting or uploading, click the "Set Up" button and enter the copied API key from the Pre-requisites above and press "Save."
![Enter Key](images/GreyNoiseEnterprise_settings.png)

3. Use a Natural Language prompt from below examples or use Direct Skill Invocation ("/")


## Skills & Prompts
1. Look up IP in GreyNoise for additional context: Ask GreyNoise if this IP is an Internet Scanner
   - Example Prompt(s): Tell me about Ip address [IP] using GreyNoise database, Find the GreyNoise IP Context for IP [IP]
   - Inputs: [IP] 
2. Look up IP Timeline for a given field: Ask GreyNoise timeline based information around a specific data point
   - Example Prompt(s): Tell me about the daily classification for Ip address [IP] over the last 30 days using GreyNoise database
   - Inputs: [IP] 
3. Perform a GreyNoise Query: Query GreyNoise using the GreyNoise Query Language (GNQL)
   - Example Prompt(s): Use GreyNoise to check the GNQL information on [QUERY], Query GNQL for [QUERY], Search for all IPs scanning sensors located in Germany with GNQL GreyNoise Enterprise [QUERY]
   - Inputs: [QUERY]
3. Look up CVE Information: Query GreyNoise dataset for CVE information.
   - Example Prompt(s): Use GreyNoise to check stats on [CVE], What does GreyNoise know about [CVE]
   - Inputs: [CVE]

## Frequently Asked Questions (FAQ)
1. **Important**  
   If prompts fail to invoke, please ensure you're using a supported Prompt above. Otherwise, invoke it using Direct Skill Invocation "/"      

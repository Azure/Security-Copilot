# SGNL Access Intelligence
**Author: Marc Jordan**
**Publisher: SGNL**

This plugin enables SGNL Administrators to use Microsoft Security Copilot to understand and identify fine-grained access decisions and trends across their enterprise.

[Technical Blog](https://sgnl.ai/2023/11/sgnl-for-microsoft-security-copilot/)

**Note**  
Ensure your account has sufficient permission to read the SGNL Access Decision Logs prior to proceeding.

## **Pre-requisites**
1. Authenticate to SGNL (via the Console or API) and retrieve your Tenant ID (Admin-->Environment) and your ID Token, you'll need these to configure Security Copilot


## Select or upload the attached manifest file into your Security Copilot console
1. From the plugin manager, locate the SGNL Plugin and enable it
![Enable Plugin](images/plugin-manager.png)
  

2. When configuring the plugin, use your Tenant ID as your Username and your ID Token as your password, e.g.
	```
	Username: 4b1...
    Password: eyJ......
	```
    ![Configure Plugin](images/config.png)
3.  Save the Configuration


## Skills & Prompts
1. Skill 1: Tell me about access from SGNL 
- Example Prompt(s): Summarize the logs from SGNL for today; Which principals have accessed sensitive assets today; Tell me about [Principal] access over the last 7 days; Which Principals have accessed [Asset]
- Inputs: [Principal], [Asset], [Action]


## Frequently Asked Questions (FAQ)
1. **Important**  
   If prompts fail to invoke, please ensure you're using a supported prompt above. Otherwise, invoke it using Direct Skill Invocation "/"      

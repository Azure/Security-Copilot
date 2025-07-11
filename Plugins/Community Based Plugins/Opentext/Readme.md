![Security Copilot Overview](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)

# OpenText(TM) Core Threat Detection and Response Plugin for Microsoft Security Copilot

**Name of Plugin: OpenText Core Threat Detection and Response**  
**Author: OpenText**  
**Publisher: OpenText**

The OpenText Core Threat Detection and Response plugin enables you to interact with Security Copilot, gain 
data insights produced by the product, and take appropriate actions on the risky entities and alerts 
occurring in your organization.:

1. Retrieve top risky users, devices, and rare processes  
2. Summarize risky activity across the organization  
3. Examine specific risky entities and alerts  

---

## **Prerequisites**

1. Log in to your OpenText Core Threat Detection and Response account.  
2. Make a note of the <Product_URL> used to log into your account (e.g., https://tdr10.us.tdrservice.com/). 
Save this URL for plugin configuration.
3. Generate an API token from your account settings. Save the token securely for plugin configuration.

---

## Select or upload the attached manifest file into your Security Copilot console

1. Download the appropriate YAML manifest file for your region (US or Europe).
2. Sign in to Microsoft Security Copilot.
3. Click the sources icon in the prompt bar. The **Manage sources** dialog box is displayed.
4. Navigate to the **Custom** area, and then click **Add plugin**. The **Add a plugin** dialog box is displayed. 
5. Select **Security Copilot plugin** option for the upload format.
6. Click **Upload file**, select the YAML manifest file from your machine, and then click **Open**. 
7. Navigate to the **Custom** area again, and click **Set up** for the plugin. The **OpenText Core Threat Detection and Response settings** 
dialog box is displayed.
8. In the **Instance URL** box, enter the <Product_URL> for your instance. (It should match the hint text shown in the UI.)
9. In the **Value** box, enter the access token value of the API access token you downloaded. **Note** Do not include the quotation marks 
when you copy the value of the API access token. 
9. Click **Save**. The plugin is added and reflects as OpenText Core Threat Detection and Response in the Custom area of the Manage 
sources dialog box. 


---

## Invoking the Plugin and Skills

1. Use a Natural Language prompt from below examples or use Direct Skill Invocation (`/`)  

---

## Skills & Prompts

- **Top Risky Users**  
  _Prompt:_ What are the top 5 riskiest users on `<date>`?

- **Top Risky Devices**  
  _Prompt:_ What are the top 5 riskiest devices on `<date>`?

- **Top Rare Processes**  
  _Prompt:_ What are the top 5 riskiest rare processes executed on `<date>`? Include alert IDs.

- **Summarize Risky Activity**  
  _Prompt:_ Summarize the risky activity across the organization on `<date>`.

- **Entity Investigation**  
  _Prompt:_ Summarize the risky behaviors of `<username|hostname>` on `<date>`.

- **Alert Details**  
  _Prompt:_ What are the details of the alert with ID `<alert_id>`?

- **Investigation Summary**  
  _Prompt:_ Can you summarize the above investigation and provide a conclusion and recommendation?

---

## Supported Data Sources

- **Microsoft Defender for Endpoint** – Endpoint Detection and Response (EDR)  
- **Microsoft Entra ID** – Identity and access management, including user and application sign-in attempts  

---

## Troubleshooting

1. **Plugin not responding?**  
   - Ensure the plugin is turned on and you are signed in  
   - If prompts are not invoking the correct capabilities, explicitly mention the plugin name in your prompt  
   - If issues persist, contact OpenText Support  

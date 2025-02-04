# QR Code AiTM Phishing Detection Plugin

## Introduction
Welcome to the QR Code AiTM Phishing Detection Plugin! This plugin enhances your cybersecurity efforts by detecting and mitigating QR code phishing attacks. Leveraging insights from Microsoft's Defender Experts, our plugin offers robust protection against these sophisticated phishing campaigns.

## Overview
QR code AiTM (Adversary-in-the-Middle) phishing is a technique where attackers exploit QR codes to redirect users to fraudulent sites. Once users scan the QR code and authenticate, attackers can steal session tokens and perform malicious activities. This plugin helps identify and prevent such attacks by monitoring suspicious email patterns, sender attributes, and user behavior to ensure your organization stays secure.

For more detailed information, refer to the full article [here](https://techcommunity.microsoft.com/t5/microsoft-security-experts-blog/hunting-for-qr-code-aitm-phishing-and-user-compromise/ba-p/4053324).

## Prerequisites
- <span style="color:blue">**Copilot for Security instance**</span>
- <span style="color:blue">**Microsoft Defender for Endpoint**</span>

<span style="color:green">**Note:** This plugin is KQL-based and leverages hunting queries to hunt across Defender tables to identify risky behavior and suspicious activity. The tables include CloudAppEvents, EmailEvents, EmailAttachmentInfo, AADSignIn, etc.</span>

## Step-by-Step Guided Walkthrough
In this guide, we will provide high-level steps to get started using the new tooling. We will start by adding the custom plugin.
1. Go to [Security Copilot](https://securitycopilot.microsoft.com)
2. Download the QR Code AiTM Phishing Detection Plugin YAML File
3. Select the plugins icon in the bottom left corner

![QR Code AiTM Phishing Detection Plugin](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Microsoft%20Security%20Experts/QR%20Code%20AiTM%20Phishing%20Detection%20Plugin/images/Picture1.png)

4. Under Custom upload, select **Upload plugin**

![QR Code AiTM Phishing Detection Plugin](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Microsoft%20Security%20Experts/QR%20Code%20AiTM%20Phishing%20Detection%20Plugin/images/Picture2.png)

5. Select the Copilot for Security plugin and upload the QR Code AiTM Phishing Detection Plugin

![QR Code AiTM Phishing Detection Plugin](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Microsoft%20Security%20Experts/QR%20Code%20AiTM%20Phishing%20Detection%20Plugin/images/Picture3.png)

6. Click **Add**
7. Under Custom, you will see the plugin
![QR Code AiTM Phishing Detection Plugin](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Microsoft%20Security%20Experts/QR%20Code%20AiTM%20Phishing%20Detection%20Plugin/images/Picture4.png)



The custom package contains the following prompts :


under **QRCODE** you will find the following 
![QR Code AiTM Phishing Detection Plugin](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Microsoft%20Security%20Experts/QR%20Code%20AiTM%20Phishing%20Detection%20Plugin/images/Picture5.png)



**Let us get started using this together with the Copilot for Security capabilities**

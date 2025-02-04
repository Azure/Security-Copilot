![Copilot for Security Overview](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)

# Copilot for Security Enrichment Plugin Suite

**Author: Craig Freyman**  

## Overview
This plugin suite enables users to enrich various entities in security operations & investigations. Detailed README's are available for each enrichment type. 

### User Enrichment: A collection of tools to identify who accessed a URL, analyze click patterns, and correlate URL activity with other security events. Designed for security analysts in Defender and Copilot for Security.

### URL Enrichment: Designed to enhance security investigations by providing detailed insights into user interactions with URLs. It allows analysts to track URL clicks, analyze click patterns, and correlate URL activity with other security events for comprehensive risk assessments.

### Incident Enrichment: This suite of incident enrichment plugins is designed to enhance security investigations by providing insights into incident-related alerts. These tools enable security analysts to efficiently correlate, retrieve, and analyze alerts linked to specific incidents for targeted investigations.

### File Enrichment: This suite of file enrichment skills is designed to enhance security investigations by providing detailed insights into file activity on devices. These tools allow analysts to identify potentially malicious files, assess security threats, and recommend remediation steps.

### Email Enrichment: This suite of email enrichment skill is designed to enhance security investigations by providing detailed insights into email activity. These tools allow analysts to identify email interactions based on domains, recipients, or senders and investigate related activity for comprehensive threat analysis.

### Device Enrichment: This suite of device enrichment skills is designed to enhance security investigations by providing insights into device behavior, vulnerabilities, and activity patterns. By leveraging these tools, security teams can monitor device exposure, analyze logon events, and identify vulnerabilities for targeted remediation.

**Note**  
Ensure you have sufficient permissions and access to required datasets within Microsoft Defender or Sentinel before invoking any skills.

## **Pre-requisites**
1. Access to Microsoft Defender and Sentinel environments.  

2. Ensure proper permissions are assigned to query relevant tables (e.g., `SigninLogs`, `EmailEvents`, `DeviceFileEvents`).  

## Select or upload the attached manifest file into your Copilot for Security console
1. Click on the `Sources` button and go to `Custom Plugins`.
2. Click `Security Copilot plugin Custom .yaml or .json`
3. Some plugins leverage Sentinel, if so, enter your Azure information as requested. 
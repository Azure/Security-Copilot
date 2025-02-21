![Copilot for Security Overview](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)

# Copilot for Security Enrichment Plugin Suite

**Author: Craig Freyman**  

## Overview
This plugin suite enables users to enrich various entities in security operations & investigations. Detailed README's are available for each enrichment type. 

### Alert Enrichment
Enhances security investigations by retrieving and correlating alert-related data. Allows analysts to search for alerts by title, retrieve associated evidence, and assess security incidents efficiently.

### User Enrichment
A collection of tools designed to enhance security investigations by analyzing user activities, detecting anomalies in sign-in behavior, tracking password changes, monitoring MFA modifications, and verifying user location information. Helps security teams identify threats and ensure compliance with security policies.

### URL Enrichment
Enhances security investigations by providing detailed insights into user interactions with URLs. Allows analysts to track URL clicks, analyze click patterns, and correlate URL activity with other security events for comprehensive risk assessments.

### Incident Enrichment
Provides insights into incident-related alerts to improve security investigations. Enables security analysts to efficiently correlate, retrieve, and analyze alerts linked to specific incidents for targeted investigations.

### File Enrichment
Enhances security investigations by providing detailed insights into file activity on devices. Helps analysts identify potentially malicious files, assess security threats, and recommend remediation steps.

### Email Enrichment
Enhances security investigations by providing insights into email activity. Allows analysts to identify email interactions based on domains, recipients, senders, and quarantine requests, supporting a comprehensive threat analysis.

### Device Enrichment
Provides insights into device behavior, vulnerabilities, and activity patterns. Helps security teams monitor device exposure, analyze logon events, and identify vulnerabilities for targeted remediation.

### IP Enrichment
Enhances security investigations by analyzing IP-related activities such as failed login attempts, brute-force attacks, and login anomalies. Supports detection of suspicious login behavior and potential threats.

### Purview Enrichment
Designed to enhance security investigations by querying DLP events and file activities for users and devices. Helps security analysts correlate data loss prevention (DLP) alerts with other event types to aid in investigation and response efforts.

**Note**  
Ensure you have sufficient permissions and access to required datasets within Microsoft Defender or Sentinel before invoking any skills.

## **Pre-requisites**
1. Access to Microsoft Defender and Sentinel environments.  

2. Ensure proper permissions are assigned to query relevant tables (e.g., `SigninLogs`, `EmailEvents`, `DeviceFileEvents`).  

## Select or upload the attached manifest file into your Copilot for Security console
1. Click on the `Sources` button and go to `Custom Plugins`.
2. Click `Security Copilot plugin Custom .yaml or .json`
3. Some plugins leverage Sentinel, if so, enter your Azure information as requested.


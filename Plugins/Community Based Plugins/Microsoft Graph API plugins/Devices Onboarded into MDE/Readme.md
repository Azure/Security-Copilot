# Plugin to retrieve Devices Onboarded into Microsoft Defender for Endpoint (MDE) Plugin

## Overview
This plugin enables users to retrieve a list of devices onboarded into **Microsoft Defender for Endpoint (MDE)** using the **Microsoft Graph API**. It provides valuable insights into device details, compliance status, risk levels, and more, facilitating security monitoring and incident response.

## Features
- Retrieves device details including **device name, OS, manufacturer, model, serial number, and MAC address**.
- Identifies **compliance state** and **risk level** of onboarded devices.
- Fetches devices based on **last seen date** 
- Supports filtering for devices based on **Azure AD join status, compliance status, and OS platform**.

## API Endpoint
**Base URL:** `https://graph.microsoft.com/v1.0`


### Setup instructions
#### Upload the Plugin manifest

1. Obtain the manifest  [MDEOnboardedDevicesPlugin.yaml](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Microsoft%20Graph%20API%20/Devices%20Onboarded%20into%20MDE/MDEOnboardedDevicesPlugin.yaml) and the OpenAPI Specification [MDEOnboardedDevices-OpenAPISpec.yaml](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Microsoft%20Graph%20API%20/Devices%20Onboarded%20into%20MDE/MDEOnboardedDevices-OpenAPISpec.yaml) files from this directory.
2. Download the Git Hub gist file and move it to your prefered location, ensuring it is reachable by Securty  Copilot 


3. [Upload the custom plugin](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#add-custom-plugins) 

## Example Natural Language Queries
Use these sample prompts to retrieve relevant data via **Security Copilot**:
- "Retrieve devices onboarded to MDE that have a compliance state of 'Non-compliant'"
- "Get the list of non-compliant devices from devices onboarded to MDE"
- "Retrieve a list of devices onboarded onto MDE that have a Risk Level of 'High'"
- "Retrieve devices from MDE that registered less than 14 days ago from today"
- "Retrieve a list of MDE endpoints that were last seen less than 1 day ago"
- "Get devices from MDE that have the iOS operating system"


---
For more details, visit the **[Microsoft Graph API documentation](https://learn.microsoft.com/en-us/graph/)**.

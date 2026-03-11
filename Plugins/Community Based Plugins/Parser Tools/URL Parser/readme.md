# Security Copilot Plugin: URL Parser

### **This KQL plugin enables SOC analysts to parse URLs into a more readable format.**

### Prerequisites

-   [Security Copilot enabled](https://learn.microsoft.com/en-us/security-copilot/get-started-security-copilot#onboarding-to-microsoft-security-copilot)
-   [Access to upload custom plugins](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#managing-custom-plugins)

### Instructions

#### Upload the Custom Plugin

1.  Obtain the file URL_Parser.yaml from this directory.
2.  Upload the custom plugin

### Plugin Utilisation

#### Skills

- **ParseURL**: Parse provided URL and return scheme, host, port, username and password, query parameters and fragments
- **ParseURLQuery**: Parse provided URL query parameters and return a dynamic object
- **DecodeURL**: Converts an encoded URL into a regular URL representation

#### Example Prompts

- Parse the following URL:
- Identify the username and password in this URL:
- Parse the following URL query parameter:
- Convert this encoded URL into a regular URL representation:

#### Example Usage

1. A SOC analyst is investigating an intrusion detection system (IDS) incident and has found a suspiciously long URL which appears to be a callout to C&C infrastructure 
2. The ParseURL skill is used to break down the URL into its relevant components, indicating the type of infrastructure used to communicate with the C&C server
3. The DecodeURL skill is used to decode the encoded part of the URL

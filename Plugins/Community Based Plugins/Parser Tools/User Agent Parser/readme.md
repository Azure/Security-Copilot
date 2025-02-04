# Security Copilot Plugin: User Agent Parser

### **This KQL plugin enables SOC analysts to parse a provided user agent string and return browser, operating system and device details**

### Prerequisites

-   [Security Copilot enabled](https://learn.microsoft.com/en-us/security-copilot/get-started-security-copilot#onboarding-to-microsoft-security-copilot)
-   [Access to upload custom plugins](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#managing-custom-plugins)

### Instructions

#### Upload the Custom Plugin

1.  Obtain the file User_Agent_Parser.yaml from this directory.
2.  Upload the custom plugin

### Plugin Utilisation

#### Skills

- **ParseUserAgent**: Parse provided user agent string and return browser, operating system and device details

#### Example Prompts

- Parse the following user agent string: <USERAGENT>
- Identify the browser and version from this user agent: <USERAGENT>
- Extract the operating system details from this user agent: <USERAGENT>

#### Example Usage

1. A SOC analyst is investigating a web application firewall (WAF) incident and has identified a suspicious user agent string in the SIEM logs.
2. The ParseUserAgent skill is used to get a summary of the user agent string, including details about the browser, operating system and device.

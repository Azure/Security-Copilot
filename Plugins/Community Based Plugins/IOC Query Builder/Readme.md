# Copilot for Security Plugin: IOC Query Builder

### **This GPT plugin enables a SOC analyst to input a list of indicators of compromise (IOCs) and format them so they can be used in a KQL query in Sentinel and/or Defender XDR.**

### Pre-requisites

-   [Copilot for Security Enabled](https://learn.microsoft.com/en-us/security-copilot/get-started-security-copilot#onboarding-to-microsoft-security-copilot)
-   [Access to upload custom plugins](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#managing-custom-plugins)

### Instructions

#### Upload the Custom Plugin

1.  Obtain the file IOC_Query_Builder.yaml from this directory.
2.  Upload the custom plugin

### Plugin Utilisation

#### Skills

- **GenerateIOCListForKQL**: Formats a list of IOCs so they can be used by SOC analysts in KQL queries

#### Example Prompts

- Format the following list of IOCs:
- Create a dynamic array from this list of IP addresses:
- Format the following list of hashes:

#### Example Usage

1. Use the FetchURL skill to gather a list of IOCs from a threat intelligence report webpage.
2. Use the GenerateIOCListForKQL skill to format the list of IOCs for use in a KQL query.

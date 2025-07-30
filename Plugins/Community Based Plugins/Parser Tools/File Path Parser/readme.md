# Security Copilot Plugin: File Path Parser

### **This KQL plugin enables SOC analysts to parse file paths and extract key metadata.**

### Prerequisites

-   [Security Copilot enabled](https://learn.microsoft.com/en-us/security-copilot/get-started-security-copilot#onboarding-to-microsoft-security-copilot)
-   [Access to upload custom plugins](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#managing-custom-plugins)

### Instructions

#### Upload the Custom Plugin

1.  Obtain the file File_Path_Parser.yaml from this directory.
2.  Upload the custom plugin

### Plugin Utilisation

#### Skills

- **ParseFilePath**: Parse provided file path and return a dynamic object that contains the following parts of the path - Scheme, RootPath, DirectoryPath, DirectoryName, Filename, Extension, AlternateDataStreamName

#### Example Prompts

- Parse the following file path:
- Identify the root and directory from this file path:
- Extract the alternative data stream from this file path:
- Analyse this folder path and provide a summary:

#### Example Usage

1. A SOC analyst is investigating a Defender for Endpoint incident and has found a suspicious file
2. The ParseFilePath skill is used to extract the directory path and alternative data stream name from the file path

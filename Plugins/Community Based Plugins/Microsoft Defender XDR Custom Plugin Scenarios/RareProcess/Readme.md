# Security Copilot Plugin: Sentinel Table Ingestion Issues

### **This query looks for rarely seen processes which are launched as a service on an endpoint protected by MDE. Modify the query to allow-list processes that are expected in your environment.**

### Pre-requisites

-   [Security Copilot Enabled](https://learn.microsoft.com/en-us/security-copilot/get-started-security-copilot#onboarding-to-microsoft-security-copilot)
-   [Access to upload custom plugins](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#managing-custom-plugins)
-   [Microsoft Defencer XDR](https://learn.microsoft.com/en-us/defender-xdr/microsoft-365-defender) 

-   Plugin uses permissions of the user setting it up 

### Instructions

#### Upload the Custom Plugin

1.  Obtain the file RareProcessAsAService.yaml from this directory.


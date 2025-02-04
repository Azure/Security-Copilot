# Security Copilot Custom Plugin - KQL - Server Agents Assessment with Defender Vulnerability Management

The skill in this custom pluging is able to retrieve the versions of the Arc, AMA, MMA and MDE software components running on the Windows and Linux servers. The retrieval is done via KQL query made to the Advanced Hunting feature of Defender XDR on the servers' inventory data collected by Microsoft Defender Vulnerability Management.

### Acronyms:
* Arc -> It's just Azure Arc
* AMA -> Azure Monitoring Agent
* MMA -> Microsoft Monitoring Agent
* MDE -> Microsoft Defender for Endpoint
* MDVM -> Microsoft Defender Vulnerability Management
* XDR -> eXtended Detection and Response


### Refereces of the versions of these components: 
* MMA for Windows Server: https://learn.microsoft.com/en-us/azure/virtual-machines/extensions/oms-windows#agent-and-vm-extension-version
* MMA for Linux: https://learn.microsoft.com/en-us/azure/virtual-machines/extensions/oms-linux
* AMA for Windows Server  and Linux: https://learn.microsoft.com/en-us/azure/azure-monitor/agents/azure-monitor-agent-extension-versions
* MDE for Windows Server: https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/windows-whatsnew?view=o365-worldwide
* MDE for Linux: https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/linux-whatsnew?view=o365-worldwide
* Arc for Windows Server and Linux: https://learn.microsoft.com/en-us/azure/azure-arc/servers/agent-release-notes


### Prerequisites:
* Microsoft Defender for Endpoint (MDE) or Microsoft Defender Vulnerability Management (MDVM) running on those servers (the software inventory is done by MDVM).


### Limitations:
Currently the skill is not able to retrieve the version of the AMA agent running on Windows Servers. 


### Instructions: 
1. Download the YAML file in this folder. Save it locally in your PC and open in for editing its content
2. Add the plugin by uploading the YAML in Security Copilot (https://learn.microsoft.com/en-us/copilot/security/manage-plugins?tabs=securitycopilotplugin)

# Security Copilot Plugin: MDE Attack Surface Reduction (ASR)

### **This KQL plugin enables SOC analysts and engineers to get insights about ASR rules in their environment based on the Defender for Endpoint DeviceEvents table.**

### Pre-requisites

-   [Security Copilot enabled](https://learn.microsoft.com/en-us/security-copilot/get-started-security-copilot#onboarding-to-microsoft-security-copilot)
-   [Access to upload custom plugins](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#managing-custom-plugins)
-   [Attack Surface Reduction rules enabled](https://learn.microsoft.com/en-us/defender-endpoint/overview-attack-surface-reduction#configure-attack-surface-reduction-capabilities)

### Instructions

#### Upload the Custom Plugin

1.  Obtain the file MDE_Attack_Surface_Reduction.yaml from this directory.
2.  Upload the custom plugin

### Plugin Utilisation

#### Skills

- **GetASREventCountWithinTimeframe**: Fetches a count of ASR events within the specified timeframe
- **GetASREventsForDevice**: Fetches a count of ASR events for a specified device name or device ID
- **GetASREventsForFile**: Fetches a count of ASR events for a specified file name
- **GetASRBlockedEvents**: Fetches a count of the top 25 ASR blocked events
- **GetASRAuditedEvents**: Fetches a count of the top 25 ASR audited events
- **GetASREventsByCategory**: Fetches a count of ASR events grouped by category and day

#### Example Prompts

- Get a count of the ASR events from the past 24 hours
- Fetch a count of the Attack Surface Reduction events seen on device DEVICENAME in the past 7 days
- List the count of ASR events for file FILENAME.EXE in the past 24 hours
- Get a count of the blocked ASR events from the past 7 days
- Fetch a count of the audited Attack Surface Reduction events from the past 24 hours
- List the ASR events grouped by category and day from the past 48 hours
- Get a count of the Attack Surface Reduction events grouped by category and day from the last 30 days

#### Example Usage

1. A desktop engineer is drafting a report for senior leadership about the organisation’s attack surface.
2. The GetASREventCountWithinTimeframe skill is used to get a summary of the ASR rules that were triggered over the past 30 days.
3. The Microsoft Defender Threat Intelligence (MDTI) plugin is used to get context about the tactics, techniques and procedures (TTPs) that the ASR rules will protect against.
4. The Generic plugin is used to summarise the previous prompts and provide recommendations about which ASR audit rules should be switched to blocked.

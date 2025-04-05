# Enrichment Plugin Suite
**Author: Craig Freyman**

## DeviceEnrichment Plugin
This suite of device enrichment skills is designed to enhance security investigations by providing insights into device behavior, vulnerabilities, and activity patterns. By leveraging these tools, security teams can monitor device exposure, analyze logon events, and identify vulnerabilities for targeted remediation.

### DeviceExposureLevel
Summarize device exposure levels in the environment by identifying the total number of high-risk devices and high-risk internet-facing devices. Helps prioritize remediation efforts for critical assets.

Example Prompt: Summarize exposure levels for all devices in the network.

### DeviceLogonSearch
Retrieve a detailed log of interactive and remote device logon events for a specified account on a specific date. Includes device ID, device name, logon timestamps, and account name to aid in tracking user activity and identifying associated devices.

Example Prompt: Retrieve logon events for jsmith on 2024-09-13.

### DeviceTimeline
Retrieve and analyze a detailed timeline of device events and security alerts surrounding a specific timestamp for a given device. Includes file actions, network connections, process activity, and related alerts to investigate suspicious behavior and anomalies.

Example Prompt: Build a timeline of device events for laptop-win10v around 2024-08-30T01:10:39.501000.

### DeviceCVESearch
Retrieve a list of software vulnerabilities (CVEs) affecting a specified device, filtered by severity level (Critical, High, Medium, or Low). Provides insights into software vendors, vulnerability impacts, and the device's overall security posture to help prioritize remediation efforts.

Example Prompt: List CVEs for some-host-name with severity level High.

### CVEHostSearch
Retrieve a list of devices affected by a specified CVE identifier. Provides insights into the impact of the vulnerability on each device, highlights critical risks, and assesses the overall security posture to support remediation efforts across the network.

Example Prompt: Find all devices affected by CVE-2023-12345.

### DeviceDefenderSensorHealthReport
Analyzes Microsoft Defender sensor health and configuration status across Windows, macOS, and Linux devices. Evaluates critical security features, including tamper protection, real-time protection, cloud protection, and behavior monitoring. Assesses Defender operational states (Active, Passive, EDR Blocked) and compliance status.

Example Prompt: Retrieve Defender sensor health status for device01.

### DefenderAvSignatureHealthReport
Evaluates Microsoft Defender antivirus signature currency and real-time protection status across Windows, macOS, and Linux devices. Identifies outdated signature versions, monitors the latest available signatures, and detects devices with inactive real-time protection.

Example Prompt: Get Defender AV signature health report for all devices.

### WindowsCriticalVulnerabilitiesReport
Assesses critical vulnerabilities on Windows 10 and 11 devices. Identifies high-risk devices with the most critical vulnerabilities, tracks exploitable CVEs, and evaluates zero-day vulnerabilities. Helps prioritize remediation efforts based on severity and exploitability.

Example Prompt: List top 10 Windows devices with critical vulnerabilities.

### ASRRuleTriggerCount
Analyzes the frequency of Attack Surface Reduction (ASR) rule triggers across devices. Identifies high-frequency rules and helps security teams assess potential disruption before enabling ASR rules in enforcement mode.

Example Prompt: Show the most frequently triggered ASR rules in our environment.

### ASRBusinessHoursImpact
Analyzes when ASR rules are triggered to assess business operational impact. Compares working hours vs. non-working hours trigger patterns and identifies rules with the highest impact during business hours.

Example Prompt: Analyze ASR rule impact during business hours.

### ASRImplementationPlan
Creates a phased implementation plan for ASR rules based on impact assessment. Calculates combined impact scores and categorizes rules into low, medium, and high impact phases for a staged approach to enforcement.

Example Prompt: Create a phased implementation plan for ASR rules.

### ASRPlatformCompatibility
Analyzes ASR rule compatibility with different Windows platforms. Creates a platform compatibility matrix showing which rules are supported on which platforms to prevent attempted enforcement of unsupported rules.

Example Prompt: Show ASR rule compatibility across our Windows platforms.

### ASRImpactByDevice
Analyzes ASR rule triggers per device to determine operational impact. Identifies endpoints at risk of breaking functionality when ASR rules are enforced.

Example Prompt: Identify devices most impacted by ASR rules.

### ASRRuleTrends
Tracks how ASR rules are triggered over time. Monitors daily ASR rule trigger counts and helps assess whether rules are becoming more or less impactful over time.

Example Prompt: Show ASR rule triggering trends over the past month.

### ASRRuleApplicationMapping
Maps ASR rules to specific applications to understand business impact. Identifies which applications trigger specific ASR rules and helps develop targeted exclusion strategies for business-critical applications.

Example Prompt: Map ASR rules to the applications they impact.

### ASRUserImpactAnalysis
Analyzes ASR rule triggers by user to determine operational impact. Identifies departments at risk of workflow disruption and helps plan targeted user communication before enforcement.

Example Prompt: Analyze which users are most affected by ASR rules.

### ASRExclusionCandidates
Identifies potential candidates for ASR rule exclusions based on trigger frequency. Creates ready-to-use exclusion path formats to minimize disruption when moving to enforcement mode.

Example Prompt: Find candidates for ASR rule exclusions.

### ASRProcessAnalysis
Analyzes which specific processes are triggering ASR rules. Provides detailed information on process paths, file names, and command lines to distinguish between legitimate software needing exclusions and potentially malicious activity.

Example Prompt: Analyze which processes are triggering ASR rules.
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

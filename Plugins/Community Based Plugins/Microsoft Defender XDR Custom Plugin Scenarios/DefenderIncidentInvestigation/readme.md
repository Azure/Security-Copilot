# Defender Incident Investigation

<br>

## DESCRIPTION

The two custom plugins, "Custom Plugin Defender Device Investigation" and "Custom Plugin Defender Device Info," provide a range of Security Copilot skills to support device investigation and hunting within Microsoft Defender XDR.

<br>

## TYPE AND REQUIREMENTS

- **TYPE**: KQL (Defender)
- **SOURCE**: Defender for Endpoint schema tables
- **REQUIREMENTS**: Access to Defender XDR

<br>

## The “Custom Plugin Defender Device Investigation” provides the following skills:

Title: **File - Files Downloaded**

- Description: Lists files downloaded to this device in specific timeframe within past 30 days.

Title: **File - Last 15 Days Files Downloaded**

- Description: Lists files downloaded to this device in the last 15 days.

Title: **File - Any Device Events Related To This File**

- Description: Display device events that include the filename, in specific timeframe.

Title: **File -** **Sensitive Files Events**

- Description: Lists sensitive files events on this device in the last 10 days.

Title: **File - File Origin**

- Description: Display the origin or source of the file, in past 30 days.

Title: **Process -** **Process Executions Summary**

- Description: Summary of process executions on this device in specific timeframe.

Title: **Process - Detailed Process Executions**

- Description: Detailed all process execution events on device within a brief period, e.g. an hour.

Title: **Process - Detailed Process Events**

- Description: Detailed specific process execution events on device within a defined time frame.

Title: **Lateral Movement - RDP To Device**

- Description: Inbound RDP connection to this device in a specific timeframe.

Title: **Lateral Movement - Logon To Device**

- Description: Logon events from other devices to this device in a specific timeframe.

Title: **Lateral Movement - Logons To Device In Last 10 Days**

- Description: Logon events from other devices to this device in the last 10 days.

Title: **Network - Outbound Network Events**

- Description: Device outbound network events, including attempts and failed connections.

Title: **Network - Inbound Network Events**

- Description: Device inbound network events and attempts in a specific timeframe.

Title: **Network - Device Listening Ports**

- Description: Displays device listening ports in specific timeframe.

Title: **Device Events - Scheduled Task Events**

- Description: Scheduled task events seen on a device in a specific timeframe.

Title: **Device Events - User Account Events**

- Description: User account events seen on a device in a specific timeframe.

Title: **Device Events - User Account Added Or Removed From Local Group**

- Description: User account added or removed from local group in a specific timeframe.

Title: **Suspicious Activities - ASR Rules Triggered**

- Description: ASR rules that were triggered on this device in the past 7 days.

Title: **Suspicious Activities - ASMSI Script Detection**

- Description: Script detection from Windows Antimalware Scan Interface (AMSI) in past 7 days.

Title: **Suspicious Activities - Exploit Guard Events**

- Description: Exploit Guard events detected on this device in past 7 days.

Title: **Suspicious Activities - Network Protection Events**

- Description: Network Protection events triggered on this device in the past 7 days.

Title: **Suspicious Activities - Device Tampering Attempts**

- Description: Possible tampering attempts on this device in the past 7 days.

<br>

## The “Custom Plugin Defender Device Info” offers the following skills:

Title: **Device OS Information**

- Description: Latest device OS information with the device name as the input.

Title: **Device Current and Past IPs**

- Description: The current and past IPs assigned to this device in the last 10 days.

Title: **Device Users and Login Counts**

- Description: List users logged onto this device and the number of times, within the last 10 days.

Title: **Device Alert Information**

- Description: Alerts observed on this device in the last 30 days.

Title: **Device Installed Applications**

- Description: Currently installed applications on this device.

Title: **Device Vulnerability Information**

- Description: Vulnerabilities identified on this device.

Title: **Device Critical Vulnerabilities**

- Description: Vulnerability with CVSS score 7 or higher, or exploit is publicly available.
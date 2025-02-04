![Security CoPilot Logo](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)

# Accelerating the Anomalous Sign-Ins detection with Microsoft Entra ID and Security Copilot

In today’s complex threat landscape, identity protection is critical for securing organizational assets. A common sign of compromise is user activity indicating connections from multiple locations separated by over X- kilometers within a short period. Such events might represent risky sign-ins, requiring Security Analysts to determine whether they are true positives (indicating malicious activity) or false positives (such as misconfigured settings or benign anomalies).

To enhance efficiency and accelerate the investigation process, organizations can leverage AI tools like Microsoft Security Copilot. By integrating Security Copilot with Microsoft Entra ID mainly AADUserRiskEvent and developing custom Promptbooks, organizations can investigate risky sign-ins, reduce manual workloads, and enable proactive decision-making to boost SOC efficiency in such scenarios.

Disclaimer: Please know these are sample prompts and are subject to Change




**Required plugins** : Microsoft Defender XDR, Public Web

**Required Input**:<TimeIntervalByDays>

**Required Input**:<ConnectionsInterbalByHrs>

**Required Input**:<SepratedDistanceByKM>

**Description**: Organizations face significant challenges in investigating and triaging identity protection alerts for sign-in anomalies, especially when users appear to log in from geographically disparate locations within hours. These challenges include:

- Volume of Alerts: Large organizations generate numerous risky sign-in events daily.
- False Positives: Legitimate activities, such as VPN connections or device relocations, may be flagged.
- Resource Constraints: Security teams must efficiently prioritize true positives for investigation.

Using Microsoft Security Copilot with a tailored Promptbook, Security Analysts can automate the initial triage process and focus on meaningful insights. This approach combines data querying, AI-driven analysis, and actionable recommendations to improve investigation workflows.

1. First Prompt: Data Retrieval from Defender XDR via KQL Query
 ```
 Retrieve Defender XDR information using this KQL query: let riskyusers = AADUserRiskEvents | where TimeGenerated is greater than or equal ago(<TimeIntervalByDays>) | project UserPrincipalName, TimeGenerated, Location, IpAddress, RiskState, Id, RiskEventType; riskyusers | join kind=inner ( riskyusers | extend TimeGenerated1 = TimeGenerated, LocationDetails1 = Location ) on UserPrincipalName | where TimeGenerated is less than TimeGenerated1 and datetime_diff('hour', TimeGenerated1, TimeGenerated) is less than or equal <ConnectionsInterbalByHrs> | extend latyy = Location.geoCoordinates.latitude | extend longy= Location.geoCoordinates.longitude | extend latyy1 = LocationDetails1.geoCoordinates.latitude | extend longy1 = LocationDetails1.geoCoordinates.longitude | extend distance = geo_distance_2points(todouble(Location.geoCoordinates.latitude), todouble(Location.geoCoordinates.longitude), todouble(LocationDetails1.geoCoordinates.latitude), todouble(LocationDetails1.geoCoordinates.longitude)) | where distance is greater than or equal <SepratedDistanceByKM> | summarize arg_max(TimeGenerated, *) by Id | where RiskState is not equal @"dismissed" | project UserPrincipalName, TimeGenerated, IpAddress, Location, TimeGenerated1, IpAddress1, LocationDetails1, RiskEventType, distance
 ```
2.  Second Prompt: AI Analysis for Patterns and Recommendations
 ```
/AnalyzeSecurityData Provide your insights as Security Analyst about what anomalies or similarity patterns can you identify. Provide a list of prompts for Security Copilot to investigate further and a list of recommendations. Use as input security data the information in the table from the previous prompt in this session.
 ```
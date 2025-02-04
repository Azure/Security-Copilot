# Tutorial: Generate Security Copilot Risky Incident Reports 

Intent: As a SecOps Analyst or Manager, I want to automatically create detailed incident reports summazrizing critical investigation tasks and evidence for the riskiest incidents in my organization.

The [Incident Report Skill](https://learn.microsoft.com/en-us/defender-xdr/security-copilot-m365d-create-incident-report) in Copilot for Security generates a detailed incident report based on the automated actions, the analysts involved in the incident response, and the comments from the analysts. Whether security teams are using Microsoft Sentinel, Defender XDR, or both, all relevant incident data are added into the generated incident report.

One way to automatically gather critical evidence pertaining to an incident is to utilze the [Sentinel Triage Assistant (STAT)](https://techcommunity.microsoft.com/t5/microsoft-sentinel-blog/introducing-the-microsoft-sentinel-triage-assistant-stat/ba-p/3845846). STAT gathers all related evidence pertaining to the incident's entities through various [STAT Modules](https://github.com/briandelmsft/SentinelAutomationModules/tree/main/Modules) and adds the related evidence as Comments on the incident. This means that the Copilot for Security Incident Report skill can utilize this evidence when generating an incident report. STAT also has a [Risk Scoring Module](https://github.com/briandelmsft/SentinelAutomationModules/tree/main/Modules/ScoringModule) that allows you to generate an integer value indicating the overall risk level of an incident. The Incident Risk Score allows us to tag incidents with an integer value associated with the total risk, we can regularly look for incidents with the highest risk level to generate incident reports using Copilot for Security.

These incident reports could be run post mortem, during incident creation (after STAT runs), or on a schedule to spot check how analysts completed incident work.

## Prerequisites

Microsoft Sentinel configured with the new [Unified SOC Preview](https://learn.microsoft.com/en-us/azure/sentinel/connect-microsoft-365-defender?tabs=MDE) enabled 

[Sentinel Triage Assistant (STAT)](https://github.com/briandelmsft/SentinelAutomationModules) deployed with all modules adding comments, scoring module configured and incidents in Sentinel tagged as "Risk Score - totalRiskScore".

[Microsoft Copilot for Security](https://learn.microsoft.com/en-us/copilot/security/get-started-security-copilot) deployed with available SCU Capacity.

## Step 1: Deploy this logic app to your organization

If your Azure environment meets the prerequisites, and you're familiar with using Azure Resource Manager templates, these steps help you sign in directly to Azure and open the Azure Resource Manager template in the Azure portal. For more information, see the article, [Deploy resources with Azure Resource Manager templates and Azure portal](https://docs.microsoft.com/azure/azure-resource-manager/templates/overview).

Select the following image to sign in with your Azure account and open the logic app in the Azure portal:

   [![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FSecurity-Copilot%2Fmain%2FLogic%2520Apps%2FGet-CfS-Risky-Incidents-Report%2Fazuredeploy.json)

1. In the portal, on the **Custom deployment** page, enter or select these values:

   | Property | Value | Description |
   |----------|-------|-------------|
   | **Subscription** | <*Azure-subscription-name*> | The name for the Azure subscription to use |
   | **Resource group** | <*Azure-resource-group-name*> | The name for a new or existing Azure resource group |
   | **Region** |  <*Azure-region-for-all-resources*> | The Azure region to use for all resources, if different from the default value. This example uses the default value which is the resource group location. |
   | **Playbook Name**|  <*PlaybookName*> | This is the name for the deployed Logic App. |
   | **Incident Count** | <*incidentCount*> | Maximum number of incident to return (ie. 10) |
   | **Look Back Days** | <*lookBack*> | How many days to look back (ie. -7) |
   | **Min Risk Score** | <*minRiskScore*> | Minimum STAT Risk Score of Incidents (ie. 0) |

1. When you're done, select **Review + Create** and finally **Create**.

## Step 2: Authenticate your logic app to Azure Monitor, Teams and Copilot for Security

Edit the Logic App and modify the connections for the following Actions

**Get Riskiest Incidents** - Modify this connection with an identity with permission to connect to your Log Analytics workspace where your Sentinel incidents reside. Ensure you select your Subscription, Resource Group, Resource Type and Resource Name to point to your Log Analytics Workspace.

**Cfs Risk Incident Report** - Modify this connection with an identity with permissions to connect to your Copilot for Security instance.

**Post Risk Incident Report in Teams Channel** - Modify this connection with an identity with permissions to post a message to a Teams Channel. Don't for get to choose your Team and Channel ID.

**Add Risk Incident Report to Incident** and **Tag Risk Incident with Copilot Summary** - Modify these connections with an identity with access to modify incidents within your Sentinel workspace.

![Get-CFS-Risky-Incidents-Report](https://github.com/Azure/Copilot-For-Security/blob/main/Images/Logicapp%20images/Get-CFS-Risky-Incidents-Report.png)

## Next steps

This Logic App is scheduled to run weekly, you can modify the schedule from the initial recurrance step.

You can modify the KQL query in the **Get Riskiest Incidents action**, by default this query looks at the SecurityIncident table in Sentinel, and parses out the tagged STAT Risk Score from the labels column. It then outputs the top 10 riskiest incidents based on the total risk score tagged on STAT incidents. Feel free to modify this query to look at all incidents, or incidents with a certain status (ie. Closed or Resolved only), assigned to a certain analyst, etc.

1. Manually trigger the Playbook or wait for its scheduled run.
2. Copilot for Security will generate Incident reports on each incident found, add the incident report to the incident via a Sentinel comment, tag the incident with "Copilot Summary", and post the Incident report to a desired Teams channel.

## Sample Incident Reports

The following are sample Incident Reports were generated with nothing other then a single prompt utilizing the [Incident Report Skill](https://learn.microsoft.com/en-us/defender-xdr/security-copilot-m365d-create-incident-report) from Copilot for Security on Incidents that were triaged using the [Sentinel Triage Assistant (STAT)](https://github.com/briandelmsft/SentinelAutomationModules).

---------------------------------------------------------------------------------------------------------

Apr 26, 2024 10:15 AM
**Incident report**
by Copilot - Apr 26, 2024 10:15 AM

Incident title
Multi-stage incident on one endpoint

**Incident details**
**Analysts** Analyst@contoso.com
**Time created** 04/18/2024 02:29:44
**First log** 04/26/2024 02:41:12
**Last log** 04/26/2024 03:05:02
**Time closed** 04/26/2024 02:59:53

**Incident summary**
The high severity incident titled 'Multi-stage incident on one endpoint' occurred between 2024-04-18 02:29:44 UTC and 2024-04-26 10:29:44 UTC.
**Impact:** The incident began on 2024-04-18 02:29:44 UTC when a threat intelligence (TI) match was found between an IP entity and a W3CIISLog. The IP 185.224.128.43 was impacting the machine 'CONTOSO-ADMIN'.
Later that day, at 2024-04-18 10:29:44 UTC, another TI match was found, this time involving two IP addresses, 45.56.108.128 and 57.129.23.166, again impacting the machine 'CONTOSO-ADMIN'.
**CredentialAccess:** The incident escalated on 2024-04-26 01:52:34 UTC when there were excessive failed login attempts to an IIS Web Server from unknown IP addresses. The IPs involved were 45.128.232.229 and 185.224.128.43, and the machine impacted was again 'CONTOSO-ADMIN'. This suggests an attempt to gain unauthorized access to the system.

**Classification**
**Benign positive - Security testing**
The incident was part of a security testing exercise involving a honeypot. The machine involved in the incident, CONTOSO-ADMIN, accepted an inbound connection from an IP address associated with a botnet. However, no alerts related to the incident were found, and no entities were found to be at risk.

**Investigation actions**
Megan Bowen was assigned to the incident by the 'LA-ASI-ShiftAssignment_v3' Playbook.
The IP address 185.224.128.43, located in Wormer, Noord-Holland, Netherlands, and associated with the organization Alsycon B.V., was identified as part of the incident.
The IP address was flagged by the Threat Intelligence data with a confidence score of 100, indicating it is part of a botnet.
The IP address was reported 8299 times for abuse and is listed on AbuseIPDB.
The machine involved in the incident, CONTOSO-ADMIN, accepted an inbound connection from the aforementioned IP address on port 80 using the TCP protocol.
The total calculated risk score for the incident was determined to be 20, primarily due to the Threat Intel Risk.
The incident was identified as part of a security testing exercise involving a honeypot.
The playbooks "LA-ASI-ShiftAssignment_v3" and "Get-SOCGPT-Triage-V2" were triggered during the incident.
No alerts related to the incident were found, and no entities were found to be at risk.

**Remediation actions**
No remediation actions yet

**Follow-up actions**
No follow-up actions yet

---------------------------------------------------------------------------------------------------------

Apr 25, 2024 7:33 PM
**Incident report**
by Copilot - Apr 25, 2024 7:27 PM

**Incident title**
Bitsadmin abuse by domain user account on one endpoint

**Incident details**
Analysts analyst@contoso.com
Time created 04/26/2024 00:00:01
First log 04/26/2024 00:15:44
Last log 04/26/2024 02:22:17
Time closed 04/26/2024 02:22:17

**Incident summary**
The high severity incident 'Bitsadmin abuse by domain user account on one endpoint' occurred at 2024-04-26 00:00:01 UTC.
DefenseEvasion: The incident involved user 'user' on the device 'contoso-util' (WindowsServer2019). The user was associated with the abuse of Bitsadmin, a command-line tool that administrators use to create download or upload jobs and monitor their progress. The abuse involved two processes, 'bitsadmin.exe' and 'cmd.exe', indicating a potential attempt to evade detection or defenses on the system.

**Classification**
**Benign positive - Security testing**
The incident was classified as "BenignPositive" due to the fact that it was confirmed to be a simulation. The user involved, user@contoso.com, was a SecOps Analyst in the Security Operations department and held multiple administrative roles. Despite the presence of seven related alerts, the user's risk level was low, with no MFA failures, MFA frauds, Risk detections, or Suspicious Activity reports. The user was also on the VIP watchlist. The risk score of the devices used by the user and present in the incident was medium, with a low exposure level. The user's threat score was 70 and was trending up. However, no matching Threat Intelligence data was found, further supporting the classification.

**Investigation actions**
The incident was assigned to Megan Bowen by the 'LA-ASI-ShiftAssignment_v3' Playbook for investigation.
A total of seven related alerts were found, including Bitsadmin abuse by domain user account, User and IP address reconnaissance (SMB), Firewall tampering by domain user account, User and group membership reconnaissance (SAMR), and Anomalous account lookups.
The user's risk level was assessed as low with no MFA failures, MFA frauds, Risk detections, or Suspicious Activity reports.
The user's presence on the VIP watchlist was noted.
A search for matching Threat Intelligence data was conducted, but none was found.
The risk score of the devices used by the user and present in the incident was evaluated as medium, with a low exposure level.
The user's threat score was calculated to be 70 and was trending up.
Two records of Endpoint DLP Activities for user@contoso.com were found in the Sentinel search, involving the copying of sensitive files to a network share.
The total calculated risk score for the incident was determined to be 106, with the highest risk coming from related alerts and the user being on the watchlist.

Remediation actions
No remediation actions yet

Follow-up actions
No follow-up actions yet

---------------------------------------------------------------------------------------------------------

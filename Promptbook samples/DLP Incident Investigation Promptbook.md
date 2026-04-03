![Security CoPilot Logo](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)

# DLP Incident Investigation and Response Promptbook

## Overview

In today's data-driven enterprise environment, Data Loss Prevention (DLP) incidents represent one of the most critical threats to organizational security. When a DLP alert fires, security analysts must rapidly determine the scope of sensitive data exposure, assess the risk posture of the involved user, correlate activity across multiple workloads (Exchange, Teams, SharePoint, Endpoints), and decide on appropriate remediation actions.

This promptbook provides a structured, multi-step investigation workflow that guides Security Analysts through a complete DLP incident lifecycle — from initial alert triage through user risk assessment, data exposure analysis, cross-workload correlation, and actionable remediation recommendations.

## Intended Audience

- **Security Operations Center (SOC) Analysts** investigating DLP incidents
- **Data Security Administrators** performing DLP alert triage and response
- **Compliance Officers** assessing data exposure and regulatory risk
- **Incident Responders** correlating user activity across Microsoft 365 workloads

## Intended Uses

- Investigate and triage DLP alerts from Microsoft Purview across Exchange, Teams, SharePoint, OneDrive, and Endpoints
- Assess user risk by correlating DLP violations with insider risk signals and sign-in anomalies
- Identify data exfiltration patterns including email forwarding, file sharing, USB copies, and cloud uploads
- Generate executive-ready investigation reports with remediation recommendations

## Supported Microsoft Products

- [Microsoft Security Copilot](https://learn.microsoft.com/en-us/security-copilot/)
- [Microsoft Purview Data Loss Prevention](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp)
- [Microsoft Defender XDR](https://learn.microsoft.com/en-us/defender-xdr/)
- [Microsoft Entra ID Protection](https://learn.microsoft.com/en-us/entra/id-protection/overview-identity-protection)

## Prerequisites

- [Security Copilot Enabled](https://learn.microsoft.com/en-us/security-copilot/get-started-security-copilot#onboarding-to-microsoft-security-copilot)
- Microsoft Purview plugin enabled in Security Copilot
- Microsoft Defender XDR plugin enabled in Security Copilot
- Microsoft Entra plugin enabled in Security Copilot
- DLP policies configured and active in Microsoft Purview
- User must have appropriate [Security Copilot permissions](https://learn.microsoft.com/en-us/security-copilot/authentication)

## Limitations

- Prompts rely on data available in the Microsoft Purview and Defender XDR backends; results are limited to the data retention period configured in your tenant
- Cross-workload correlation depends on DLP policies being enabled across the relevant workloads (Exchange, Teams, SharePoint, Endpoints)
- The promptbook does not modify, remediate, or block any user activity — it provides investigation insights and recommendations only
- Prompt results are AI-generated summaries and should be validated by the analyst before taking action
- Performance may vary with large data volumes; consider adjusting the LookbackDays parameter for environments with high alert volumes

Disclaimer: Please know these are sample prompts and are subject to Change

---

**Required plugins** : Microsoft Purview, Microsoft Defender XDR, Microsoft Entra

**Required Input**:`<UserUPN>` — The User Principal Name of the user under investigation

**Required Input**:`<AlertId>` — The Purview DLP alert ID to investigate

**Required Input**:`<LookbackDays>` — Number of days to look back for historical activity (e.g., 7, 14, 30)

**Description**: Security Operations teams face significant challenges when investigating DLP incidents:

- Alert Volume: Organizations with mature DLP policies can generate hundreds of alerts daily across Exchange, Teams, SharePoint, and Endpoints.
- Cross-Workload Complexity: A single user's data exfiltration attempt may span email forwarding, Teams file sharing, SharePoint downloads, and USB transfers simultaneously.
- Context Gaps: Analysts must manually correlate DLP alerts with user risk signals from Insider Risk Management, sign-in anomalies, and device compliance.
- Remediation Uncertainty: Determining whether to block, warn, educate, or escalate requires a holistic view that is difficult to assemble manually.

Using Microsoft Security Copilot with this promptbook, analysts can automate the end-to-end DLP investigation workflow, reduce mean time to respond (MTTR), and ensure consistent, thorough investigations.

1. Step 1: Retrieve and Prioritize DLP Alerts
 ```
 Which Purview Data Loss Prevention alerts should I prioritize today? Show me the top 10 DLP alerts sorted by severity, including the policy name, workload, sensitive information type, and the user involved. Focus on alerts from the last <LookbackDays> days.
 ```
2. Step 2: Deep Dive into the Specific Alert
 ```
 Can you summarize Purview alert <AlertId>? Include the policy that was triggered, the sensitive information types detected, the action taken (block, warn, override), the workload where it occurred, and the specific files or messages involved.
 ```
3. Step 3: Assess User Risk Profile
 ```
 Can you summarize the risk associated with user <UserUPN> involved in this alert? Include their Purview insider risk level, recent DLP alert history in the last <LookbackDays> days, any unusual or sequential activities, and their current sign-in risk state from Microsoft Entra.
 ```
4. Step 4: Investigate File and Data Activity
 ```
 For the files related to this DLP alert, show me all activities performed in the last <LookbackDays> days. Include file access, modifications, sharing events, sensitivity label changes, downloads, and any external sharing or forwarding. Highlight any activities by compromised or risky users.
 ```
5. Step 5: Cross-Workload DLP Correlation
 ```
 Retrieve all DLP alerts for user <UserUPN> across all workloads (Exchange, Teams, SharePoint, OneDrive, Endpoints) in the last <LookbackDays> days. Correlate these alerts to identify if this user has a pattern of triggering DLP policies across multiple platforms. Summarize the workload distribution and highlight any escalation patterns.
 ```
6. Step 6: Check Sensitivity Label Status and Compliance
 ```
 What is the status of sensitivity labels on the files involved in this alert? Are any files unlabeled that should be labeled? Have any labels been downgraded or removed recently? Show the labeling compliance posture for the documents and emails involved.
 ```
7. Step 7: Analyze Data Exfiltration Indicators
 ```
 What type of exfiltration activities did user <UserUPN> engage in during the last <LookbackDays> days? Include email forwarding to external recipients, file uploads to external sites, USB file copies, cloud app uploads, Teams external sharing, and any print operations involving sensitive content.
 ```
8. Step 8: Generate Investigation Summary and Remediation Recommendations
 ```
 /AskGPT Based on the complete DLP investigation performed in this session for user <UserUPN> and alert <AlertId>, generate a comprehensive investigation summary report. Include: (1) Alert details and severity assessment, (2) User risk profile summary, (3) Data exposure scope across workloads, (4) Exfiltration indicators found, (5) Sensitivity labeling gaps identified, (6) Recommended remediation actions (block, restrict, educate, escalate to HR/Legal), and (7) DLP policy tuning suggestions to reduce false positives. Format this as an executive-ready incident report.
 ```

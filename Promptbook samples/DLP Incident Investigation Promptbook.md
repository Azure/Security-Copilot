![Security CoPilot Logo](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)

# DLP Incident Investigation and Response Promptbook

In today's data-driven enterprise environment, Data Loss Prevention (DLP) incidents represent one of the most critical threats to organizational security. When a DLP alert fires, security analysts must rapidly determine the scope of sensitive data exposure, assess the risk posture of the involved user, correlate activity across multiple workloads (Exchange, Teams, SharePoint, Endpoints), and decide on appropriate remediation actions.

This promptbook provides a structured, multi-step investigation workflow that guides Security Analysts through a complete DLP incident lifecycle — from initial alert triage through user risk assessment, data exposure analysis, cross-workload correlation, and actionable remediation recommendations.

Disclaimer: Please know these are sample prompts and are subject to Change

**Required plugins** : Microsoft Purview, Microsoft Defender XDR, Microsoft Entra

**Required Input**:<UserUPN>

**Required Input**:<AlertId>

**Required Input**:<LookbackDays>

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

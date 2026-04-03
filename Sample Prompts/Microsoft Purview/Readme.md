
# Microsoft Purview
Documentation for Microsoft Purview and Copilot for Secuity can be found here : [Microsoft Purview](https://learn.microsoft.com/en-us/purview/copilot-in-purview-overview?bc=%2Fsecurity-copilot%2Fbreadcrumb%2Ftoc.json&toc=%2Fsecurity-copilot%2Ftoc.json)


- Show me the top 5 DLP alerts that I should prioritize today?
- Can you summarize purview alert `<AlertID>`? 
- Can you summarize the risk associated with user: `<UPN>` involved in this alert?
- What information does Purview have about the risk associated with this user?
- Which Purview Data Loss Prevention alerts should I prioritize today?
- Can you summarize the first purview alert?
- Tell me more about the user `<UPN>`
- What was the data or action that triggered this alert?
- What are the data risks related to this alert?
- For the files related to the alert, show me all activities done in the last 7 days?
- Can you get me the status of labeling on these files

## Data Security hunting (MIP, DLP, IRM)
- Which Purview Data Loss Prevention alerts should I prioritize today?
- Retrieve all DLP alerts for this user in the last 7-days?
- Can you summarize the first purview alert?
- List all impacted entities for this alert.
- What was the data or action that triggered this alert?
- Show me the Meta Data related to these files
- Who is the user involved in this alert
- What is the risk level of this user?
- What is the status of labels on these files?
- What is the Purview risk associated with this user?
- Show me all the activities for this user in the last 7 days.
- What type of unusual activities did the user engage in the last 7 days?
- What type of exfiltration activities did the user engage in the last 5 days?
- What type of sequential activities did the user engage in the last 10 days?
- What are the data risks related to this alert?
- For the files related to the alert, show me all activities done in last 7 days
- Can you get me the status of labeling on these files?
- What Suspicious Actions Have Been Performed On This Files?
- Tell me more about Sensitivity label X

## Cross-Workload DLP Correlation
- Correlate all DLP alerts for user `<UPN>` across Exchange, Teams, SharePoint, OneDrive, and Endpoints in the last 14 days
- Show me users who have triggered DLP alerts across 2 or more workloads in the last 14 days
- Which users have the highest cross-workload DLP risk score?

## DLP False Positive Analysis
- Analyze DLP false positive rates for policy `<PolicyName>` in the last 30 days
- Which DLP policies have the highest override rates and are likely false positives?
- Show me the override patterns for DLP policy `<PolicyName>` — is it working effectively?

## DLP Policy Health and Coverage
- Run a DLP policy health check — show me match rates, override rates, and effectiveness for all policies
- Identify DLP policy coverage gaps across all workloads — which workloads have no DLP protection?
- Show me DLP alert trends over the last 30 days — are there any spikes or anomalies?

## Sensitivity Label Compliance
- Show me sensitivity label downgrade and removal events for user `<UPN>` in the last 14 days
- Which users have removed sensitivity labels from documents recently?
- Are there any unauthorized label downgrade events that need investigation?

Disclaimer: Please know these are sample prompts and are subject to Change

# Enrichment Plugin Suite
**Author: Craig Freyman**

## EmailEnrichment Plugin
This suite of email enrichment skill is designed to enhance security investigations by providing detailed insights into email activity. These tools allow analysts to identify email interactions based on domains, recipients, or senders and investigate related activity for comprehensive threat analysis.

### DomainEmailSearch
Search for emails in the `EmailEvents` table containing a specified domain name. Provides key details, including the time, sender, recipient, subject, body, and attachment count, to support threat analysis and investigations.

Example Prompt: Identify emails containing the domain "example.com" in the past 7 days.

### RecipientEmailSearch
Search for emails in the `EmailEvents` table sent to a specific recipient. Provides key details, including the time, sender, recipient, subject, body, and attachment count, to support threat investigations.

Example Prompt: Find all emails sent to user@example.com in the past 7 days.

### SenderEmailSearch
Search for emails in the `EmailEvents` table sent from a specific sender. Provides key details, including the time, sender, recipient, subject, body, and attachment count, to assist in analyzing sender activity.

Example Prompt: Retrieve all emails sent from admin@example.com in the past week.

### NetworkMessageIdEmailSearch
Search for emails in the `EmailEvents` table by a specified `NetworkMessageId`. Provides key email details, including time, sender, recipient, and subject. This skill helps security analysts pinpoint specific email messages in investigations, enabling focused threat analysis and remediation.

Example Prompt: Retrieve email details for NetworkMessageId "1d6ce5463-10b7-4c1e-e0a9-08dd529394bc".

### QuarantineRequestInsights
Analyze email quarantine requests and their approvals to understand user actions and email security patterns. Retrieves key details for thorough investigation.

Example Prompt: Analyze quarantine requests and approvals for email security insights.


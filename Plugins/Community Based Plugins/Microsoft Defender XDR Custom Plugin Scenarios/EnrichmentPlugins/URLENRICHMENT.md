# Enrichment Plugin Suite
**Author: Craig Freyman**

## URLEnrichment Plugin
This suite of URL enrichment skills is designed to enhance security investigations by providing detailed insights into user interactions with URLs. It allows analysts to track URL clicks, analyze click patterns, and correlate URL activity with other security events for comprehensive risk assessments.

### WhoClickedUrl
Identify users who clicked on a specific URL from an email on a given date. Provides details such as the time of the click, action type, user information, and any related network or threat data to assist in investigating potential security breaches.

Example Prompt: Identify users who clicked on https://example.com in the past 30 days.

### UrlClickCount
Analyze the frequency and recency of clicks for a specific URL over the past 30 days. Provides the total number of clicks, along with the timestamps of the first and last clicks, to support threat assessment and investigation.

Example Prompt: Analyze click frequency for https://example.com over the past 30 days.

### UrlCorrelation
Correlate clicks on a specific URL with security alerts, email events, and network events over the past 30 days. Provides a comprehensive risk overview, including event times, users, related alerts, and associated incident IDs.

Example Prompt: Correlate URL activity for https://example.com with related security events in the last 30 days.

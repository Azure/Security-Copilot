# Enrichment Plugin Suite
**Author: Craig Freyman**

## AlertEnrichment Plugin
This suite of alert enrichment skills is designed to enhance security investigations by providing detailed insights into alert data. These tools allow analysts to identify and analyze alerts based on titles and retrieve evidence associated with specific alerts for effective threat investigation.

### AlertTitleSearch
Search for alerts in the Defender database that contain a specified keyword in their title. Returns key alert details, including time generated, alert ID, title, category, and severity, to assist in quickly identifying relevant alerts.

Example Prompt: Search for alerts containing "DLP policy" in their titles over the past 7 days.

### AlertEvidenceSearch
Retrieve detailed evidence associated with a specific alert using its `AlertId`. Provides insights into entity type, associated URLs, account information, email metadata, file details, and other contextual information to assist in investigations.

Example Prompt: Retrieve evidence for alert ID "dl3e6607b8-8ff6-7180-d400-08dcf2ab98ff".

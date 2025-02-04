# Enrichment Plugin Suite
**Author: Craig Freyman**

## UserEnrichment Plugin
This suite of enrichment skills is designed to enhance security investigations by providing detailed insights into user activities, such as login behavior, password changes, MFA modifications, and location analysis. By leveraging these tools, security teams can identify potential threats, monitor user risks, and respond to suspicious behavior effectively.

### UnusualSigninActivity
Identify unusual sign-in patterns for a specific user based on anomalies such as high-risk locations, login failures, and sudden changes in device, application, or IP address usage. Highlights deviations from normal behavior and provides recommendations for security actions.

Example Prompt: Identify unusual sign-in patterns for mscott@paper.com

### PasswordChangeCount
Analyze the number of password changes for a specific user over the past 7 days. Identify potential security threats, such as account compromise or phishing attacks, by detecting anomalies in password change patterns.

Example Prompt: Detect recent password changes for mscott@paper.com over the past 7 days.

### RecentMFAChanges
Track recent MFA changes for a user, identifying added, removed, or modified authentication methods. Provides detailed insights into changes and highlights anomalies.

Example Prompt: Track MFA changes for mscott@paper.com in the last 7 days.

### UserHomeOfficeLocation
Retrieve and compare a user's home office location (city, country, state) with recent sign-in locations to detect unusual activity. Highlights deviations that may indicate unauthorized access.

Example Prompt: Compare home office location with sign-in patterns for mscott@paper.com.

### UserSigninBaseline
Establish a baseline of a user's typical sign-in activity over the past 30 days, including their most frequently used IP address, location, device, application, and client application. Detect deviations to identify potential security risks.

Example Prompt: Establish sign-in baseline for mscott@paper.com over the last 30 days.

### FailedUserSignInSpecificDay
Identify failed sign-in attempts for a specific user over a defined lookback period. Provides insights into failed attempts, including timestamps, IP addresses, and failure reasons.

Example Prompt: Identify failed sign-in attempts for mscott@paper.com in the last 7 days.

### UserRiskDetections
Analyze and prioritize medium and high-risk detections for a specific user over the past 7 days. Provides insights into risk events, such as risk types, details, and locations.

Example Prompt: Analyze medium and high-risk events for mscott@paper.com in the last 7 days.

### HighRiskUserDetection
Identify high-risk users with recent activity by correlating risk events and user status. Focus on unresolved risks and prioritize remediation steps.

Example Prompt: Identify high-risk user activity for mscott@paper.com in the past week.

### ImpossibleTravel
Detect impossible travel by analyzing login patterns and identifying logins from geographically distant locations within an unrealistically short time frame.

Example Prompt: Detect impossible travel events for mscott@paper.com in the past 7 days.

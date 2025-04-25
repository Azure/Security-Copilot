# Enrichment Plugin Suite
**Author: Craig Freyman**

## User Enrichment Plugin
This suite of enrichment skills is designed to enhance security investigations by providing detailed insights into user activities, such as login behavior, password changes, MFA modifications, location analysis, mailbox activities, and IP-based sign-in tracking. By leveraging these tools, security teams can identify potential threats, monitor user risks, and respond to suspicious behavior effectively.

---

### UnusualSigninActivity
Identify unusual sign-in patterns for a specific user based on anomalies such as high-risk locations, login failures, and sudden changes in device, application, or IP address usage. Highlights deviations from normal behavior and provides recommendations for security actions.

**Example Prompt**: Identify unusual sign-in patterns for mscott@paper.com.

---

### PasswordChangeCount
Analyze the number of password changes for a specific user over the past 7 days. Identify potential security threats, such as account compromise or phishing attacks, by detecting anomalies in password change patterns.

**Example Prompt**: Detect recent password changes for mscott@paper.com over the past 7 days.

---

### RecentMFAChanges
Track recent MFA changes for a user, identifying added, removed, or modified authentication methods. Provides detailed insights into changes and highlights anomalies.

**Example Prompt**: Track MFA changes for mscott@paper.com in the last 7 days.

---

### UserHomeOfficeLocation
Retrieve and compare a user's home office location (city, country, state) with recent sign-in locations to detect unusual activity. Highlights deviations that may indicate unauthorized access.

**Example Prompt**: Compare home office location with sign-in patterns for mscott@paper.com.

---

### UserSigninBaseline
Establish a baseline of a user's typical sign-in activity over the past 30 days, including their most frequently used IP address, location, device, application, and client application. Detect deviations to identify potential security risks.

**Example Prompt**: Establish sign-in baseline for mscott@paper.com over the last 30 days.

---

### FailedUserSignInSpecificDay
Identify failed sign-in attempts for a specific user over a defined lookback period. Provides insights into failed attempts, including timestamps, IP addresses, locations, and failure reasons.

**Example Prompt**: Identify failed sign-in attempts for mscott@paper.com in the last 7 days.

---

### EnhancedUserRiskAssessment
Combine user risk events, recent sign-ins, high-risk user indicators, and security alerts to deliver detailed context around risky user activities for a specific user. Supports threat detection, incident prioritization, and remediation planning.

**Example Prompt**: Fetch enhanced user risk details for mscott@paper.com.

---

### ImpossibleTravel
Detect impossible travel by analyzing login patterns and identifying logins from geographically distant locations within an unrealistically short time frame. Supports detection of potential credential misuse.

**Example Prompt**: Detect impossible travel events for mscott@paper.com in the past 7 days.

---

### SuspiciousMailboxActivities
Investigate recent mailbox activities to detect potential security threats, such as:
- Newly created or modified inbox rules that redirect or filter emails suspiciously.
- Mailbox permission changes that might indicate unauthorized access.
Focus on identifying anomalies that could lead to exfiltration or business email compromise (BEC) attempts.

**Example Prompt**: Investigate suspicious mailbox activities for mscott@test.com in the last 30 days.

---

### DailyEntraIDRiskDetectionReview
Summarize and prioritize Entra ID risk detections from the past day, highlighting interesting or critical alerts that may require SOC analyst review.

**Example Prompt**: Summarize Entra ID risk detections from the past 24 hours.

---

### SuccessfulLoginsFromIP
Find all successful user sign-ins originating from a specified IP address. Returns detailed event information including timestamp, user, location, device, and application.

**Example Prompt**: List all successful logins from 1.2.3.4.

---

### SuccessfulLoginCountFromIP
Return the total number of successful sign-in attempts from a given IP address. Useful for quickly determining if a specific IP has ever been successfully used.

**Example Prompt**: Count successful logins from 1.2.3.4.

---

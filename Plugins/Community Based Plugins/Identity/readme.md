# Custom Identity Security Analyst plugin for Security Copilot

The custom Identity Security skills to query Identity events for detection and forensics hunting across User Risk Assessment, Sign-in Monitoring, Admin Activity Monitoring, Application Usage Monitoring, Privileged Identity Management, Access Review:

## Key Features

### User Risk Assessment
Fetches the user risk levels based on their activities. This could include sign-in attempts from unfamiliar locations, repeated failed sign-in attempts, or other suspicious behavior.

### Users Sign-in activities
Fetches all user sign-in activities. This includes successful sign-ins, failed attempts, and the location and device used for sign-in. Any unusual sign-in activity could be a sign of a potential security threat.

### Admin activities monitoring
Fetches Admin Activity Monitoring logs. Admin accounts have high-level access and can be a prime target for attackers. Monitor all admin activities, especially those involving changes to security settings, user privileges, or access controls.

### Applications usage monitoring
Fetches Application Usage Monitoring logs to keep an eye on the usage of applications within your organization. Unusual application activity, such as a high number of downloads or an increase in usage outside of normal business hours, could indicate a potential security issue.

### Privileged Identity Management (PIM) monitoring
Fetches Privileged Identity Management logs to monitor the lifecycle of privileged identities within your organization. This includes the creation, modification, and deletion of privileged accounts.

### Access Review monitoring
Fetches Access Review logs to regularly review user access to various resources within your organization. This can help ensure that users only have access to the resources they need for their job functions, reducing the risk of insider threats.

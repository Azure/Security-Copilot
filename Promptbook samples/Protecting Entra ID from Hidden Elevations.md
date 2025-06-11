![Security CoPilot Logo](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)
# Protecting Entra ID from Hidden Elevations

**Required plugins** : Microsoft Entra, Natural Language to KQL to Microsoft Defender XDR, Microsoft Defender XDR


**Description**: Help identity admins to detect privilege escalation attempts and create remediation with Just-In-Time (JIT) within Microsoft Entra ID.

1. Generate a report using the Entra plugin to List all service principals and app registrations with privileged roles assigned in the last 15 days.
 ```
List all service principals and app registrations with privileged roles assigned in the last 15 days.
 ```
2. Identify any users with indirect admin rights via nested group memberships or directory role inheritance.
 ```
Highlight any users with indirect admin rights via nested group memberships or directory role inheritance.
 ```
3. Enquire if any risky permissions have been granted via custom role definitions in Entra ID
 ```
What risky permissions have been granted via custom role definitions in Entra ID?
 ```
4. Compare current privileged role assignments to last month’s baseline and show any unauthorized changes.
```
Compare current privileged role assignments to last month’s baseline and show any unauthorized changes.
```
5. Suggest Just-In-Time (JIT) access policies for identified shadow admins.
```
Suggest Just-In-Time (JIT) access policies for identified shadow admins.
```

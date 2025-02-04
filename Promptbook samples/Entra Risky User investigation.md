![Security CoPilot Logo](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)
# Entra Risky User investigation

**Required plugins** : Microsoft Entra, Natural Language to KQL to Microsoft Defender XDR, Microsoft Defender XDR and Microsoft Defender Threat intelligence

**Required Input**:User UPN: <userupn> and Username: <Username>


**Description**: Entra Risky User investigation

1. Generate a report using the Entra plugin to determine if the user identified by <userupn> is considered risky. If the user is deemed risky, provide a detailed list of the reasons for this assessment.
 ```
Generate a report based on Entra plugin, Is the user <userupn> considered risky? If yes, list the reasons.
 ```
2. Determine and list the authentication methods that are currently enabled for the user identified by <userupn>.
 ```
What authentication methods are enabled for the user <userupn>?
 ```
3. Retrieve and list all login attempts made by the user identified by <userupn> within the past 30 days. Include the corresponding IP addresses used for each login attempt.
 ```
Retrieve and list all login attempts made by the user within the past 30 days, along with the corresponding IP addresses used for each login attempt.
 ```
4. Provide the reputation of any IP addresses or hostnames identified in the login attempts of the user <userupn> using MDTI
```
Provide the reputation of any IPs or hostnames found
```
5. If any IP address is found in the login attempts of the user <userupn>, validate its association with any known threat actors using Microsoft Defender Threat intelligence.
```
If any IP address is found, validate its association with any known Threat actor?
```
6. List all the groups that the user identified by <username> is a member of.
```
List the groups user <username> is part of
```
7. Recommend remediation steps to mitigate the risk associated with the user identified by <userupn>.
```
Recommend remediation steps to mitigate the user risk
```
8. Generate an executive report summarizing insights on a potentially risky user.
```
Generate an executive report summarizing insights on a potentially risky user. Commence with metadata details for the user, encompassing their User Principal Name (UPN), suspected country of origin, configured authentication method, and any recorded failed login attempts. Follow this with a bullet-point list outlining key areas requiring remediation to address the identified risks. Subsequently, craft a coherent paragraph elucidating mitigation strategies aimed at ameliorating the highlighted concerns
```

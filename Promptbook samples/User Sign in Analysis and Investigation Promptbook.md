![Security CoPilot Logo](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)
# User Sign in Analysis

**Required plugins** : Microsoft Entra, Microsoft Intune

**Required Inputs**: UPN 

**Description**: Investigate the User sign ins , access the Risk profile of the user , identify the device compliance and conclude with the summary of the analysis

1. Retreive the history of the User you are investigating 
 ```
What is <UPN> sign-in history?
 ```
2. retrieve infromation on any failed sign ins
 ```
Are there any failed sign-in attempts? If so, what are the details?
 ```
3. retrieve infromation on applications accessed during the sign in vevents
 ```
What applications has the user accessed during these sign-in events?
 ```
4. Check device compliance of device used by the user
```
What device(s) has the user used for these sign-ins? Are these devices compliant and managed?
```
5. Retrieve location of the users sign ins 
```
What is the sign-in location and IP address used for sign-in?
```
6. Access the risk level of the user
```
What is the risk level during sign-in? Are there any detected risk events?
```
7. Access Sign in status of the user
```
What is the user's sign-in status? Are there any failures? If so, what are the reasons for these failures?
```
8. Checking if the user has MFA in play
```
Does the user's sign-in satisfy the Multi-Factor Authentication (MFA) requirement?
```
9. Accessing conditional access policies aligned to the user
```
What specific conditional access policies were applied during these sign-in events
```
10. Checking the last passwprd change for the user
```
When did the user last change their password?
```
11. Summarizing the investigation
```
Can you summarize the above investigation and provide a conclusion and recommendation

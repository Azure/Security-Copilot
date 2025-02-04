![Security CoPilot Logo](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)
# High Blast Radius User investigation

**Required plugins** : Investigate anomalous activities by high blast radius user (custom KQL), AbuseIPDB, Microsoft Intune, Cybersixgill Threat Intelligence and Rare Processes Launched as a Service (custom KQL)

**Required Input** None 


**Description**: This promptbook investigates or hunts for evidence of possible identity compromise of high blast radius users


1. Leveraging UEBA retrieve a list of users who have a high blast radius and have recently performed anomalous activities
 ```
show me users who have a high blast radius and have recently performed anomalous activities
 ```
2. Identify the user with the highest priority for further investigation and provide an explanation for that conclusion.
 ```
 Using Hunt for anomalous activities by high blast radius accounts plugin, which specific user from the above prompt should I focus on and why?

 ```
3. Obtain IP reputation data for the public IP address used to perfom the anomalous activities
 ```
Using AbuseIPDB, tell me about the IP address used by the user
 ```
4. Identify any managed devices assigned to the user so as to further investigate suspicious activities  that may have been performed on that device
```
what device is assigned to this user
```
5. Tap into Cybersixgill Threat intelligence to uncover whether the user id has been compromised and is on sale in the dark or deep web.
```
According to Cybersixgill, tell whether this user's credentials have been compromised.
```
6. Establish the policy compliance state of the device used by the user.
```
tell me about the compliance state of the managed device.
```
7. Check for any suspicious processes that may have been executed on the machine in the recent past  
```
have there been any rare processes executed on this device over the past 7 days ?
```
8. Obtain a final summary of the investigation, pulling together insights gleaned from all the previous prompts and various security solutions
```
/AskGPT Summarize this investigation. Include a verdict whether threat hunting is required and why. If yes suggest specific, follow up actions.
```


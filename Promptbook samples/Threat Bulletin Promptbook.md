![Security CoPilot Logo](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)
#  Threat Bulletins Promptbook

**Description**: Summarize the recent threat articles in a report format with actionable recommendations over a certain period

**Required Plugin**: Defender Threat intelligence 

**Required Input**:< Lookfarback >

1. Request for Latest threat article information
 ```
Share the latest Threat articles published in the last <Lookfarback> in a table format
 ```
2. Check if there are any CVEs mentioned in the article and their associated technologies
 ```
If there is any CVEs sighted in these articles , please provide a summary of these CVEs and cite the technologies impacted
```
3. Summarize the articles in a report format , with action items etc
 ```
Summarize the following articles and consolidate them in a Threat Bulletin format Named Threat bulletin with the current date . In the bulletin ensure to capture all details including the title summary , link , Created date , also highlight the action items the Team should prioritize in relation to these article
 ```

# Prompts in the Incident Analysis promptbook

This promptbook, containing a (sample) series of prompts for reporting the high-level status of the Security Incident Management process for the current organization, has been designed to be invoked from the [CfS-SendPromptbookResultsByEmail](https://github.com/Azure/Security-Copilot/tree/main/Logic%20Apps/CfS-SendPromptbookResultsByEmail) Logic App and requires the [CISO Incidents Summary](https://github.com/Azure/Security-Copilot/blob/main/Logic%20Apps/ciso-reporting/ciso-incidents-summary-man.yaml) Custom Plugin as a prerequisite.

## Prompt 1
```
/CisoIncidentsStatusSummary Consider the top <TOP_INCIDENTS_NUMBER> most occurring incidents in the period of <TIME_FRAME>. For the input parameter named "csv_of_severities" specify the following word or words, each surrounded by double quotes, with only the first letter in uppercase and, if more than one, separated by commas: <SEVERITIES> .
Respond by applying ALL these 4 indications to this specific response only:
1. Start the response with the following first sentence: "This is the list of Incidents with severity <SEVERITIES> created in the requested period ". Then add, within round brackets, exactly the first day and the last day considered for <TIME_FRAME>, as used for invoking the CisoIncidentsStatusSummary skill; use the long date format.
2. Do not return a table: return the results in paragraphs instead; highlight the incident title and write as bulleted list the numbers by status. Do not write classifications where the number is zero. Write in bold underlined the incident classified as true positive.
3. Format the ENTIRE response in HTML including the very first sentence; do not include the doctype tag and the header: write only the content of the HTML body, without the opening and closing "body" tag and DO NOT write any character before and after that HTML content. 
4. Translate this ENTIRE response in <RESPONSE_LANGUAGE> from its very first to its very last word, but the titles of the incidents.
```

## Prompt 2
```
/CisoTruePositiveIncidentsTTAnalysis Consider only the incidents occurred <TIME_FRAME>. For the input parameter named "csv_of_severities" specify the following word or words, each surrounded by double quotes, with only the first letter in uppercase and, if more than one, separated by commas: <SEVERITIES> .
Respond by applying BOTH these 2 indications to this specific response only:
1. Start the response with the following first sentence: "These are the MITRE Tactics and Techniques for the Incidents closed as 'True Positives' in the requested period ". Then add, within round brackets, exactly the first day and the last day considered for <TIME_FRAME>, as used for invoking the CisoTruePositiveIncidentsTTAnalysis skill; use the long date format. 
2. Do not return a table: return the results in paragraphs instead; highlight the incident title and write in a bullet the the number of occurrences, in a second bullet the list of tactics and in a third bullet the list of techniques.
```

## Prompt 3
```
/askGPT Respond by applying ALL these 3 indications to this specific response only: 
1. Create a copy of the list returned by the previous prompt and, in that copy, replace the value of each listed Tactic with its link to the MITRE Att&ck Framework web site describing that specific tactic. Also replace the value of each listed Techniques with its link to the MITRE Att&ck Framework web site describing that specific technique; concatenate the technique code with its title. Ensure that the links are correct. 
2. Format the ENTIRE response in HTML including the very first sentence; do not include the doctype tag and the header: write only the content of the HTML body, without the opening and closing "body" tag and DO NOT write any character before and after that HTML content. 
3. Translate this ENTIRE response in <RESPONSE_LANGUAGE> from its very first to its very last word. Keep in English only the titles of the incidents and the names of the Tactics and Techniques.
```

## Prompt 4
```
/CisoMTTR Set the start_date and end_date input parameters to the first and last day of <TIME_FRAME>. In the response, include all the content returned by the KQL call.
```

## Prompt 5
```
/askGPT Respond by applying ALL these 6 indications to this specific response only: 
1. Start the response with the following sentence: "This is the MTTR, Mean Time To Resolve, for the incidents closed <TIME_FRAME>.". 
2. After that sentence, write a table with two columns, Metric and Value, and three rows containing the first three numbers of the previous response. Write the first two numbers in minutes (with no decimal places) and in hours (in round brackets, with only 1 decimal place); write explicitly that these are minutes and hours. 
3. After that first table, write the sentence "The MTTR is defined as the average time between the creation and closure of incidents, for the incidents closed within the specified time window, as shown in the following table:". 
4. After that sentence, write explicitly, in a second table, what are the first and last days considered for both the two calculated MTTR values, as returned by the previous response. The second table should contain these three columns: Period, Start Date, End Date. 
5. Format the dates as weekday, day, month, year. Format this ENTIRE response in HTML, from the very first to the very last word; for any table, use a border 1px with color light gray, spacing 1px and width 100%; do not include the doctype tag and the header: write only the content of the HTML body, without the opening and closing "body" tag and DO NOT write any character before and after that HTML content. 
6. Translate this ENTIRE response in <RESPONSE_LANGUAGE> from its very first to its very last word. Keep in English only the acronym MTTR and the name "Mean Time To Resolve" but add its translation after that name in round brackets.
```

## Prompt 6
```
/CisoMTTA Set the start_date and end_date input parameters to the first and last day of <TIME_FRAME>. In the response, include all the content returned by the KQL call. 
```

## Prompt 7
```
/askGPT Respond by applying ALL these 6 indications to this specific response only: 
1. Start the response with the following sentence: "This is the MTTA, Mean Time To Acknowledge, for the incidents created <TIME_FRAME>.". 
2. After that sentence, write a table with two columns, Metric and Value, and three rows containing the first three numbers of the previous response. Write the first two numbers in minutes (with no decimal places) and in hours (in round brackets, with only 1 decimal place); write explicitly that these are minutes and hours. 
3. After that first table, write the sentence "The MTTA is defined as the average time between the creation and first modification of incidents, for the incidents created within the specified time window, as shown in the following table:". 
4. After that sentence, write explicitly, in a second table, what are the first and last days considered for both the two calculated MTTA values, as returned by the previous response. The second table should contain these three columns: Period, Start Date, End Date. 
5. Format the dates as weekday, day, month, year. Format this ENTIRE response in HTML, from the very first to the very last word; for any table, use a border 1px with color light gray, spacing 1px and width 100%; do not include the doctype tag and the header: write only the content of the HTML body, without the opening and closing "body" tag and DO NOT write any character before and after that HTML content. 
6. Translate this ENTIRE response in <RESPONSE_LANGUAGE> from its very first to its very last word. Keep in English only the acronym MTTA and the name "Mean Time To Acknowledge" but add its translation after that name in round brackets.
```

## Prompt 8
```
/CisoIncidentsOwners Set the start_date and end_date input parameters to the first and last day of <TIME_FRAME>. Set the top_owners_number input parameter to <TOP_OWNERS_NUMBER>. 
Respond by applying ALL these 4 indications to this specific response only: 
1. Start the response with the following sentence: "This is the list of owners of incidents with the biggest number of assigned incidents considering only the incidents created <TIME_FRAME>:". 
2. Return the list in bullets of "user principal names" with the number of assigned incidents after the name, in round brackets. 
3. Format the ENTIRE response in HTML including the very first sentence; do not include the doctype tag and the header: write only the content of the HTML body, without the opening and closing "body" tag and DO NOT write any character before and after that HTML content. 
4. Translate this ENTIRE response in <RESPONSE_LANGUAGE> from its very first to its very last word. 
```

## Prompt 9
```
/CisoMostImpactedUsers Set the start_date and end_date input parameters to the first and last day of <TIME_FRAME>. Set the top_impacted_users_number input parameter to <TOP_IMPACTED_USERS_NUMBER> impacted users. 
Respond by returning the list of "user principal names" of the identified impacted users, with the related number of associated alerts
```

## Prompt 10
```
/askGPT extract in a single string the comma separated list of User Principal Names included in the previous response. 
```

## Prompt 11
```
Call the CisoGetUsersStatus skill of the CisoIncidentsSummaryApiHelper plugin. Pass these values to the input parameters: api-version=2016-10-01 , sp=/triggers/AnalyzeUPNsCall/run , sv=1.0. Pass to the users_upn input parameter the comma separated list of UPNs that you returned in the previous response. Read in the body of the response of this call and return the values of EntraStatus and RiskStatus for these users.
```

## Prompt 12
```
/askGPT Consolidate in a single table the number of incidents, the EntraStatus and the RiskStatus for ALL the impacted users identified in the previous responses. Respond by applying ALL these 4 indications to this specific response only: 1. Start the response with the following sentence: "This is the list of the users most impacted by incidents created <TIME_FRAME> and not already closed as 'false positive'. The list includes the number of their incidents and their status and risk level in Entra.". 2. Return the list as table. 3. Format the ENTIRE response in HTML including the very first sentence; for the HTML table, use a border 1px with color light gray, spacing 1px and width 100%; do not include the doctype tag and the header: write only the content of the HTML body, without the opening and closing "body" tag and DO NOT write any character before and after that HTML content. 
4. Translate this ENTIRE response in <RESPONSE_LANGUAGE> from its very first to its very last word.
```

---

# Parameters for the Logic App that invoke the Incident Analysis promptbook and sends the results by email
(Logic App template: https://github.com/Azure/Security-Copilot/tree/main/Logic%20Apps/CfS-SendPromptbookResultsByEmail)


## Paramters related to the responses of the promptbook


### Value for the Logic App Paramter 'SkipPromptsInOutput' 
Indexes of the prompts whose responses should not be included in the delivered email. 
```
[2,4,6,9,10,11]
```

### Value for the Logic App Paramter 'ReplacePromptsInOutput' 
Text to be used for replacing the prompts in the delivered email. 
NOTE: It may include words and numbers that should be consistent with the values specified for the input parameters of the promptbook.  
```
["List the names of incidents opened last week with high or medium severity. Consider only the 10 most frequent incidents. Report the number of occurrences and their status.","","For incidents closed last week as 'true positives', report the related tactics and techniques defined in the MITRE ATT&CK Framework.","","Report the Mean Time To Resolution (MTTR) of incidents closed last week. Compare it with the value recorded last month.","","Report the Mean Time To Acknowledgment (MTTA) of incidents created last week. Compare it with the value recorded last month.","List the 10 operators with the most incidents assigned among the incidents created last week.","","","","List the 5 users impacted by the highest number of alerts related to incidents created last week and not closed as false positives. Report their status in Entra."]
```


## Paramters related to the HTML formatting of the delivered email


### Value for the Logic App Paramter 'HtmlBodyHeader' 
(Shades of **blue** - Same as in the Logic App template)
```
<!DOCTYPE html><html><style>.notification-table-header {padding: 10px;width: auto;border-top: none;background: #0078D4;font-size: 11.0pt;color: white;font-weight: bold;margin-left: 10px;text-align: left;border: none;border-bottom: solid white 1.5pt;} .notification-table-text {padding: 10px;margin-left: 5px;width: 70%;text-align: left;border: none;border-bottom: solid white 1.5pt;background: #FAFAFA;font-size: 12.0pt;height: 20.05pt;} .notification-card-footer span {font-size: 12.0pt;color: #000000;} .notification-card-footer p {vertical-align: baseline;} .notification-body {margin: 0 auto;text-align: center;width: 650px;border: 1px black;border-collapse: collapse;background-color: #CCE4F6;} </style> <body style="background-color: #dfdfdf;"><table style="width:100%;"><tr><td style="padding:0;"><div align="center"><table class="notification-body"><tr style="border: 1px grey; border-top:none;"><td><p style='font-size:5.0pt;'><span>&nbsp;</span></p><table style='width:590px;margin:0 auto;border-collapse:collapse;'><tr class="notification-card-footer"><td><p style='text-align:left; font-size:12.0pt;'><b>***EMAILTITLE***</b></p></td></tr>
```

### Value for the Logic App Paramter 'HtmlBodyRow' 
(same as in the Logic App template)
```
<tr><td class="notification-table-header"><span>***CONTENT1***</span></td></tr><tr><td class="notification-table-text"><span>***CONTENT2***</span></td></tr><tr class="notification-card-footer"><td><p style='text-indent:36.0pt;'><span style='font-size:10.0pt;'>&nbsp;</span></p></td></tr>
```


Value for the Logic App Paramter 'HtmlBodyRow' 
(same as in the Logic App template)
```
<tr class="notification-card-footer"><td><p style='text-align:center;'><span style='font-size:12.0pt; color:yellow;'>The content of this email was generated by Artificial Intelligence and may not be accurate. Please verify its accuracy..</span><br/><span style='font-size:12.0pt;'>To access Security Copilot, click <a href="https://security.microsoft.com/">HERE</a>.</span><br></p></td></tr></table></td></tr></table></div></td></tr></table></body></html>
```

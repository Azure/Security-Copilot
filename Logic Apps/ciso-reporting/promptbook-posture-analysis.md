# Prompts in the Incident Analysis promptbook

This promptbook, containing a (sample) series of prompts for reporting the high-level status of the security Posture for the current organization, has been designed to be invoked from the [CfS-SendPromptbookResultsByEmail](https://github.com/Azure/Security-Copilot/tree/main/Logic%20Apps/CfS-SendPromptbookResultsByEmail) Logic App and requires the [CISO Posture Summary](https://github.com/Azure/Security-Copilot/blob/main/Logic%20Apps/ciso-reporting/ciso-posture-summary-man.yaml) Custom Plugin as a prerequisite.

NOTE: This promptbook is in a very preliminary draft state. Not only are these prompts not optimized in terms of compute capacity consumption, but it is also very incomplete. Please refer to [this article](https://www.linkedin.com/pulse/periodic-reporting-security-managers-cisos-using-stefano-pescosolido-fm80f/) for further details on how this promptbook should be improved.

## Prompt 1
```
Which threats should I focus on based on their exposure scores? For each returned threat, include a brief summary (no more that <WORDS_NUMBER> words), the Exposure Score, the Last Updated date, the number of related Alerts, the number of Misconfigured Devices and the number of Vulnerable Devices.
```

## Prompt 2
```
/GetSentinelSOCOptimizationRecommendations Is my Sentinel environment configured appropriately with reference to threat coverage and data utilization? Summarize the results in 3 paragraphs: Threat Coverage Recommendations (for each threat, show a bulleted list of: Threat Name, Recommended Action, Number of Active Detections, Number of Recommended Detections), Data Utilization Recommendations (for each table, show a bulleted list of: Table Name, Recommendations, Number of Suggested Rules) and Detection Tuning Recommendations (for each detection, show a bulleted list of: Detection ID, Recommended Action, Recommended Entities). For Data Utilization, show only the recommendations with 1 or more Suggested Rules
```

## Prompt 3
```
/CisoRecommendationsBySeverity List the top <NUMBER_OF_RECOMMENDATIONS> active Recommendations created in the last <NUMBER_OF_DAYS> days. For the input parameter named "csv_of_severities" specify the following word or words, each surrounded by double quotes, with only the first letter in uppercase and, if more than one, separated by commas: <SEVERITIES>
```


---

# Parameters for the Logic App that invoke the Posture Analysis promptbook and sends the results by email
(Logic App template: https://github.com/Azure/Security-Copilot/tree/main/Logic%20Apps/CfS-SendPromptbookResultsByEmail)


## Paramters related to the responses of the promptbook


### Value for the Logic App Paramter 'SkipPromptsInOutput' 
Indexes of the prompts whose responses should not be included in the delivered email. 
(Leave empty)
```
[]
```

### Value for the Logic App Paramter 'ReplacePromptsInOutput' 
Text to be used for replacing the prompts in the delivered email. 
NOTE: It may include words and numbers that should be consistent with the values specified for the input parameters of the promptbook.  
```
["List the global threats that should be prioritized based on their exposure score and the vulnerabilities present in my environment.","List the recommendations for better coverage in our SIEM (Microsoft Sentinel) against the most impactful threats. Also, show the recommendations for better utilization of our collected logs.","List the top 10 high and medium severity recommendations based on the number of impacted resources in my cloud PaaS environments in Azure, AWS, and GCP."]
```


## Paramters related to the HTML formatting of the delivered email


### Value for the Logic App Paramter 'HtmlBodyHeader' 
(Shades of **green**)
```
<!DOCTYPE html><html><style>.notification-table-header {padding: 10px;width: auto;border-top: none;background: #3B7D23;font-size: 11.0pt;color: white;font-weight: bold;margin-left: 10px;text-align: left;border: none;border-bottom: solid white 1.5pt;} .notification-table-text {padding: 10px;margin-left: 5px;width: 70%;text-align: left;border: none;border-bottom: solid white 1.5pt;background: #FAFAFA;font-size: 12.0pt;height: 20.05pt;} .notification-card-footer span {font-size: 12.0pt;color: #000000;} .notification-card-footer p {vertical-align: baseline;} .notification-body {margin: 0 auto;text-align: center;width: 650px;border: 1px black;border-collapse: collapse;background-color: #B4E5A3;} </style> <body style="background-color: #dfdfdf;"><table style="width:100%;"><tr><td style="padding:0;"><div align="center"><table class="notification-body"><tr style="border: 1px grey; border-top:none;"><td><p style='font-size:5.0pt;'><span>&nbsp;</span></p><table style='width:590px;margin:0 auto;border-collapse:collapse;
```

### Value for the Logic App Paramter 'HtmlBodyRow' 
(same as in the Logic App template)
```
<tr><td class="notification-table-header"><span>***CONTENT1***</span></td></tr><tr><td class="notification-table-text"><span>***CONTENT2***</span></td></tr><tr class="notification-card-footer"><td><p style='text-indent:36.0pt;'><span style='font-size:10.0pt;'>&nbsp;</span></p></td></tr>
```


### Value for the Logic App Paramter 'HtmlBodyRow' 
(same as in the Logic App template)
```
<tr class="notification-card-footer"><td><p style='text-align:center;'><span style='font-size:12.0pt; color:yellow;'>The content of this email was generated by Artificial Intelligence and may not be accurate. Please verify its accuracy..</span><br/><span style='font-size:12.0pt;'>To access Security Copilot, click <a href="https://security.microsoft.com/">HERE</a>.</span><br></p></td></tr></table></td></tr></table></div></td></tr></table></body></html>
```

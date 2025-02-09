![Security CoPilot Logo](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)
# SoC Optimization Trend Analysis

**Required plugins** : SoC Optimization Trend Report (Custom Plugin)

**Required Input**:< month >, < year >, < severity >


**Description**: This report aims to help you gain insights into your current Microsoft Sentinel environment, while also providing recommendations for improving operational effectiveness, and offering a management overview.

1. Incident Count by High Severity by month/year
 ```
Using the Incident Count by High Severity by month/year, tell about incidents from the month of <month> and year <year>
 ```
2. Incident Count by Medium Severity by month/year
 ```
Using the Incident Count by Medium Severity by month/year, tell about incidents from the month of <month> and year <year>
 ```
3. Incident Count by Low Severity by month/year
 ```
Using the Incident Count by Low Severity by month/year, tell about incidents from the month of <month> and year <year>
 ```
4. Show all the incidents from the month of <month> and year <year>
```
Using SOC Alerts Over Time per Severity by Provider, month/year, show me all the incidents from the month of <month> and year <year>
```
5. Show all the incidents from the month of <month> and year <year> 
```
Using SOC Alerts Over Time per Severity by Tactics, month/year, show me all the incidents from the month of <month> and year <year>
```
6. Show the average time in hours from the month of <month> and year <year> 
```
Using SOC Average time to acknowledge an incident by month/year, show me average time in hours from the month of <month> and year <year>
```
7. Show the average time from the month of <month> and year <year>
```
Using SOC Average time to closure of an incident by month/year, tell me the average time from the month of <month> and year <year>
```
8. Show all the incidents by classification from the month of <month> and year <year> 
```
Using SOC Closing Classification over Time by month/year, show me all the incidents by classification from the month of <month> and year <year>
```
9. Show all the results from the month of <month> and year <year> for the highest mean time to respond
```
Using SOC Highest Mean Time to Respond by month/year, show me the results from the month of <month> and year <year>
```
10. Show all the results from the month of <month> and year <year> for mean time to respond without automation
```
Using SOC Mean Time to Respond without Automation by month/year, show me the results from the month of <month> and year <year>
```
11. Show all the results from the month of <month> and year <year> for mean time to response with tasks
```
Using SOC Mean Time to Response with Tasks by month/year, show me the results from the month of <month> and year <year>
```
12. Show all the results from the month of <month> and year <year> for the number of incidents with automation used
```
Using SOC Number of Incidents with Automation Used by month/year, show me the results from the month of <month> and year <year>
```
13. Show all the results from the month of <month> and year <year> for the number of incidents without automation
```
Using SOC Number of incidents without automation by month/year, show me the results from the month of <month> and year <year>
```
14. Show all the results from the month of <month> and year <year> for time to acknowledge per incident
```
Using SOC Time to Acknowledge per Incident by month/year, show me the results from the month of <month> and year <year>
```
15. Show all the results from the month of <month> and year <year> for total incidents owned per user
```
Using SOC Total Incidents Owned per User by month/year, show me the results from the month of <month> and year <year>
```
16. Show all the results from the month <month> and year <year> for count of closed incidents without automation
```
Using SOC count of closed incidents without automation by month/year, show me the results from the month <month> and year <year>
```
17. Show all the results from the month <month> and year <year> with <severity> severity for closed incidents without automation
```
Using SOC incidents without automation by severity and month/year show me the results from the month <month> and year <year> with <severity> severity
```
18. Suggest improvements based on the findings and determine any common trends
```
Using SOC incidents without automation by severity and month/year show me the results from the month <month> and year <year> with <severity> severity. Take the results and determine common trends ,identify reoccurring entities, get trends associated with incidents that have been closed , group them based on the understanding that you are a SOC operator. Suggest improvement points based on these findings and please be as detailed as possible
```
19. Write a final summary from all of the findings
```
/AskGPT Create an executive report called Microsoft Sentinel Optimization Trend. The report needs to explain the findings, split into headings for each finding over the period of the results. The report should contain recommendations and Trend analysis to conclude.
```

## Configure Tanium integration with Security Copilot

Establish communication between a Tanium instance and Security Copilot using:  

- a Tanium plugin manifest URL to upload the Tanium Skills custom plugin to Security Copilot 

- a Tanium instance URL to connect Security Copilot to the Tanium instance 

- a Tanium API token to grant Security Copilot permission to query your network using Tanium and gather endpoint data 

1. In a browser window, navigate to the Microsoft Security Copilot home page. 

2. Click Security Copilot plugin. The Manage plugins modal window appears. 
![image](https://github.com/shuhblam/copilot-for-security/assets/745064/ec05f712-7489-46a5-a2be-7576bca0b2f1)

3. In the Custom section, click Add plugin. The Add a plugin modal window appears. 
![image](https://github.com/shuhblam/copilot-for-security/assets/745064/5254358d-8e71-4a9d-ab11-3d39e4a88fb6)

4. Select Who can use this plugin?.  

5. Click Security Copilot plugin. 

6. Select the .json File type. 

7. In a separate browser window, navigate to Tanium Console.  

8. Select Modules > Connect > Overview. The Connect Overview page appears. 

9. Click Settings. Then click Microsoft Security Copilot.  
![image](https://github.com/shuhblam/copilot-for-security/assets/745064/4c7c8e0d-6efc-48e2-874a-b6e6e022cde2)

10. Click Tanium Plugin Manifest URL Copy to copy the plugin manifest URL to the clipboard. 

11. In Security Copilot, select Upload as a link. Then paste the Tanium Plugin Manifest URL. 

12. Click Add. The Set up Tanium Skills modal window appears. 
![image](https://github.com/shuhblam/copilot-for-security/assets/745064/82e9ad22-5031-4494-98dc-bafb4dc8971b)

13. In Tanium Console, click Tanium Instance URL Copy to copy the Tanium instance URL to the clipboard.  

14. In Security Copilot, paste the Tanium Instance URL in the Set up Tanium Skills modal window. 

15. In Tanium Console, click Generate to generate an API token, valid for 365 days, and copy the token value to the clipboard. 

> You cannot view the token value in Tanium Console. Paste the value in a plaintext editor and save the file in a secure location if you want to record it for future reference. 


16. In Security Copilot, paste the API token value in the Value field in the Set up Tanium Skills modal window.  

17. Click Set up. 


## Skills & Prompts
| Required Tanium solutions  | Tanium Skill prompt suggestion  | Description  | Example natural language prompts  |
| ------------- | ------------- | ------------- | ------------- |
| Tanium Core Platform  | Get Logged In User  | Retrieve the user that is currently logged into an endpoint | Using Tanium, return the user currently logged into the endpoint with the hostname _hostname_ so that I can investigate possible unauthorized endpoint use. Return a Tanium Console Question Results URL so that I can view more real-time information for this endpoint. Thank you. |
| Tanium Core Platform, sensor-dependent | Get Real-time Data from Endpoints  | Retrieve real-time data from endpoints based on a Tanium sensor. For more information on supported sensors | Using Tanium, return the computer name and IP address of endpoints. Display the results in a table, alphabetically sorted by computer name, and return a Tanium Console Question Results URL so that I can view the real-time list of endpoints. Thank you. |
| Asset, SBOM | Count Endpoints Having Package Version | Retrieve the total count of endpoints that have the given software package | Using Tanium, return the total number of endpoints with a software package for _software-name_, so that I can start cataloging which computers have the software installed. Display the results in a table, alphabetically sorted by host name, and return a Tanium Console Question Results URL so that I can view the real-time list of endpoints. Thank you. |
| Asset, SBOM | List Endpoints Having Package  | Retrieve up to 10 endpoints that have the given software package | Using Tanium, return the endpoints with a software package for _software-name_ so that I can start cataloguing which computers might have an out-of-date version. Display the results in a table, alphabetically sorted by host name, and return a Tanium Console Question Results URL so that I can view the real-time list of endpoints. Thank you.  |
| Asset, SBOM, Threat Response | List Process SHA-256 Hashes and Versions | Retrieve the SHA-256 file hash and version for a given process | Using Tanium, return the SHA-256 hash value and process version for the running process _process-name_, so that I can find other instances of this process based on the hash value. Thank you. |
| Comply | Get Vulnerability Test Results | Return whether an endpoint is vulnerable to a given CVE, and the reason why it is vulnerable | Using Tanium, examine whether endpoint _hostname_ is vulnerable to _cve-id_, and return the reasons that this endpoint is vulnerable, along with a suggested plan of action to remediate the intrusion. Thank you. |
| Comply | List Endpoints Vulnerable To CVE | Retrieve up to 10 endpoints vulnerable to a given CVE ID | Using Tanium, return the endpoints vulnerable to _cve-id_, so that I can remediate the vulnerability on these endpoints. Display the results in a table, sorted alphabetically by host name, and return a Tanium Console Question Results URL so that I can view the real-time list of endpoints. Thank you. |
| Direct Connect, Threat Response | View Endpoint Processes | Retrieve a URL to the Threat Response Live Connection page for the requested endpoint, which contains a list of running processes | Using Tanium, return a Threat Response Live Connection URL for the endpoint with the hostname _hostname_, so that I can review the running processes and identify potential vulnerabilities. Thank you. |
| Incident Response | List Service Module Details | Retrieve running service module information for an endpoint, including name, caption, and image path | Using Tanium, return information for the service modules running on the endpoint with the hostname _hostname_, so that I can review the list for unexpected service modules. Display the results in a table, alphabetically sorted by service module name, and return a Tanium Console Question Results URL so that I can view the real-time list of service modules. Thank you. |
| Incident Response | List Service Process Details | Retrieve running service process information for an endpoint, including name, process ID, and file path | Using Tanium, return information for the service processes running on the endpoint with the hostname _hostname_, so that I can review the list for unexpected service processes. Display the results in a table, alphabetically sorted by service process name, and return a Tanium Console Question Results URL so that I can view the real-time list of service processes. Thank you. |
| Incident Response | List WMI Event Consumers | Retrieve Windows Management Instrumentation (WMI) event consumers running on an endpoint | Using Tanium, return the WMI event consumers running on the endpoint with the hostname _hostname_ so that I can ensure only expected event consumers are running, and return a Tanium Console Question Results URL so that I can view the real-time list of event consumers. Thank you. |
| Index | List File Details | Retrieve details for a file by name, including the endpoints on which it is installed, the file path, and file size | Using Tanium, return information for the file named _file-name_ so that I can determine if it is running on unintended endpoints. Display the results in a table, alphabetically sorted, and return a Tanium Console Question Results URL so that I can view the real-time list. Thank you. OR Using Tanium, return information for the file named _file-name_ installed on the endpoint with the hostname _hostname_, so that I can determine if it is running on unintended endpoints. Display the results in a table, alphabetically sorted, and return a Tanium Console Question Results URL so that I can view real-time information. Thank you. |
| Threat Response | List Child Processes for Process File | Return all child processes running on an endpoint based on a given process file name | Using Tanium, list the child processes of _process-name_ so that I can analyze resource usage. Display the results in a table, alphabetically sorted by process name, and return a Tanium Console Question Results URL so that I can view the real-time list of endpoints. Thank you. OR Using Tanium, list the child processes of _process-name_ that are running on the computer with the hostname _hostname_, so that I can analyze resource usage. Display the results in a table, alphabetically sorted by process name, and return a Tanium Console Question Results URL so that I can view the real-time list of endpoints. Thank you. |
| Threat Response | List Endpoints with Process Command | Retrieve up to 10 endpoints running the given command line command | Using Tanium, return the endpoints running the command line command _process-command_, so that I can ensure this process is not running on unexpected endpoints. Display the results in a table, sorted alphabetically by host name, and return a Tanium Console Question Results URL so that I can view the real-time list of endpoints. Thank you. |
| Threat Response | List Endpoints with Process Name | Retrieve up to 10 endpoints running the given process | Using Tanium, return the endpoints running a process called _process-name_, so that I can ensure this process is not running on unexpected endpoints. Display the results in a table, sorted alphabetically by host name, and return a Tanium Console Question Results URL so that I can view the real-time list of endpoints. Thank you. |
| Threat Response | List Endpoints with Process MD5 Hash | Retrieve up to 10 endpoints running the given process matching the provided MD5 hash value | Using Tanium, return all endpoints that are running a process with the MD5 hash value _md5-hash-value_, so that I can ensure this process is not running under a different file name. Display the results in a table, sorted alphabetically by host name, and return a Tanium Console Question Results URL so that I can view the real-time list of endpoints. Thank you. |
| Threat Response | List File Operations | Retrieve historical file operation information from endpoints, including endpoint name, file path, and the file operation type, such as create or delete | Using Tanium, return file operation information for the endpoint named _hostname_ running on the file path "_partial-file-path_" over the past _time-frame_ so that I can determine if any malicious file behavior is occuring on the endpoint. Display the results in a table, alphabetically sorted, and return a Tanium Console Question Results URL so that I can view the real-time list. Thank you. OR Using Tanium, return file operation information for files running on the file path "_partial-file-path_" over the past _time-frame_ so that I can determine if there is any malicious file creation or deletion. Display the results in a table, alphabetically sorted, and return a Tanium Console Question Results URL so that I can view the real-time list. Thank you. |
| Threat Response | List Processes Connected To IPv4 Address | Retrieve the processes running on an endpoint with the given IPv4 address | Using Tanium, return the processes running on the endpoint with the IPv4 address _ipv4-address_, so that I can analyze any potential security intrusions and resource usage. Display the results in a table, sorted alphabetically by process name, and return a Tanium Console Question Results URL so that I can view the real-time list of endpoints. Thank you. |
| Threat Response | List Process Ran As User | Retrieve the processes running on an endpoint as a given user | Using Tanium, return the processes running as the user _user-name_, so that I can determine whether there are issues with unauthorized access. Display the results in a table, sorted alphabetically by computer name, and return a Tanium Console Question Results URL so that I can view the real-time list of endpoints. Thank you. OR Using Tanium, return the processes running as the user _user-name_ on the endpoint with the hostname _hostname_, so that I can determine whether there are issues with unauthorized access. Display the results in a table, sorted alphabetically by process name, and return a Tanium Console Question Results URL so that I can view the real-time list of endpoints. Thank you. |

### Public Docs
To see the full documentation go [here](https://help.tanium.com/bundle/ug_connect_cloud/page/connect/ms_copilot_security.html)

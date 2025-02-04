![Security CoPilot Logo](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)

# Network Analysis - URI Request

Inspired by [GreyNoise Sift](https://www.greynoise.io/blog/introducing-sift-automated-threat-hunting) and the possibilities to help in a number of areas where Layers 4-7 Web traffic is captured in SIEM and may need further analysis. Whether analyzing a URI, web traffic received, or using a Natural Language Prompt to KQL to provide further insights from Azure Web App Firewall among other use cases.
<a  name="URI Analysis"></a>

Disclaimer: Please know these are sample prompts and are subject to Change




**Required plugins** : Microsoft Defender Threat intelligence, Microsoft Defender XDR

**Required Input**:< AppServer >

**Required Input**:< URIRequest >

**Description**: Analyze a App Server Request, check the URI parameters passed, indicate if this is related a to a known CVE, and methods to address the CVE on the App Server.

1. Analyze the URI Request and parameters from App Server
 ```
 A <appserver> web server recieved a web call <urirequest> , please decode what is being passed in the URI parameters and explain what this URI with parameters is doing in each step
 ```
2. Idenitfy any known CVEs based on web request
 ```
Are there any known CVEs associated with this exploit ?
 ```
3. Identify a mitigation plan for the CVE on Web App Server
 ```
Can you provide a remediation plan with actionable steps for this exploit and the CVEs above
 ```

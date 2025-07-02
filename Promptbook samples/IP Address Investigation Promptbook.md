![Security CoPilot Logo](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)
#  IP Address Investigation Promptbook (MDTI)

**Description**: Get threat intelligence details for an IP address, including the MDTI reputation, WHOIS and DNS records, and web and service components.

**Required Plugin**: Microsoft Threat intelligence 

**Required Input**: <IP_ADDRESS>

1. Get the latest reputation score
 ```
Give me the Microsoft Defender Threat Intelligence reputation score for <IP_ADDRESS>. Present this information as short summary paragraph, followed by bullet points.
 ```
2. Get Whois record
 ```
Give me the WHOIS record for <IP_ADDRESS>. Present this information as a short summary paragraph, followed by bullet points.
```
3. Get reverse DNS records
 ```
Give me the reverse DNS record for <IP_ADDRESS>. Present this information as a short summary paragraph, followed by a table.
 ```
4. Get web components
 ```
Give me details of the web components for <IP_ADDRESS>. Present this information as a short summary paragraph, followed by a table.
 ```
5. Get services
 ```
Give me details of the services for <IP_ADDRESS>. Present this information as a short summary paragraph, followed by a table.
```
6. Generate threat bulletin
 ```
/SummarizeData I am a threat intelligence analyst writing a threat bulletin about this IP address. Based on the above investigation, generate a threat bulletin that summarises the above intelligence. The response should include a short introduction, bullet points of the key information, and a conclusion.
 ```

## Promptbook JSON Format
```
{"name":"IP Address Investigation (MDTI)",
"description":"Get threat intelligence details for an IP address, including the MDTI reputation, WHOIS and DNS records, and web and service components.",
"prompts":
[
 {"promptType":"Prompt","content":"Give me the Microsoft Defender Threat Intelligence reputation score for <IP_ADDRESS>. Present this information as short summary paragraph, followed by bullet points."},
 {"promptType":"Prompt","content":"Give me the WHOIS record for <IP_ADDRESS>. Present this information as a short summary paragraph, followed by bullet points."},
 {"promptType":"Prompt","content":"Give me the reverse DNS record for <IP_ADDRESS>. Present this information as a short summary paragraph, followed by a table."},
 {"promptType":"Prompt","content":"Give me details of the web components for <IP_ADDRESS>. Present this information as a short summary paragraph, followed by a table."},
 {"promptType":"Prompt","content":"Give me details of the services for <IP_ADDRESS>. Present this information as a short summary paragraph, followed by a table."},
 {"promptType":"Prompt","content":"/SummarizeData I am a threat intelligence analyst writing a threat bulletin about this IP address. Based on the above investigation, generate a threat bulletin that summarises the above intelligence. The response should include a short introduction, bullet points of the key information, and a conclusion."}
],
"promptbookinputs":
[
 {"name":"IP_ADDRESS","description":"User input"}
],
"visibility":"Private","tags":"MDTI"}
```

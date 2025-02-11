![Security CoPilot Logo](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)
#  Domain Name Investigation Promptbook (MDTI)

**Description**: Get threat intelligence details for a fully qualified domain name (FQDN), including the MDTI reputation, WHOIS and subdomain resolutions, and web components.

**Required Plugin**: Microsoft Threat intelligence 

**Required Input**: <DOMAIN_NAME>

1. Get the latest reputation score
 ```
Give me the Microsoft Defender Threat Intelligence reputation score for <DOMAIN_NAME>. Present this information as a short summary paragraph, followed by bullet points.
 ```
2. Get Whois record
 ```
Give me the WHOIS record for <DOMAIN_NAME>. Present this information as a short summary paragraph, followed by bullet points.
```
3. Get IP resolutions
 ```
Give me the resolutions for <DOMAIN_NAME>. Present this information as a short summary paragraph, followed by a table.
 ```
4. Get subdomains
 ```
Give me details of the subdomains for <DOMAIN_NAME>. Present this information as a short summary paragraph, followed by a table.
 ```
5. Get web components
 ```
Give me details of the web components for <DOMAIN_NAME>. Present this information as a short summary paragraph, followed by a table.
```
6. Generate threat bulletin
 ```
/SummarizeData I am a threat intelligence analyst writing a threat bulletin about this domain. Based on the above investigation, generate a threat bulletin that summarises the above intelligence. The response should include a short introduction, bullet points of the key information, and a conclusion.
 ```

## Promptbook JSON Format
```
{"name":"Domain Name Investigation (MDTI)",
"description":"Get threat intelligence details for a fully qualified domain name (FQDN), including the MDTI reputation, WHOIS and subdomain resolutions, and web components.",
"prompts":
[
 {"promptType":"Prompt","content":"Give me the Microsoft Defender Threat Intelligence reputation score for <DOMAIN_NAME>. Present this information as short summary paragraph, followed by bullet points."},
 {"promptType":"Prompt","content":"Give me the WHOIS record for <DOMAIN_NAME>. Present this information as a short summary paragraph, followed by bullet points."},
 {"promptType":"Prompt","content":"Give me the resolutions for <DOMAIN_NAME>. Present this information as a short summary paragraph, followed by a table."},
 {"promptType":"Prompt","content":"Give me details of the subdomains for <DOMAIN_NAME>. Present this information as a short summary paragraph, followed by a table."},
 {"promptType":"Prompt","content":"Give me details of the web components for <DOMAIN_NAME>. Present this information as a short summary paragraph, followed by a table."},
 {"promptType":"Prompt","content":"/SummarizeData I am a threat intelligence analyst writing a threat bulletin about this domain. Based on the above investigation, generate a threat bulletin that summarises the above intelligence. The response should include a short introduction, bullet points of the key information, and a conclusion."}
],
"promptbookinputs":
[
 {"name":"DOMAIN_NAME","description":"User input"}
],
"visibility":"Private","tags":"MDTI"}
```

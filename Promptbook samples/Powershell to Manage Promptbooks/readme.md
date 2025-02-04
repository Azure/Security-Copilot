![Security CoPilot Logo](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)

**DISCLAIMER**: This method to upload Promptbooks uses unpublished API calls that are subject to change without notice. This is not an officially supported method from Microsoft and no guarantees are given that this method will work in your environment. Support tickets on its functionality cannot be raised.

# Microsoft Security Copilot PowerShell to manage Promptbooks

There are two different PowerShell scripts, one for upload one for download.

# Downloading Promptbooks
The PowerShell script 'PromptBooksDownload.ps1' allows you to download all your Promptbooks in your local disk inside the './Downloads' folder. The Promptbooks are stored in a JSON format and each Promptbook is in its own JSON file. Each file is given the promptbook name, with spaces and special characters removed. To download all the promptbooks execute the following command.

Powershell -file PromptBooksDownload.ps1 -token <authorization token> -namecontains "CVE"

The '-namecontains' parameter is optional. If specified, the script only downloads the promptbooks who's name contains the phrase specified by the '-namecontains' parameter ("CVE" in this case). Specify the phrase in double quotes.

Description of the JSON format and instructions on obtaining the authorization token are given below.

IMPORTANT: During the download process, certain fields from the Promptbook that can identify the source (tenant, creation time etc.) are removed due to security reasons. Also the visibility for all Promptbooks is set to 'Private', so that if the downloaded promptbooks are uploaded to another tenant they will be Private and will have to be changed manually to be visible in the organization. The 'Plugins' field that is assigned to each prompt (in a Promtbook) is also removed. 

# Uploading Promptbooks

The PowerShell script 'PromptBooksUpload.ps1' allows you to upload multiple Promptbooks at once. The Promptbooks should be in JSON format and each Promptbook should be in its own JSON file. Once the JSON files are created they should be in placed in the ./Uploads folder and the following command executed to upload them in your Copilot instance:

Powershell -file PromptBooksUpload.ps1 -token <authorization token>

Description of the JSON format and instructions on obtaining the authorization token are given below:

# Promptbook JSON Format

The following is a template JSON format for a promptbook that executes two prompts in sequence. Most of the JSON property names are self-descriptive. Make sure the variable sed in Promptbook inputs matches the specification in prompts and it is case-sensitive.

```
{"name":"Sample promptbook to use as a template",
"description":"This is sample promptbook JSON that can be used to generate other promptbooks",
"prompts":
[
 {"promptType":"Prompt","content":"Give me more information on <user>"},
 {"promptType":"Prompt","content":"Is this user considered risky"},
 {"promptType":"Prompt","content":"Are they other Defender incidents concerning this user"},
 {"promptType":"Prompt","content":"Give a summary of all results so far"}
],
"promptbookinputs":
[
 {"name":"user","description":"User input"}
],
"visibility":"Private","tags":null}
```

Several Promptbook JSON files have been provided in the Uploads folder so you can reference them.

# Access Token

Currently, the Azure CLI login command cannot fetch the token for Security Copilot. Hence, you will need to get the access token from an existing session in the Browser. In the Microsoft Edge browser, login to the Security Copilot console and after authentication process is complete via MFA etc, press 'F12' to open Browser devtools.  

![Browser Tools](https://github.com/Azure/Copilot-For-Security/blob/main/Images/Promptbook_images/promptBook_devtools.png)

Then navigate into the Promptbooks from the console, and then filter on 'Promptbooks' in the devtools (in network tab). You can get the access token from the headers for the GET request make to the Promptbooks URI(https://api.securitycopilot.microsoft.com/geo/eastus/promptbooks). Copy the entire request token, making sure not to copy the 'Bearer' keyword and not copying any extra space.

Note that you can get the token from other URIs in the Copilot console, going to Promptbooks is just one way. With the token copied you are ready to execute the PowerShell.

![Copy Access Token](https://github.com/Azure/Copilot-For-Security/blob/main/Images/Promptbook_images/promptBook_token.png)

# Execution for Download and Upload

Navigate to the folder where the 'PromptBooksDownload.ps1' and 'PromptBooksUpload.ps1' files are placed, same folder should have the 'Downloads' and 'Uploads' sub-folder. The 'Uploads' sub-folder should contain all the Promptbook JSON's you need to upload in your Security Copilot instance. 

If your Security Copilot instance is not in 'eastus' you will have to change the URI in line 11 so the URI contains the correct region. The upload will fail is this is not corrected.

Execute the following command, pasting the token you copied from browser after the -token command line arguement.

Download: Powershell -file PromptBooksDownload.ps1 -token <authorization token>

Upload: Powershell -file PromptBooksUpload.ps1 -token <authorization token>

The following screen capture show the upload process:

![PowerShell Commandline](https://github.com/Azure/Copilot-For-Security/blob/main/Images/Promptbook_images/promptBook_commandLine.png)

As the PowerShell executes it will output the file name and the status of each of the file uploads (for downloads the name of the file being written is displayed). If you get an error please see the troubleshooting section.

![PowerShell Successful execution](https://github.com/Azure/Copilot-For-Security/blob/main/Images/Promptbook_images/promptBook_results.png)

IMPORTANT: After the download/upload is successful, please logout of your Security Copilot console so that the authorization token is no longer valid. While the token is valid for only a fixed amount of time, for security reasons you should do an explicit logout so the token cannot be used again.

# Troubleshooting:

- If you get a HTTP 401, please make sure the token is valid. It should not have expired or have any leading or trailing spaces when you paste it. Also make sure the URI in the PowerShell script has the correct region specified. 
- If you get HTTP 400, please verify the correctness of the prompt JSON file. Specifically if you are using a variable, make sure it has the same name in your prompts and in the 'promptbookinputs' section. The variable is case sensitive, and the token name and its description cannot be the same text.
- In case of HTTP 500, check the JSON format. A missing or extra ',' is not an acceptable JSON, and it is advised to run your JSON via a formatter to identify any issues. 

**Documentation**
- [Using Promptbooks | Microsoft Learn](https://learn.microsoft.com/en-us/security-copilot/using-promptbooks)
- [Build your own promptbooks | Microsoft Learn](https://learn.microsoft.com/en-us/security-copilot/build-promptbooks)

**Prerequisites**
- Check if you have appropriate access and permissions to create promptbooks.[Understand authentication in Microsoft Security Copilot | Microsoft Learn](https://learn.microsoft.com/en-us/security-copilot/authentication)


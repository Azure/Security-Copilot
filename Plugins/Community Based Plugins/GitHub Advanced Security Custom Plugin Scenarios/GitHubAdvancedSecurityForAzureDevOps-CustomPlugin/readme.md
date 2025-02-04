**GitHub Advanced Security for Azure DevOps (GAzDO) Custom Plugin**

GitHub Advanced Security for Azure DevOps (GAzDO) executes code scanning (Static Application Security Testing, SAST, via CodeQL), dependabot analysis (Software Composition Analysis, SCA) and secret scanning on the files in the repos of Azure DevOps organizations.
This folder contains a plugin for Security Copilot that queries the "List" and "Get" API exposed by Azure DevOps and related to Advanced Security (GAzDO).

Instructions
- In Azure DevOps, create a Personal Access Token (PAT). Assign to it at least the scope of "Read" in "Advanced Security"
- Generate the Base64 version of the string "Basic:<your-personal-access-token>". For example, use this PowerShell command:
  [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes("Basic:<your-personal-access-token>"))
- Download the file *Manifest.yaml from this folder
- Create the custom plugins in Security Copilot by uploading this manifest file 
- After the upload, configure the custom plugins by setting the 2 requested parameters: the name of your organization in Azure DevOps (write it at the end of the proposed URL) and the Base64 version of your Personal Access Token, created as described above.
- You can now use the skills available in this plugin. 

Initial release author:
Stefano Pescosolido
https://linkedin.com/in/stefanopescosolido

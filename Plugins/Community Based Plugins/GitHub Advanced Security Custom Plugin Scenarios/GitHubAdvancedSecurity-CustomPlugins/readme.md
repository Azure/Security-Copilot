**GitHub Advanced Security (GhAS) Custom Plugins**

GitHub Advanced Security (GhAS) executes code scanning (Static Application Security Testing, SAST, via CodeQL), dependabot analysis (Software Composition Analysis, SCA) and secret scanning on the files in the repos of GitHub users and organizations.
This folder contains 2 plugins for Security Copilot:
- The "GitHub Advanced Security for GitHub Organizations" plugin has the skills to list all the alerts resulting from GhAS analysis on all the repos of an organization. It calls the https://api.github.com/orgs/Org-Name API in GitHub.
- The "GitHub Advanced Security for GitHub Repositories" plugin has the skills to list all the alerts resulting from GhAS analysis on a specific repo of an organization. It has also the skills to get the details of each alert. It allows also to read the CodeQL configuration on a specific repo.  It calls the https://api.github.com/repos/Org-Name API in GitHub.

Instructions
- In GitHub, create a Personal access token of type "classic". Assign to it at least the scope of "repo" / "security_events"
- Download the 2 files *Manifest.yaml from this folder
- Create the 2 custom plugins in Security Copilot, one after the other, by uploading these 2 manifest files 
- After each upload, configure each of the 2 custom plugins by setting, on each of them, the 2 requested parameters: the name of your organization in GitHub (write it at the end of the proposed URL) and the personal access token (key) created in GitHub
- You can now use the skills available in these 2 plugins. 

For detailed step-by-step guidance and demos, please refer to https://www.linkedin.com/pulse/copilot-security-custom-plugin-github-advanced-stefano-pescosolido-vrcpf/?trackingId=asq05nvu75FGTlUOJYBw6w%3D%3D

Note:
- In this initial first preview release, all skills require to specify in input a "User-Agent" parameter. This is a temporary workaround for ensuring that Security Copilot writes this parameter in the header of its calls to the GitHub APIs (without that header, the APIs return access denied). **In that parameter you can set any value** (the value of that parameter is not relevant). Typically you have to write set its value only once in a session: in the following prompts Copilot assumes that its value remains the same.  

Initial release author:
Stefano Pescosolido
https://linkedin.com/in/stefanopescosolido

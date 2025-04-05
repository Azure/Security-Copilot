# Send the results of Security Copilot's Promptbook by email

This Logic App executes the specified Promptbook in Security Copilot (Copilot for Security). It then converts each prompt's response, written in the simplified markdown language of Security Copilot, into HTML. Using these HTML excerpts or plain text responses and starting from a customizable HTML template, it constructs the HTML body of an email and finally sends that email to the specified recipients. It is possible to exclude one or more of the promptbook responses from the email by their position index (1, 2, 3, etc.); it is also possible to replace the text of one or more prompts in the email for the sake of readability.

Please refer to this article for further details and for a video on how to deploy and use it: https://www.linkedin.com/pulse/sending-security-copilot-promptbook-responses-via-stefano-pescosolido-wcalf.

### Prerequisites:
* This Logic App is useful when you have active Security Compute Units (SCUs) for Security Copilot


### Post deployment actions:
1. Set the credentials for the OAuth API connection to Security Copilot and Office 365 (the connection to O365 is used to send the email).
2. Edit the workflow and set the promptbook name and related parameters in the run-prompt action (after the deployment, they are empty).
3. In the workflow editor, if needed, modify the trigger type and/or parameters (e.g., change the recurrence date and time or replace the trigger with the Microsoft Sentinel Incident trigger).
4. In the workflow editor, open the parameters and set the desired email title, subject, and recipients.
5. In the workflow editor, in the parameters list, if needed, specify the indexes of the prompts that should not be included in the email (use the SkipPromptsInOutput parameter).
6. In the workflow editor, if needed, further customize the email subject (e.g., if you have changed the trigger to MS Sentinel Incident, you may want to include the incident ID at the end of the email subject).
7. Enable the Logic App (the template deploys it in disabled state).

## Deployment button
[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FSecurity-Copilot%2Frefs%2Fheads%2Fmain%2FLogic%2520Apps%2FCfS-SendPromptbookResultsByEmail%2FCfS-SendPromptbookResultsByEmail.json)

## Example of email customization:
The following image shows:
1. The standard promptbook "Vulnerability impact assessment" used as an example
2. The email delivered using the default HTML template
3. The customization of 3 parameters: HtmlBodyHeader (for changing the colors), SkipPromptsInOutput (for hiding the second prompt and response in the email) and ReplacePromptsInOutput (for replacing, in the email, the text of the first and third prompt. Note: the second prompt in the array is left as empty string "", meaning that there should be no replacement; the last prompt is not even included, which also means no replacement)  
4. The email delivered using that customization
   
![Example of email customization](./Example%20of%20email%20customization.png)

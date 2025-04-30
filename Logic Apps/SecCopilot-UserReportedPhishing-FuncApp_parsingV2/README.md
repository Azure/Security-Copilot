# Phishing Analysis with Security Copilot
**Author:** Craig Freyman

An automated phishing email analysis solution leveraging Azure Logic Apps, Function Apps, and Security Copilot. With the right permissions, it can be deployed in five minutes. The Logic App monitors a shared Office 365 mailbox and triggers analysis when an email arrives. Security Copilot assesses the message for malicious intent, generating detailed HTML reports sent via email. Optional integration with Microsoft Sentinel enables incident tracking and management. This project demonstrates what’s possible with Security Copilot and Azure. It may work out of the box or require tuning — the good news: only a single Security Copilot prompt is used, making it easy to customize for your organization.

## Overview

This solution provides an end-to-end workflow for analyzing suspected phishing emails. The core functionality is handled by a series of Azure Functions that parse emails, extract important data, clean JSON input, and generate HTML reports. When combined with Security Copilot and Logic Apps, it creates a powerful system to distinguish between legitimate, spam, suspicious, and phishing emails.

### Key Components

1. **Email Parser Function** - Extracts and processes email content, including:
   - Recursive unwrapping to find original emails (Handles forwarded, embedded, and TNEF-encapsulated messages)
   - **Enhanced Proofpoint compatibility** for analyzing emails forwarded from Proofpoint
   - Smart handling of Proofpoint and Microsoft SafeLinks URL protection
   - Support for EML and MSG attachments
   - Complete header, body, and attachment analysis

2. **HTML Report Generator** - Creates formatted HTML reports from phishing analysis results:
   - Color-coded categorization (Phishing, Spam, Legitimate, Suspicious)
   - Detailed breakdown of analysis findings
   - Organized by assessment categories

### Purpose and Scope

This solution is not designed to replace traditional spam filtering or email security gateways. Rather, it demonstrates the art of the possible when combining Security Copilot with Azure Functions and Logic Apps to enhance your existing email security infrastructure. This solution assumes you already have standard email gateway filtering in place.

The primary focus is on providing deeper analysis of suspicious emails that have been forwarded for investigation, especially those coming from Proofpoint-protected environments.

## Prerequisites

1. **Azure Resources:**
   - Azure subscription
   - Contributor rights to the deployment target resource group
   - [Security Copilot Security Compute Units](https://learn.microsoft.com/en-us/copilot/security/get-started-security-copilot)
   - Microsoft Sentinel workspace (optional)

2. **Email Configuration:**
   - [Office 365 shared mailbox for monitoring](https://learn.microsoft.com/en-us/microsoft-365/admin/email/create-a-shared-mailbox?view=o365-worldwide)
   - Permissions to manage email configurations

## Deployment Steps

### 1. Deploy Function App

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FCopilot-For-Security%2Fmain%2FLogic%20Apps%2FSecCopilot-UserReportedPhishing-FuncApp_parsingV2%2Ffunctionapp_azuredeploy.json)

Required Parameters:
- FunctionAppName (name is prepended with "phish" and random characters are appended)
- FunctionAppResourceGroup

Wait for the Function App to fully deploy before moving on to step 2.

### 2. Deploy Logic App

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FCopilot-For-Security%2Fmain%2FLogic%20Apps%2FSecCopilot-UserReportedPhishing-FuncApp_parsingV2%2Flogicapp_azuredeploy.json)

Required Parameters:
- SubscriptionId
- LogicAppName
- FunctionAppName (step 1)
- FunctionAppResourceGroup (step 1)
- SharedMailboxAddress
- HTMLReportRecipient

Optional Sentinel Parameters (use "none" if not using Sentinel):
- LogAnalyticsWorkspaceName
- LogAnalyticsWorkspaceId
- LogAnalyticsResourceGroup

### 3. Configure API Connections

1. Open the Logic App in Azure Portal
2. Authorize these connections:
   - Office 365 (shared mailbox access)
   - Security Copilot
   - Azure Monitor Logs (if using Sentinel)
   - Sentinel (if using Sentinel)

### 3. Configure Logic App Permissions

If using Sentinel integration, assign these roles to the Logic App's managed identity:

1. "Log Analytics Reader" role (provides Microsoft.OperationalInsights/workspaces/read)
2. "Microsoft Sentinel Responder" role (provides Microsoft.SecurityInsights/incidents/comments/write)

Assign Permissions Step by Step:

1. Open the Log Analytics workspace and go to "Access control (IAM)"
![alt text](image.png)
2. Select "Log Analytics Reader"
![alt text](image-1.png)
3. Select "Managed Identity" and select the name of your Logic App
![alt text](image-2.png)
4. Click next and assign permissions
5. Repeat steps 1-4 for the "Microsoft Sentinel Responder" role

### 5. Enable the Logic App

The Logic App deploys in a disabled state. Enable it in the Logic App Overview to begin operation.

## Functions and Endpoints

The Function App exposes the following HTTP endpoints:

1. **Email Parser** (`/parse_email_functionapp`)
   - Method: POST
   - Body: Raw email content or JSON with Base64-encoded email
   - Optional Parameters: `max_depth` (default=10)
   - Returns: Parsed email data in JSON format

2. **JSON Cleaner** (`/clean_json_functionapp`)
   - Method: POST
   - Body: JSON content (can include markdown notation)
   - Returns: Cleaned JSON with markdown removed and nulls replaced

3. **HTML Report Generator** (`/generate_html_report_functionapp`)
   - Method: POST
   - Body: Phishing analysis JSON
   - Returns: Formatted HTML report

4. **Regex Extractor** (`/extract_regex_functionapp`)
   - Method: POST
   - Body: JSON with `pattern` and `subject` fields
   - Returns: Match results in JSON format

## Email Parsing Capabilities

### Email Format Support
- Regular MIME emails (text/plain, text/html)
- Embedded emails (message/rfc822)
- TNEF attachments (winmail.dat)
- EML and MSG file attachments
- Forwarded emails from various email clients (Gmail, Outlook, Apple Mail)
- Proofpoint-reported phishing emails

### Content Extraction
- Complete header analysis
- Body content from both plain text and HTML
- URL extraction and normalization
- Domain extraction
- IP address extraction
- Attachment processing

### Attachment Handling
- PDF text extraction
- Excel content extraction (with multiple fallback methods)
- Email attachments (recursive parsing)
- SHA256 hashing for attachment verification

### URL Processing
- Microsoft SafeLinks URL decoding
- Proofpoint URLDefense URL decoding
- URL shortener expansion
- Base URL deduplication for high-volume cases

## Features

- Automated email monitoring and analysis
- Detailed security assessment using Security Copilot
- Classification of emails (Phishing, Spam, Legitimate, Suspicious)
- HTML report generation
- Optional Sentinel incident integration
- Support for embedded emails and complex forwarding chains
- Comprehensive URL and domain extraction and analysis

## Security Notes

- The solution uses system-managed identities for secure access
- Review and configure storage account security settings per your company policy
- Ensure minimum required permissions for all connections
- Regularly update Function App dependencies
- The email parser uses the `CustomEmailPolicy` to handle common email parsing issues like malformed Message-ID headers

## Debugging and Logging

The application uses Python's `logging` module with DEBUG level enabled, providing comprehensive logs for troubleshooting. Each major function includes detailed logging to help diagnose issues during deployment and operation.

## Limitations

- PDF extraction requires the pdfminer.six library
- Excel processing may require multiple libraries (pandas, openpyxl, xlrd)
- URL expansion has rate limits to avoid being blocked
- High-volume URL cases automatically deduplicate to base URLs
- Private/local IP addresses are filtered out from IP extraction

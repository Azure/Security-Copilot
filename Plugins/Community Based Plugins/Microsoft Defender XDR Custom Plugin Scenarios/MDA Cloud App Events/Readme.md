# Copilot for Security Plugin: MDA Cloud App Events

### This KQL plugin enables SOC analysts to investigate events related to accounts and objects in Office 365 and other cloud applications and services, using the Defender for Cloud Apps data from the CloudAppEvents table. 

The CloudAppEvents table contains enriched logs from all SaaS applications connected to MDA, including Office 365 Applications such as:
- OneDrive
- SharePoint
- Exchange Online
- Teams

### Prerequisites

-   [Copilot for Security enabled](https://learn.microsoft.com/en-us/security-copilot/get-started-security-copilot#onboarding-to-microsoft-security-copilot)
-   [Access to upload custom plugins](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#managing-custom-plugins)

### Instructions

#### Upload the Custom Plugin

1.  Obtain the file MDA_Cloud_App_Events.yaml from this directory.
2.  Upload the custom plugin

### Plugin Utilisation

#### Skills

- **GetOneDriveActivtyForUser**: Feteches a list of a user's OneDrive activity within a specified timeframe
- **GetSharePointActivityForUser**: Fetches a list of a user's SharePoint activity within a specified timeframe
- **GetExchangeOnlineActivityForUser**: Fetches a list of a user's Exchange Online activity within a specified timeframe
- **GetTeamsActivityForUser**: Fetches a list of a user's Teams activity within a specified timeframe

#### Example Prompts

- Get a list of OneDrive activity for someone@example.com from the past 2 hours
- Fetch a list of SharePoint activity for someone@example.com from the past 1 day
- List all the Exchange Online activity for someone@example.com from the past 2 hours
- Get a list of Teams activity for someone@example.com from the past 1 day

#### Example Usage

1. A SOC analyst is investigating an alert from Purview Insider Risk Management.
2. The GetOneDriveActivtyForUser skill is used to get a summary of the users' activity 1 hour before the alert.
3. The GetTeamsActivityForUser skill is used to identify if the user has shared any content via Teams.
4. The Entra ID plugin is used to summarise the users' risk level. 

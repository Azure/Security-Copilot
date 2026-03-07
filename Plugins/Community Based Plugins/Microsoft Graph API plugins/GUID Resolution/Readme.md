# Plugin to Resolve GUIDs to Microsoft Entra Service Principals (Enterprise Applications)

## Overview
This plugin enables users to resolve GUIDs found in security alerts to their corresponding **Microsoft Entra service principal (Enterprise Application)** display names and identifiers using the **Microsoft Graph API**. When investigating alerts, the "Caller" or source fields often contain opaque GUIDs — this plugin translates them into human-readable application names, accelerating triage and incident response. It can also be used as a tool when building a **Security Copilot Custom Agent**.

## Features
- Resolves a service principal by **Object ID** (the GUID commonly found in alert "Caller" fields).
- Resolves a service principal by **Application (Client) ID / appId** when the GUID represents the app registration rather than the service principal object.
- Returns key details including **display name, Object ID, appId, service principal type, account enabled status, and publisher name**.

## API Endpoint
**Base URL:** `https://graph.microsoft.com/v1.0`

### Setup Instructions
#### Upload the Plugin Manifest

1. Obtain the manifest [sp guid resolver-plugin.yaml](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Microsoft%20Graph%20API%20plugins/GUID%20Resolution/sp%20guid%20resolver-plugin.yaml) and the OpenAPI Specification [sp guid resolver-plugin-spec.yaml](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Microsoft%20Graph%20API%20plugins/GUID%20Resolution/sp%20guid%20resolver-plugin-spec.yaml) files from this directory.
2. Download the Spec file and move it to your preferred location, ensuring it is reachable by Security Copilot.
3. [Upload the custom plugin](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#add-custom-plugins)

## Example Natural Language Queries
Use these sample prompts to retrieve relevant data via **Security Copilot**:
- "Resolve this caller GUID to the enterprise application name: 9cb7b82d-55cd-4265-b8a7-8899a7376e5c"
- "Get the service principal name for ObjectId 9cb7b82d-55cd-4265-b8a7-8899a7376e5c"
- "Resolve this appId GUID to the enterprise application name: a12e8ccb-0fcd-46f8-b6a1-000000000000"
- "Get the service principal name for appId a12e8ccb-0fcd-46f8-b6a1-000000000000"

---
For more details, visit the **[Microsoft Graph API documentation](https://learn.microsoft.com/en-us/graph/)**.

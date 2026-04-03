# Chat and Communication Protection Plugin

## DESCRIPTION
This plugin provides comprehensive Data Loss Prevention (DLP) and communication compliance skills for Microsoft Teams chat, channel messages, and meeting conversations. It enables Security Analysts to investigate sensitive data exposure in Teams communications, identify policy violations, track user override patterns, detect data exfiltration through chat channels, and assess DLP policy coverage for Teams workloads.

### Intended Audience
- **SOC Analysts** investigating DLP incidents involving Teams communications
- **Data Security Administrators** monitoring Teams DLP policy effectiveness
- **Compliance Officers** tracking communication compliance violations
- **Incident Responders** building exfiltration timelines across Teams channels

### Intended Uses
- Investigate DLP policy violations in Teams private chats, channel messages, and meeting chats
- Detect sensitive data shared with external or guest users through Teams
- Identify users who override DLP policy warnings and analyze override patterns
- Monitor communication compliance violations across Teams and Exchange
- Build chronological exfiltration timelines to support incident investigations
- Assess DLP policy coverage for Teams and identify protection gaps

### Supported Microsoft Products
- [Microsoft Security Copilot](https://learn.microsoft.com/en-us/security-copilot/)
- [Microsoft Purview DLP for Teams](https://learn.microsoft.com/en-us/purview/dlp-microsoft-teams)
- [Microsoft Purview Communication Compliance](https://learn.microsoft.com/en-us/purview/communication-compliance)
- [Microsoft Defender XDR](https://learn.microsoft.com/en-us/defender-xdr/)

### Limitations
- Skills query the CloudAppEvents table in Microsoft Defender XDR; results are limited to the data retention period configured in your tenant
- Communication compliance skills depend on communication compliance policies being configured in Microsoft Purview
- DLP alerts are only available for workloads where DLP policies targeting the Microsoft Teams location are enabled
- Meeting chat DLP detection requires DLP policies scoped to Teams chat — meeting recordings/transcripts are not analyzed
- External/guest user detection relies on `#EXT#` identifiers in user records; federated tenant users may not be detected
- This plugin provides read-only investigation capabilities — it does not block, modify, or remediate any content

---

## TYPE AND REQUIREMENTS
**TYPE**: KQL (Defender) <br>
**SOURCE**: _CloudAppEvents_ table (Microsoft Defender XDR) <br>

### Pre-requisites

- [Security Copilot Enabled](https://learn.microsoft.com/en-us/security-copilot/get-started-security-copilot#onboarding-to-microsoft-security-copilot)
- [Access to upload custom plugins](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#managing-custom-plugins)
- Microsoft Defender XDR with CloudAppEvents data ingestion enabled
- [DLP policies configured for Microsoft Teams workload](https://learn.microsoft.com/en-us/purview/dlp-microsoft-teams)
- (Optional) [Communication Compliance policies](https://learn.microsoft.com/en-us/purview/communication-compliance-policies) configured for the CommunicationComplianceSummary skill

### Instructions
#### Upload the Custom Plugin

1. Obtain the file [KQL_ChatProtection.yml](KQL_ChatProtection.yml) from this directory.
2. [Upload the custom plugin](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#add-custom-plugins) in Security Copilot.
3. Verify the plugin is activated and the skills appear in the skill list.
4. No additional authentication configuration is required — the plugin uses standard Defender XDR permissions.

---

## SKILLS

<table>
  <tbody>
    <tr>
      <th>SkillName</th>
      <th align="center">Description</th>
      <th align="center">Parameters</th>
    </tr>
    <tr>
      <td><b>ChatDLPGetTeamsChatAlerts</b></td>
      <td align="center">Fetches DLP policy violations in Teams chat messages including private, group, and channel messages</td>
      <td>
        <ul>
          <li><b>User</b> (optional) — UPN of the user</li>
          <li><b>LookbackDays</b> (optional) — Days to look back, default 7</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><b>ChatDLPGetChannelViolations</b></td>
      <td align="center">Gets DLP violations in Teams channels, summarized by team, channel, and policy</td>
      <td>
        <ul>
          <li><b>LookbackDays</b> (optional) — Days to look back, default 7</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><b>ChatDLPGetExternalSharingInTeams</b></td>
      <td align="center">Identifies sensitive data shared with external/guest users through Teams</td>
      <td>
        <ul>
          <li><b>User</b> (optional) — Internal user UPN</li>
          <li><b>LookbackDays</b> (optional) — Days to look back, default 14</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><b>ChatDLPGetMeetingChatViolations</b></td>
      <td align="center">Fetches DLP alerts triggered during Teams meeting chat sessions</td>
      <td>
        <ul>
          <li><b>LookbackDays</b> (optional) — Days to look back, default 7</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><b>ChatDLPGetUserOverrides</b></td>
      <td align="center">Identifies DLP policy overrides by users in Teams, showing intentional bypass patterns</td>
      <td>
        <ul>
          <li><b>User</b> (optional) — UPN of the user</li>
          <li><b>LookbackDays</b> (optional) — Days to look back, default 30</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><b>ChatDLPGetCommunicationComplianceSummary</b></td>
      <td align="center">Summarizes communication compliance violations across Teams and Exchange</td>
      <td>
        <ul>
          <li><b>User</b> (optional) — UPN of the user</li>
          <li><b>LookbackDays</b> (optional) — Days to look back, default 30</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><b>ChatDLPGetSensitiveDataInChats</b></td>
      <td align="center">Identifies sensitive information types detected in Teams chats, grouped by type</td>
      <td>
        <ul>
          <li><b>LookbackDays</b> (optional) — Days to look back, default 7</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><b>ChatDLPGetChatExfiltrationTimeline</b></td>
      <td align="center">Builds a chronological timeline of sensitive data activities in Teams for exfiltration analysis</td>
      <td>
        <ul>
          <li><b>User</b> (required) — UPN of the user to investigate</li>
          <li><b>LookbackDays</b> (optional) — Days to look back, default 14</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><b>ChatDLPGetTeamsPolicyCoverage</b></td>
      <td align="center">Analyzes DLP policy coverage for Teams communications and identifies gaps</td>
      <td>
        <ul>
          <li><b>LookbackDays</b> (optional) — Days to analyze, default 30</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

---

## SAMPLE PROMPTS

- `Get all DLP alerts triggered in Teams chat messages for user user@contoso.com in the last 14 days`
- `Show me DLP violations in Teams channels grouped by team and channel`
- `Which sensitive data has been shared with external users through Teams?`
- `Get DLP violations from Teams meeting chats in the last 7 days`
- `Show me users who have overridden DLP policies in Teams in the last 30 days`
- `Get communication compliance violation summary for user@contoso.com`
- `What types of sensitive information are being detected in Teams chats?`
- `Build a data exfiltration timeline for user@contoso.com across Teams chat`
- `Analyze DLP policy coverage for Teams communications — which policies are active and where are the gaps?`

---

## GAP ADDRESSED
The existing Purview plugin (`KQL_DataAnalyst.yml`) has only **1 Teams-related DLP skill** (`DLPTeamsDetectionsUser`) which provides basic alert-level data. This plugin adds **9 dedicated skills** for:
- Chat message-level DLP analysis
- Channel-specific violation tracking
- External/guest sharing detection
- Meeting chat compliance monitoring
- User override pattern detection
- Communication compliance integration
- Sensitive information type analysis in chats
- Exfiltration timeline building
- DLP policy coverage gap analysis

---

For more information, see: [Microsoft Purview DLP for Teams](https://learn.microsoft.com/en-us/purview/dlp-microsoft-teams)

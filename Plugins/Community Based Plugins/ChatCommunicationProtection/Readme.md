# Chat and Communication Protection Plugin

## DESCRIPTION
This plugin provides comprehensive Data Loss Prevention (DLP) and communication compliance skills for Microsoft Teams chat, channel messages, and meeting conversations. It enables Security Analysts to investigate sensitive data exposure in Teams communications, identify policy violations, track user override patterns, detect data exfiltration through chat channels, and assess DLP policy coverage for Teams workloads.

---

## TYPE AND REQUIREMENTS
**TYPE**: KQL (Defender) <br>
**SOURCE**: _CloudAppEvents_ table (Microsoft Defender XDR) <br>
**REQUIREMENTS**:
- [Security Copilot Enabled](https://learn.microsoft.com/en-us/security-copilot/get-started-security-copilot#onboarding-to-microsoft-security-copilot)
- [Access to upload custom plugins](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#managing-custom-plugins)
- Microsoft Defender XDR with CloudAppEvents data ingestion enabled
- DLP policies configured for Microsoft Teams workload

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

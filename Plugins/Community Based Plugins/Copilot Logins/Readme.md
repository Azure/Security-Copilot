# Security Copilot Login Activities

## DESCRIPTION
This plugin enables you to track how many logins there have been to the Security Copilot standalone experience and who did it. For each identity, the count of logins performed is returned.

---

## TYPE AND REQUIREMENTS
**TYPE**: KQL (Sentinel) <br>
**SOURCE**: _Signinlogs_ table <br>
**REQUIREMENTS**: Log Analytics Workspace with Sentinel enabled 

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
      <td><b>SecurityCopilotLogins</b></td>
      <td align="center">Fetches Security Copilot Standalone Portal logins in the last 3 days</td>
      <td>
        <ul>
        </ul>
      </td>
    </tr>
  </tbody>
</table>


---

## SAMPLE PROMPTS

- `« Fetches Security Copilot Standalone Portal logins in the last 3 days and detect if there are anomalies in user accesses »`
---

## SCREENSHOTS
<div align="center">
  <img src="https://github.com/mariocuomo/Security-Copilot/blob/main/Images/Community%20Plugins/SecurityCopilotLogins/LoginsAndAnomalies.png" width="700"> </img>
</div>


For more information, see: [Security Copilot Plugin: Security Copilot Portal Logins](https://rodtrent.substack.com/p/copilot-for-security-plugin-copilot)

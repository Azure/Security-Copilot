# Fetch Sentinel incident comments

## DESCRIPTION
This plugin shows how to retrieve comments associated with a Sentinel Incident to add context to an investigation performed with Security Copilot.

---

## TYPE AND REQUIREMENTS
**TYPE**: KQL (Sentinel) <br>
**SOURCE**: _SecurityIncident_ table <br>
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
      <td><b>SentinelIncidentComments</b></td>
      <td align="center">Fetch Sentinel incident comments</td>
      <td>
        <ul>
          <li>
            <i>incidentNumber</i> <br>
          </li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>


---

## SAMPLE PROMPTS

- `« Fetch Sentinel comments for incident <INCIDENT-NUMBER> and infer what was performed to investigate it »`

---

## SCREENSHOTS
<div align="center">
  <img src="https://github.com/mariocuomo/Security-Copilot/blob/main/Images/Community%20Plugins/SentinelIncidentComments/SentinelIncidentComments.png" width="700"> </img>
</div>

# Sentinel Watchlist integration in Security Copilot

## DESCRIPTION
This plugin demonstrates the possibility of integrating data from a Microsoft Sentinel Watchlist with Security Copilot. <br>
The manifest refers to a watchlist containing trusted users (**TrustedUsers**), but it can easily be adapted to different watchlists.

``` kql
Template: |-
            _GetWatchlist('TrustedUsers') | distinct TrustedUsers
```
---

## TYPE AND REQUIREMENTS
**TYPE**: KQL (Sentinel) <br>
**SOURCE**: any watchlist in Sentinel <br>
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
      <td><b>GetTrustedUsers</b></td>
      <td align="center">Fetches the list of trusted users that is being maintained as a Microsoft Sentinel watchlist</td>
      <td>
        <ul>
        </ul>
      </td>
    </tr>
  </tbody>
</table>


---

## SAMPLE PROMPTS

- `« Fetch the trusted users in Sentinel »`
---

## SCREENSHOTS
<div align="center">
  <img src="https://github.com/mariocuomo/Security-Copilot/blob/main/Images/Community%20Plugins/WatchlistKQL/TrustedUserWatchlist.png" width="700"> </img>
</div>

For more information, see: [Creating a Security Copilot KQL Plugin to Query Sentinel Watchlists](https://rodtrent.substack.com/p/creating-a-copilot-for-security-kql)

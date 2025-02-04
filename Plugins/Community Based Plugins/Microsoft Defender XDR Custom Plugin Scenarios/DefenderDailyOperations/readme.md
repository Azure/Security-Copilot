# Defender Daily Operations

## DESCRIPTION
This plugin aids in comprehending the recommended approach of integrating multiple related skills into a single plugin. The provided code sample demonstrates the combination of two skills to retrieve information from few defender tables. You can further expand upon this example to extract additional details from custom tables etc.

---

## TYPE AND REQUIREMENTS
**TYPE**: KQL (Defender) <br>
**SOURCE**: _DeviceInfo_ and _EmailEvents_ tables <br>
**REQUIREMENTS**: access to Defender XDR 

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
      <td><b>GetDefenderDevices</b></td>
      <td align="center">Get the top 10 devices from defender based on device state, exposure for the last 8 hours</td>
      <td>
        <ul>
          <li>
            <i>devicehealthstate</i> <br> (Active, Misconfigured, Inactive)
          </li>
          <li><i>exposurelevel</i></li> (Low, Medium, High)
        </ul>
      </td>
    </tr>
    <tr>
      <td><b>GetLatestEmailsByRecipient</b></td>
      <td align="center">Fetches the latest emails received by the user with the specified email address</td>
      <td>
        <ul>
          <li><i>email</i></li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>


---

## SAMPLE PROMPTS

- `« Fetch the latest emails received by user email <YOUR-EMAIL-ADDRESS> »`
- `« Show Defender Devices with Active health state with an High exposure level » `
---

## SCREENSHOTS
<div align="center">
  <img src="https://github.com/Azure/Security-Copilot/tree/main/Images/Community%20Plugins/DefenderDailyOperations/GetLatestEmailsByRecipient.png" width="700"> </img>
  <img src="https://github.com/Azure/Security-Copilot/tree/main/Images/Community%20Plugins/DefenderDailyOperations/GetDefenderDevices.png" width="700"> </img>
</div>

# Enhanced DLP Analytics and Cross-Workload Correlation Plugin

## DESCRIPTION

This plugin extends the existing Data Security Analyst plugin (`KQL_DataAnalyst.yml`) with advanced analytics capabilities for DLP investigations. It provides cross-workload correlation, false positive analysis, policy health monitoring, sensitivity label compliance tracking, and trend analysis — capabilities that are missing from the base plugin.

### Intended Audience

- **SOC Analysts** investigating multi-workload DLP incidents
- **Data Security Administrators** tuning DLP policy effectiveness
- **Compliance Officers** assessing DLP policy coverage and label compliance
- **Security Managers** monitoring organizational DLP posture and trends

### Intended Uses

- Correlate a user's DLP violations across Exchange, Teams, SharePoint, OneDrive, and Endpoints in a single unified view
- Identify DLP policies with high false positive rates using override pattern analysis
- Detect workloads with no DLP policy coverage (critical protection gaps)
- Flag high-risk users who trigger DLP alerts across multiple platforms simultaneously
- Track sensitivity label downgrades and removals that may indicate policy bypass
- Perform DLP policy health checks with match rates, override rates, and effectiveness metrics
- Analyze DLP alert trends over time to identify spikes and anomalies

### Supported Microsoft Products

- [Microsoft Security Copilot](https://learn.microsoft.com/en-us/security-copilot/)
- [Microsoft Purview Data Loss Prevention](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp)
- [Microsoft Defender XDR](https://learn.microsoft.com/en-us/defender-xdr/)

### Limitations

- Skills query the CloudAppEvents table in Microsoft Defender XDR; results are limited to the data retention period configured in your tenant
- Cross-workload correlation requires DLP policies enabled on the relevant workloads to generate alerts
- False positive analysis uses override rates as a proxy — a high override rate may indicate either false positives or inadequate user training
- Policy coverage gap detection identifies workloads with zero DLP alert matches; a workload with no alerts could also mean no sensitive data activity (not necessarily a gap)
- Label downgrade detection depends on label change events being logged in CloudAppEvents
- This plugin provides read-only analytics — it does not modify policies, labels, or user permissions

---

## TYPE AND REQUIREMENTS
**TYPE**: KQL (Defender) <br>
**SOURCE**: _CloudAppEvents_ table (Microsoft Defender XDR) <br>

### Pre-requisites

- [Security Copilot Enabled](https://learn.microsoft.com/en-us/security-copilot/get-started-security-copilot#onboarding-to-microsoft-security-copilot)
- [Access to upload custom plugins](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#managing-custom-plugins)
- Microsoft Defender XDR with CloudAppEvents data ingestion enabled
- [DLP policies configured](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp) across one or more workloads (Exchange, Teams, SharePoint, OneDrive, Endpoint)
- [Sensitivity labels configured](https://learn.microsoft.com/en-us/purview/sensitivity-labels) for label compliance tracking skills

### Instructions
#### Upload the Custom Plugin

1. Obtain the file [KQL_DLPEnhanced.yml](KQL_DLPEnhanced.yml) from this directory.
2. [Upload the custom plugin](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#add-custom-plugins) in Security Copilot.
3. Verify the plugin is activated and the skills appear in the skill list.
4. No additional authentication is required — the plugin uses standard Defender XDR permissions.
5. **Note**: This plugin complements the existing `KQL_DataAnalyst.yml` plugin — both can be active simultaneously without conflict.

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
      <td><b>DLPCrossWorkloadCorrelation</b></td>
      <td align="center">Correlates a user's DLP violations across Exchange, Teams, SharePoint, OneDrive, and Endpoints in one unified view</td>
      <td>
        <ul>
          <li><b>User</b> (required) — UPN of the user</li>
          <li><b>LookbackDays</b> (optional) — Days to look back, default 14</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><b>DLPFalsePositiveAnalysis</b></td>
      <td align="center">Identifies likely false positives by analyzing override rates and classifying policy effectiveness</td>
      <td>
        <ul>
          <li><b>PolicyName</b> (optional) — Filter to specific policy</li>
          <li><b>LookbackDays</b> (optional) — Days to analyze, default 30</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><b>DLPPolicyCoverageGaps</b></td>
      <td align="center">Detects workloads with no DLP policy coverage and flags critical gaps</td>
      <td>
        <ul>
          <li><b>LookbackDays</b> (optional) — Days to analyze, default 30</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><b>DLPHighRiskUsersAcrossWorkloads</b></td>
      <td align="center">Flags users with DLP violations across 2+ workloads and assigns risk scores (Critical/High/Medium/Low)</td>
      <td>
        <ul>
          <li><b>LookbackDays</b> (optional) — Days to analyze, default 14</li>
          <li><b>MinWorkloads</b> (optional) — Minimum workloads threshold, default 2</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><b>DLPAlertTrendAnalysis</b></td>
      <td align="center">Time-series DLP alert trend analysis by day, showing spikes and severity distribution</td>
      <td>
        <ul>
          <li><b>LookbackDays</b> (optional) — Days to analyze, default 30</li>
          <li><b>Workload</b> (optional) — Filter to specific workload</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><b>DLPLabelDowngradeRemoval</b></td>
      <td align="center">Tracks sensitivity label downgrades and removals that may indicate DLP bypass attempts</td>
      <td>
        <ul>
          <li><b>User</b> (optional) — UPN of the user</li>
          <li><b>LookbackDays</b> (optional) — Days to look back, default 14</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><b>DLPPolicyHealthCheck</b></td>
      <td align="center">Comprehensive policy health dashboard with match/override rates and Healthy/Unhealthy status</td>
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

- `Correlate all DLP alerts for user user@contoso.com across Exchange, Teams, SharePoint, OneDrive, and Endpoints in the last 14 days`
- `Which DLP policies have the highest false positive override rates?`
- `Identify DLP policy coverage gaps across all workloads — which workloads have no protection?`
- `Show me users with DLP violations across 2 or more workloads — who are the highest risk?`
- `Show me DLP alert trends over the last 30 days — are there any spikes?`
- `Which users have downgraded or removed sensitivity labels in the last 14 days?`
- `Run a DLP policy health check — show match rates, override rates, and effectiveness for all policies`

---

## RELATIONSHIP TO EXISTING PLUGINS

This plugin **complements** the existing `KQL_DataAnalyst.yml` plugin without overlap:

| Capability | `KQL_DataAnalyst.yml` (existing) | `KQL_DLPEnhanced.yml` (this plugin) |
|-----------|----------------------------------|--------------------------------------|
| Per-workload DLP alerts | ✅ 15 skills | — |
| Sensitivity file monitoring | ✅ 16 skills | — |
| DLP policy tuning suggestions | ✅ 5 skills | — |
| **Cross-workload correlation** | ❌ | ✅ |
| **False positive analysis** | ❌ | ✅ |
| **Policy coverage gaps** | ❌ | ✅ |
| **High-risk user scoring** | ❌ | ✅ |
| **Alert trend analysis** | ❌ | ✅ |
| **Label downgrade tracking** | ❌ | ✅ |
| **Policy health dashboard** | ❌ | ✅ |

---

For more information, see: [Microsoft Purview Data Loss Prevention](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp)

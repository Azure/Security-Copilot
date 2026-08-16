# Dual-signal containment gate (Security Copilot)

## Purpose

Stops Microsoft Security Copilot from treating **SnortML / GID 411 / EVE-high** as a classic IDS **signature true positive** and recommending ungated contain (block IP / isolate).

| Disposition | Copilot may recommend contain |
|---|---|
| ML-only (GID 411, `is_ml_only`, EVE-high without classic signature) | **No** — escalate / HITL |
| Classic signature high priority | Gated HITL only |
| Signature + ML corroboration | Gated HITL only |
| Unknown | **No** — fail closed |

Hard rule: ML confidence is not a signature true positive.

Pairs with:

- Azure Sentinel dual-signal analytics: https://github.com/Azure/Azure-Sentinel/pull/14925
- Firepower BlockIP Gate/Prove (auto-contain deny on ML-only): https://github.com/Azure/Azure-Sentinel/pull/14926
- Splunk SOAR `dual_signal_containment_gate`: https://github.com/phantomcyber/playbooks/pull/239

## Skills

1. **Classify dual-signal disposition** (GPT) — paste incident title/description; plugin returns disposition and whether contain is allowed.
2. **List SnortML ML-only events** (KQL) — `CommonSecurityLog` Cisco Firepower/FTD matching GID 411.
3. **List signature-high events** (KQL) — classic high-priority classifications excluding GID 411.

## Prerequisites

- [Security Copilot enabled](https://learn.microsoft.com/en-us/security-copilot/get-started-security-copilot)
- [Permission to upload custom plugins](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin)
- Microsoft Sentinel workspace with Cisco Firepower / Secure Firewall CEF via AMA (`CommonSecurityLog`) for the KQL skills. The GPT skill works with incident text alone.

## Upload

1. Download `DualSignalContainmentGate.yaml`.
2. In Security Copilot, **Sources** → custom plugins → upload the YAML.
3. Enter Tenant ID, Subscription ID, Resource Group, and Workspace name (used by the KQL skills).
4. Enable the plugin.

## Example prompts

- Should I contain this Firepower incident
- Classify this SnortML alert for containment
- Show SnortML ML-only Firepower events
- List classic IDS signature alerts that are not SnortML

## Author

Ahmed Hassan

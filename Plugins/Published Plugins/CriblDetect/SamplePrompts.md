# Sample Copilot prompts for the Cribl Detect plugin

These prompts are tuned to the skill descriptions in
`CriblDetect-Plugin.yaml`. Copy any of them into Microsoft Security
Copilot once the plugin is installed and the Cribl settings are filled
in.

## Rule inventory & coverage

- `Using Cribl Detect, list the detection rules mapped to MITRE T1078 (Valid Accounts) and tell me which are disabled.`
- `Which Cribl detections depend on firewall logs? Group by vendor and show rule severity.`
- `Show me every Cribl detection changed in the last 7 days — include who edited it and the current version number.`

## Alert triage

- `Give me a prioritized list of Cribl alerts from the last 24 hours: critical or high, status new, assigned to no one.`
- `Pull the Cribl alert with id alt_01HK3EXAMPLE and summarize the matched event, the rule that fired, and any correlated notable.`
- `Any Cribl alerts in the last 4 hours involving user alice@contoso.com or host web-prod-07?`

## Notable / incident review

- `List Cribl notables with risk score >= 70 from the past 48 hours and tell me who owns them.`
- `Open the notable not_01HK9EXAMPLE, show its timeline, and list every contributing alert id.`

## Ingest health (coverage sanity checks)

- `Are any Cribl data sources currently degraded or down? Include lastEventAt and dropped-events-in-last-hour.`
- `Which pipelines in the default_search worker group route Windows Security logs, and which detections depend on them?`
- `I'm asked why no Cribl alerts fired for lateral-movement last night — check if the authentication-log sources were healthy during that window.`

## Cross-skill investigations (chaining)

Copilot will chain multiple skills from a single prompt. Try:

- `Investigate user alice@contoso.com: list Cribl alerts for her from the last 72 hours, open the highest-severity one, and tell me which detection rule fired and whether its source pipelines were healthy at the time.`
- `For every critical Cribl detection enabled today, confirm the ingest sources feeding it are healthy and report any gaps.`

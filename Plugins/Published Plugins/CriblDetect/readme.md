# Cribl Detect

The **Cribl Detect** plugin lets Microsoft Security Copilot read detection
rules, alerts, notable events, and ingest-pipeline health from a Cribl
deployment (Cribl.Cloud or self-hosted). It helps analysts enrich
investigations with detection context, confirm telemetry coverage, and
reason about data quality — all without leaving Copilot.

Key insights the plugin exposes:

- Detection rule inventory with severity, MITRE ATT&CK mapping, data-source
  dependencies, and version history.
- Alerts and findings with time-window, severity, status, assignee, source
  rule, and entity filters.
- Correlated notable events (incidents) with risk score, timeline, and
  contributing alert ids.
- Ingest data sources and routing pipelines, including status, EPS, and
  dropped-event counters.

The plugin is read-only — none of its skills create, modify, or delete
Cribl resources. Learn more at <https://cribl.io/detect>.

## Pre-requisites

1. **Enable Cribl Detect** on your Cribl deployment. For Cribl.Cloud,
   open the Cribl Cloud portal, select your organization, and confirm
   that the Cribl Detect capability is enabled on at least one worker
   group (for example `default_search`). Note the **Base URL** of your
   deployment — it looks like `https://<workspace>.main.<org>.cribl.cloud`
   for Cribl.Cloud or `https://<leader-host>:9000` for self-hosted.

2. **Create a Cribl API bearer token** for a dedicated service account.
   The account must have read permission on **Detections**, **Alerts**,
   **Notables**, **Sources**, and **Pipelines**. In Cribl.Cloud go to
   **Settings → Access Management → Users** and generate an API key for
   the service account. See
   [Cribl API docs](https://docs.cribl.io/stream/api-tutorials/) for
   details.

3. **Enable the plugin in Microsoft Security Copilot**. In the Copilot
   session, open the **Sources** panel (plug icon) and locate the
   **Cribl Detect** plugin under custom plugins. Toggle it on.

4. **Configure the plugin**. When Copilot shows the configuration
   dialog, fill in:
   - **Cribl Base URL** — e.g. `https://default.main.your-org.cribl.cloud`
     (no trailing slash, no `/api/v1`).
   - **Cribl API Bearer Token** — the token from step 2. The plugin
     stores it encrypted (marked `IsSecret`) and never surfaces it to
     the model.
   - **Worker Group** _(optional)_ — defaults to `default_search`.

   Click **Save**. The plugin's skills now appear in the Copilot skill
   palette under `Cribl Detect`.

## Invoking the Plugin and Skills

Once the plugin is enabled and configured, users can invoke Cribl Detect in
two ways:

1. **Natural language** — type a question that references Cribl Detect in a
   Copilot prompt. Copilot picks the right skill. Example:
   `List enabled Cribl detections tagged with MITRE T1059.001 in the last 30 days.`
2. **Direct skill invocation** — type `/` in the prompt and pick the
   skill explicitly, e.g. `/ListAlerts` or `/GetNotable`.

## Skills & Prompts

1. **ListDetections** — Enumerate detection rules; filter by severity,
   enabled state, MITRE technique, data source, or free-text match.
   - **Example Prompt(s):**
     - `List enabled Cribl detections mapped to MITRE [T1078] and tell me which depend on firewall logs.`
     - `Which Cribl detections changed in the last 7 days? Include who edited them.`
   - **Inputs:** `severity`, `enabled`, `mitreTechnique`, `dataSource`,
     `q` (free-text), `limit`, `offset`.

2. **GetDetection** — Return the full definition of a single rule.
   - **Example Prompt(s):**
     - `Open Cribl detection [det_01HK3EXAMPLE] and summarize the logic, schedule, and MITRE mapping.`
   - **Inputs:** `detectionId`.

3. **ListAlerts** — Query alerts and findings produced by Cribl Detect rules.
   Defaults to the last 24 hours when no time window is supplied.
   - **Example Prompt(s):**
     - `Pull the top 20 Cribl alerts from the last 24 hours — critical or high, status new, unassigned.`
     - `Any Cribl alerts in the last 4 hours involving user [alice@contoso.com] or host [web-prod-07]?`
   - **Inputs:** `startTime`, `endTime`, `severity`, `status`, `assignee`,
     `ruleId`, `entity` (`type:value`), `limit`, `offset`.

4. **GetAlert** — Full alert context: matched event, enrichments, risk,
   linked notable.
   - **Example Prompt(s):**
     - `Open Cribl alert [alt_01HK3EXAMPLE] and summarize the matched event and the rule that fired.`
   - **Inputs:** `alertId`.

5. **ListNotables** — List correlated incidents, filter by risk score, status,
   assignee, time window, and entity.
   - **Example Prompt(s):**
     - `List Cribl notables with risk score >= [70] from the past 48 hours and tell me who owns them.`
   - **Inputs:** `startTime`, `endTime`, `severity`, `status`, `assignee`,
     `minRiskScore`, `entity`, `limit`, `offset`.

6. **GetNotable** — Notable timeline plus contributing alert ids and
   investigation notes.
   - **Example Prompt(s):**
     - `Open Cribl notable [not_01HK9EXAMPLE], show its timeline and list every contributing alert id.`
   - **Inputs:** `notableId`.

7. **ListDataSources** — Confirm ingest coverage: source type, status, EPS,
   pipeline.
   - **Example Prompt(s):**
     - `Are any Cribl data sources currently degraded or down? Include lastEventAt and dropped events.`
   - **Inputs:** `type`, `status`, `limit`, `offset`.

8. **GetDataSource** — Deep-dive on a single source (lastEventAt,
   dropped events, backpressure).
   - **Example Prompt(s):**
     - `Show me the recent health of Cribl source [src_01HK...] — is it dropping events?`
   - **Inputs:** `sourceId`.

9. **ListPipelines** — Routing pipelines and the detections that depend
   on them.
   - **Example Prompt(s):**
     - `Which pipelines in worker group [default_search] route Windows Security logs, and which detections depend on them?`
   - **Inputs:** `limit`, `offset`.

### Cross-skill investigations

Copilot will chain skills from a single prompt. Try:

- `Investigate user [alice@contoso.com]: list Cribl alerts for her from the last 72 hours, open the highest-severity one, and tell me which detection rule fired and whether its source pipelines were healthy at the time.`
- `For every critical Cribl detection enabled today, confirm the ingest sources feeding it are healthy and report any gaps.`

## Frequently Asked Questions (FAQ)

1. **I keep getting `401 Access denied` on every call.**
   The bearer token is invalid, revoked, or belongs to a different
   tenant. Reissue the token in Cribl **Access Management**, update the
   **Cribl API Bearer Token** field in the plugin configuration, and
   save.

2. **Detections work but `/alerts` returns `403`.**
   The service account is missing the Detect-reader role bundle. In
   Cribl, grant the service account read permission on **Alerts**,
   **Notables**, and **Detections**, then retry.

3. **I get `404` on a specific source or detection id.**
   The id belongs to a different worker group. Set the **Worker Group**
   plugin setting to match (for example `default_search`), or ask the
   skill to use that group explicitly.

4. **Copilot replies "I can't query Cribl right now".**
   The configured **Cribl Base URL** has a trailing slash or includes
   `/api/v1`. Set it to the host only — e.g.
   `https://default.main.your-org.cribl.cloud`.

5. **Rate-limit (`429`) during large queries.**
   Narrow the time window or ask for a smaller page size (`limit=25`).
   The plugin surfaces the `Retry-After` header so Copilot can back off.

6. **Important:** The plugin is **read-only**. It does not create,
   modify, or delete Cribl resources. Use a dedicated service account
   with the minimum read-only role bundle on the four resource families
   above and rotate the token on your normal cadence.

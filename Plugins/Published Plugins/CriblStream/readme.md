# Cribl Stream Plugin for Security Copilot
**Author: Kam Amir**
**Publisher: Microsoft + Cribl**

The **Cribl Stream Plugin for Security Copilot** empowers security and IT teams to seamlessly query their Cribl Stream environments. This integration provides instant visibility into configured sources and destinations, their operational status, and enables comprehensive gap analysis for detection coverage within SIEM platforms.

## Features

- **Source \& Destination Inventory**
    - [Instantly list all configured sources (e.g., Splunk, HTTP, Kafka) and destinations (e.g., SIEM, data lakes, cloud storage) within your Cribl Stream instance][^4].
- **Operational Health Monitoring**
    - [Check the health and operational status of all sources and destinations to ensure data is flowing as expected][^1].
- **Detection Gap Analysis**
    - [Identify coverage gaps in your SIEM by mapping available data sources against required detection use cases, helping you close blind spots in your security monitoring][^2].
- **Natural Language Queries**
    - Leverage Security Copilot’s natural language interface to ask questions about your Cribl Stream setup, such as:
        - “What sources are configured and are they healthy?”
        - “Which destinations are currently failing?”
        - “Do I have coverage for endpoint logs in my SIEM?”.
- **Actionable Recommendations**
    - Receive best-practice guidance for optimizing data flows, improving detection coverage, and remediating issues—all powered by AI.


## How It Works

1. **Connect Security Copilot to Cribl Stream**
    - Authenticate and connect your Security Copilot environment to one or more Cribl Stream instances.
2. **Query Your Environment**
    - Use natural language or pre-built prompts to request inventories, health checks, or gap analyses.
3. **Review Results and Take Action**
    - View real-time status dashboards and actionable insights, and receive recommendations for remediation or optimization.

## Example Use Cases

- **Onboarding New Data Sources**
    - [Instantly verify that new log sources (e.g., firewall, endpoint, cloud) are properly configured and flowing to your SIEM][^10].
- **Incident Response**
    - Quickly determine if critical telemetry (e.g., authentication logs, network flows) is being ingested and available for investigation.
- **Compliance \& Audit**
    - Generate reports showing which data sources are covered and identify any compliance-relevant gaps.
- **Continuous Improvement**
    - Regularly assess your detection coverage and receive AI-driven recommendations for expanding or optimizing your data pipeline.


## Getting Started

1. **Install the Plugin**
    - Deploy the Cribl Stream Plugin for Security Copilot via your Security Copilot marketplace or integration settings.
2. **Configure Connection**
    - Provide credentials and endpoint information for your Cribl Stream instances.
3. **Enable Permissions**
    - Ensure the plugin has read access to Cribl Stream configuration and health APIs.
4. **Start Querying**
    - Use Security Copilot’s chat interface or dashboards to begin querying your Cribl Stream environment.

## Requirements

- Cribl Stream v4.0 or higher
- Security Copilot with plugin integration enabled
- Appropriate API credentials with read permissions on Cribl Stream

## Resources \& Documentation

- [Cribl Stream Documentation][^5]
- [Cribl Copilot Overview][^2]
- [Cribl CoPilot Demo Video][^3]
- [Security Copilot Integration Guide][^8] 
- [Cribl Sandbox Create a source][^6]
- [Cribl Sandbox Query Assistance][^7]

## Support

For troubleshooting or feature requests, please contact your Cribl or Security Copilot support representative.

*Empower your security operations with unified visibility and actionable insights—directly from your Cribl Stream environment.*

[^1]: https://cribl.io/products/copilot/

[^2]: https://docs.cribl.io/copilot/

[^3]: https://www.youtube.com/watch?v=oB7uU8DRnSA

[^4]: https://docs.cribl.io/stream/sources/

[^5]: https://docs.cribl.io/stream/

[^6]: https://sandbox.cribl.io/coursedocs/overview-copilot/docs/creating-a-source-dest

[^7]: https://sandbox.cribl.io/coursedocs/overview-copilot/docs/query-assistance

[^8]: https://learn.microsoft.com/en-us/copilot/security/
# User Manual: 1Password Plugin for Microsoft Copilot for Security

## Introduction
This manual provides detailed instructions for implementing, configuring, and using the 1Password plugin with Microsoft Copilot for Security. This integration enables security teams to analyze and investigate 1Password audit data through Microsoft Sentinel, allowing for enhanced security monitoring, threat detection, and incident response.

## Table of Contents
1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Implementation Steps](#implementation-steps)
4. [Configuration Guide](#configuration-guide)
5. [Usage Instructions](#usage-instructions)
6. [Advanced Usage](#advanced-usage)
7. [Security Considerations](#security-considerations)
8. [Troubleshooting](#troubleshooting)
9. [Frequently Asked Questions](#frequently-asked-questions)
10. [Additional Resources](#additional-resources)

## Overview
The 1Password plugin for Microsoft Copilot for Security leverages audit data collected by Microsoft Sentinel to provide security teams with insights into 1Password usage, potential security events, and anomalous behaviors. This plugin does not retrieve secrets or credentials from 1Password, but rather analyzes the audit logs and events to enhance security monitoring and incident response capabilities.

## Prerequisites
Before implementing the 1Password plugin for Microsoft Copilot for Security, ensure you have:
- A 1Password Enterprise subscription (Business or Enterprise plan)
- Microsoft Sentinel deployed and configured in your environment
- Microsoft Sentinel data connector for 1Password properly configured and ingesting data
- Administrative access to your Microsoft Copilot for Security environment
- Microsoft Sentinel workspace linked to Microsoft Copilot for Security
- Familiarity with KQL (Kusto Query Language) for creating and modifying queries

## Implementation Steps

### Step 1: Configure 1Password Audit Logging
To enable audit logging in 1Password, follow the [Events Reporting documentation](https://support.1password.com/events-reporting/) or complete these steps:

1. Sign in to 1Password.com as an owner or administrator
2. Click **Integrations** in the sidebar
3. Click **Directory** at the top of the page
4. Find the **Microsoft Sentinel** integration and click **Set Up**
5. Enter a name for your integration (e.g., "Microsoft Sentinel Connector")
6. Choose between:
   - **Send events from all vaults** to report events for your entire account
   - **Choose vaults** to select specific vaults for event reporting
7. Click **Add Integration**
8. Save the bearer token that's displayed - you'll need this to configure the Microsoft Sentinel connector
9. Follow the [1Password Sentinel integration guide](https://support.1password.com/1password-sentinel-integration/#step-2-activate-the-1password-serverless-connector) to activate the serverless connector
10. Configure the appropriate log retention policies
11. Verify that user activities, authentication events, and admin actions are being logged


For detailed configuration options and troubleshooting, refer to the [Events Reporting setup guide](https://support.1password.com/events-reporting/#step-1-set-up-an-events-reporting-integration).
2. Navigate to the Security settings
3. Ensure comprehensive audit logging is enabled
4. Configure the appropriate log retention policies
5. Verify that user activities, authentication events, and admin actions are being logged

### Step 2: Set Up Microsoft Sentinel Connector for 1Password
1. Access your Microsoft Sentinel workspace
2. Navigate to the Data Connectors section
3. Locate and select the 1Password data connector
4. Follow the configuration wizard to connect to your 1Password environment
5. Validate that audit logs are being successfully ingested into Microsoft Sentinel

### Step 3: Install and Configure the Plugin
1. Access your Microsoft Copilot for Security admin portal
2. Navigate to the Plugin Management section
3. Select "Add New Plugin" and choose the community plugin option
4. Upload the 1Password plugin package or specify its repository location
5. Configure the plugin to connect to your Microsoft Sentinel workspace

## Configuration Guide

### Required Parameters
Configure the following parameters for the plugin to function correctly:

1. **Microsoft Entra Tenant ID**
   - The unique identifier of your Microsoft Entra environment
   - Format: `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`

2. **Subscription ID**
   - The unique identifier of the Azure Subscription of Microsoft Sentinel
   - Format: `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`

3. **ResourceGroup Name**
   - This is the resource group name that security copilot will use for sentinel.
    
4. **Workspace Name**    
   - This is the  workspace name that security copilot will use for sentinel.

### Configuration Methods
1. **Plugin Configuration Portal**
   - Configure settings directly in the Microsoft Copilot for Security plugin interface
   - Specify workspace connection parameters
   - Test connectivity before saving

## Usage Instructions

### Basic Usage
After successful installation and configuration, the 1Password plugin integrates seamlessly with Microsoft Copilot for Security's natural language interface. You can analyze 1Password audit data by simply asking Copilot questions during your security workflows.

### KQL Integration
The 1Password plugin leverages KQL (Kusto Query Language) to query Microsoft Sentinel data. This enables precise analysis of 1Password audit logs:

```kql
// Example KQL query to analyze failed login attempts
OnePasswordEventLogs_CL
| where EventType == "signinattempts" 
| where ResultType == "fail"
| summarize FailedAttempts = count() by tostring(target_user.name), tostring(client.ip_address), bin(TimeGenerated, 1h)
| where FailedAttempts > 5
```

### Interaction Methods
å
#### 1. Natural Language Queries
Use conversational language to analyze 1Password audit data:

* "Show me all failed login attempts in 1Password over the past week"
* "Who accessed sensitive vaults in 1Password outside of business hours?"
* "Has anyone created new shared vaults in the last month?"

#### 2. Structured Commands
For more precise control, use structured command syntax:

* `analyze-events -type:"item.view" -timeframe:"last 7 days" -user:"admin"`
* `detect-anomalies -dataset:"authentication" -baseline:"30 days"`
* `report-activity -vault:"Finance" -action:"create,delete,modify"`

#### 3. Workflow Integration
Include 1Password audit analysis as part of larger security workflows:

* "Investigate this user account and check for unusual 1Password activity"
* "Analyze login patterns across our SSO providers including 1Password"
* "Generate a compliance report showing all access to regulated data in 1Password"

### Response Formatting
The plugin formats responses to provide clear security insights:

* **Event Timelines**: Chronological view of related security events
* **User Activity Profiles**: Aggregated view of user behaviors
* **Anomaly Highlighting**: Clear identification of outlier events
* **Visual Analytics**: Charts and graphs for pattern recognition

## Advanced Usage

### Security Incident Investigation
The plugin enables advanced investigation of security incidents involving 1Password usage:

```
# Example Investigation Workflow
1. Receive alert about suspicious access to sensitive vault
2. Query 1Password audit logs for all actions by the flagged user
3. Analyze access patterns and compare to historical baseline
4. Correlate with other security telemetry (network logs, endpoint data)
5. Generate comprehensive incident timeline and recommended actions
```

## Security Considerations

### Data Access Controls
The 1Password plugin for Microsoft Copilot for Security implements careful data access controls:
- Only analyzes audit log data, not actual credentials or secrets
- Leverages Microsoft Sentinel's existing security model and access controls
- Uses TLS encryption for all communications between components
- Respects workspace access permissions configured in Microsoft Sentinel

### Security Best Practices
- **Role-Based Access Control**: Limit access to 1Password audit data in Microsoft Sentinel
- **Log Data Classification**: Properly classify and handle audit data according to sensitivity
- **Result Filtering**: Configure data minimization practices for query results
- **Workspace Isolation**: Maintain proper separation between production and development workspaces
- **Alert Configuration**: Set up appropriate alerts based on 1Password audit analysis

### Common Issues and Resolutions

#### Data Ingestion Issues
| Issue | Possible Causes | Resolution Steps |
|-------|----------------|-----------------|
| Missing Audit Data | Connector misconfiguration, Ingestion pipeline issues | 1. Verify Microsoft Sentinel connector status<br>2. Check 1Password audit logging settings<br>3. Review data connector logs<br>4. Validate Log Analytics agent functionality |
| Data Delay | Ingestion latency, High data volume, Processing bottlenecks | 1. Check ingestion pipeline status<br>2. Review Microsoft Sentinel health metrics<br>3. Optimize data collection rules<br>4. Consider dedicated capacity for critical data |

#### Query Issues
| Issue | Possible Causes | Resolution Steps |
|-------|----------------|-----------------|
| Query Timeout | Complex queries, Large data volume, Resource constraints | 1. Optimize query complexity<br>2. Add appropriate filters<br>3. Use time-based partitioning<br>4. Consider materialized views |
| Schema Mismatch | Custom field mappings, Schema evolution, Parser errors | 1. Review schema definitions<br>2. Update field mappings<br>3. Check for data format changes<br>4. Update custom parsers if needed |

#### Plugin Access Issues
| Feature | Common Problems | Troubleshooting Steps |
|---------|----------------|---------------------|
| Workspace Access | Permission issues, Misconfigured workspace ID | 1. Verify workspace access permissions<br>2. Check workspace connection string<br>3. Review Microsoft Copilot for Security configuration<br>4. Validate Microsoft Entra ID permissions |
| KQL Functions | Function registration failure, Syntax errors, Execution timeout | 1. Check function registration status<br>2. Validate KQL syntax<br>3. Review function permissions<br>4. Optimize function logic |

### Performance Optimization
- Use efficient KQL patterns and avoid cross-joins on large datasets
- Implement appropriate time filters to limit data processing
- Consider materialized views for frequently run analytical queries
- Monitor query performance and optimize resource-intensive operations

## Frequently Asked Questions

**Q: What 1Password plans are compatible with this plugin?**
A: The plugin works with any 1Password Business or Enterprise plan that supports audit logging and can be integrated with Microsoft Sentinel. Teams, Business, and Enterprise plans are all compatible when properly configured.

**Q: Does the plugin access actual credentials or secrets from 1Password?**
A: No, the plugin only analyzes audit data that has been ingested into Microsoft Sentinel. It does not access, retrieve, or expose any actual credentials or secrets stored in 1Password.

**Q: What types of 1Password events can be analyzed with this plugin?**
A: The plugin can analyze all audit events captured by 1Password and ingested into Microsoft Sentinel, including user authentication, item access, administrative actions, vault management, and security settings changes.

**Q: How current is the audit data available through the plugin?**
A: Data freshness depends on your Microsoft Sentinel ingestion configuration. Typically, there is a slight delay between events occurring in 1Password and their availability in Microsoft Sentinel, usually ranging from minutes to an hour.

**Q: How far back can the plugin analyze 1Password audit data?**
A: The plugin can analyze data as far back as your Microsoft Sentinel retention policy allows, which is typically 90 days by default but can be extended based on your configuration and licensing.

**Q: Can I create custom detection rules using this plugin?**
A: Yes, the plugin supports the creation and management of custom detection rules based on 1Password audit patterns, allowing organizations to implement security controls specific to their environment.

**Q: What happens if the Microsoft Sentinel connector stops ingesting data?**
A: The plugin will continue to function but will only be able to analyze historical data up to the point when ingestion stopped. It includes diagnostic capabilities to detect and alert on ingestion issues.

**Q: Does the plugin support cross-platform audit analysis?**
A: Yes, you can correlate 1Password audit data with other security telemetry in Microsoft Sentinel to perform cross-platform security analysis and investigations.

**Q: Can the plugin detect insider threats or compromised accounts?**
A: Yes, the plugin includes behavior analytics capabilities that can help identify unusual patterns that might indicate insider threats or compromised 1Password accounts based on audit log patterns.

## Additional Resources

### Documentation
- [1Password Business Documentation](https://support.1password.com/business/)
- [Microsoft Sentinel 1Password Data Connector](https://learn.microsoft.com/en-us/azure/sentinel/data-connectors/1password)
- [Microsoft Copilot for Security Plugin Framework](https://learn.microsoft.com/en-us/security-copilot/plugins-overview)
- [KQL Query Language Reference](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/query/)

### Technical Resources
- [KQL Functions Reference for 1Password Audit Analysis](plugin-documentation/kql-reference.md)
- [Audit Schema Documentation](plugin-documentation/audit-schema.pdf)
- [Sample Security Detection Rules](https://github.com/microsoft/securitycopilot-workflows/1password)
- [Microsoft Sentinel Workbooks for 1Password](https://github.com/microsoft/sentinel-workbooks/1password)

### Training and Support
- [Video Tutorial: Setting Up the 1Password Plugin with Microsoft Sentinel](https://aka.ms/copilot-security/tutorials)
- [Interactive Training Lab: Advanced KQL for Audit Analysis](https://aka.ms/copilot-security/labs)
- [Community Forum: Microsoft Copilot for Security](https://techcommunity.microsoft.com/t5/security-copilot/bd-p/SecurityCopilot)
- [1Password Security Resources](https://support.1password.com/security/)

### Updates and Releases
- [Plugin Release Notes](plugin-documentation/releases.md)
- [Sentinel Data Connector Updates](https://learn.microsoft.com/en-us/azure/sentinel/whats-new)
- [1Password Audit Log Format Changes](https://developer.1password.com/changelog/)

---

*© 2025 Microsoft Corporation. All rights reserved.*  
*1Password is a registered trademark of AgileBits Inc.*

*This documentation is provided for informational purposes only and is subject to change without notice. Microsoft makes no warranties, express or implied, with respect to the information provided here.*

*For questions, technical support, or to report security vulnerabilities, please contact your Microsoft security representative or visit the Security Copilot support portal.*

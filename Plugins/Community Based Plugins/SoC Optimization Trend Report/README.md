# Copilot for Security Custom Plugin - KQL - Get insights into current SoC usage and metrics for trend analysis

#### Copilot for Security Plugin to get insights into current SoC usage and metrics for trend analysis

### Pre-requisites

* [Copilot for Security Enabled](https://learn.microsoft.com/en-us/security-copilot/get-started-security-copilot#onboarding-to-microsoft-security-copilot)
* [Access to upload custom plugins](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#managing-custom-plugins)

### Instructions
#### Upload the Custom Plugin

1. Obtain the file [SoCOptimizationTrend-manifest.yaml](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/SoC%20Optimization%20Trend%20Report/SoCOptimizationTrend-manifest.yaml) from this directory.
2. [Upload the custom plugin](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#add-custom-plugins) and verify it's activated.

![CopilotForSecurity](https://learn.microsoft.com/en-us/security-copilot/media/add-plugin-button.png)

### Plugin Utilization

Here's some sample queries you can utilize to trigger this plugin
Note: you can use the keyword 'SoC' in your queries

* Using the Incident Count by High Severity by month/year, tell about incidents from the month of 4 and year 2024
* Using SOC Mean Time to Response with Tasks by month/year, show me the results from the month of 4 and year 2024
* Using SOC incidents without automation by severity and month/year show me the results from the month 4 and year 2024 with High severity
* Please take a look at the sample promptbook located [here](https://github.com/Azure/Copilot-For-Security/blob/main/Promptbook%20samples/SoC%20Optimization%20Trend%20Report.md)

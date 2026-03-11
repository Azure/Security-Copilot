# Trellix Detection as a Service API Plugin

#### Copilot for Security Plugin to retrieve sandbox reports for uploaded files and URLs using the Trellix Detection as a Service API

### Pre-requisites

* [Copilot for Security Enabled](https://learn.microsoft.com/en-us/security-copilot/get-started-security-copilot#onboarding-to-microsoft-security-copilot)
* [Access to upload custom plugins](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#managing-custom-plugins)
* [API Key](https://fireeye.dev/docs/detection-on-demand/dod-portal/#api-key-management) from dod-portal.marketplace.apps.fireeye.com.

### Instructions
#### Upload the Custom Plugin

1. Obtain the file [TrellixDoD.yaml](https://raw.githubusercontent.com/alfonso-greenbrook/Copilot-For-Security-Fork/main/Plugins/Community%20Based%20Plugins/Trellix%20Detection%20as%20a%20Service/TrellixDoD.yaml) from this directory.
2. [Upload the custom plugin](https://learn.microsoft.com/en-us/security-copilot/manage-plugins?tabs=securitycopilotplugin#add-custom-plugins) and verify it's been activated.
3. After the plugin has been uploaded, put in your [DoD API Key](https://learn.microsoft.com/en-us/security-copilot/plugin_api#configure-authentication-1).

![CopilotForSecurity](https://learn.microsoft.com/en-us/security-copilot/media/add-plugin-button.png)

#### Utilization of the plugin
- **getReport:** Get single report - this fetches the results of a single file submission, known as a report.
- **getReportsMD5:** Get a single report by md5 or sha256 hash - this fetches the latest results for file submission with the provided md5 or sha256 hash.
- **getPresignedUrl:** Get a pre-signed URL - this fetches a pre-signed URL link to a browser-viewable report.
- **getHealth:** The health status of service, subscription and API key - this provides the health status of Service, subscription and API key
- **getHashById:** Get hash analysis results - this fetches the results of a file submission by its MD5 hash.
- **getSHA256HashById:** Get md5 or sha256 hash analysis results - this fetches the results of a file submission by its md5 or sha256 hash.
- **getArtifacts:** Get artefacts for given report_id - this fetches artefacts, like a screenshot gif file, for the given report_id
- **getTelemetry:** Pull results metadata in batches - this fetches metadata of completed submissions for a given time interval. API also support pagination if number of records for given time period are more than 1000.

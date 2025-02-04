![Defender Experts Logo](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Microsoft%20Security%20Experts/Microsoft%20Defender%20Experts%20Plugin/Images/LogoDex.png)

# Introduction

Welcome to the **Defender Experts for Hunting Plugin**! This plugin elevates your cybersecurity posture by providing proactive threat hunting across your entire organizational environment—including Office 365, cloud applications, and identity platforms. Leveraging insights from Microsoft's seasoned security experts, our plugin empowers your team to swiftly detect and respond to advanced threats.

# Overview

Defender Experts for Hunting is a proactive threat hunting service that extends beyond traditional endpoints to encompass Office 365, cloud applications, and identity platforms. Our seasoned security experts actively search for threats across your organization's environment, investigating anomalies and providing detailed contextual alerts along with clear remediation instructions to enable swift and effective responses.

We delve deep to uncover advanced threats and assess the scope and impact of malicious activities, particularly those involving human adversaries or hands-on-keyboard attacks. A key deliverable of our service is sharing the advanced hunting queries developed during our analyses, empowering your security team to proactively search for similar threats and enhance risk mitigation.

Additionally, through Copilot for Security, we integrate our findings back into automated tools to improve their capacity for discovery and prioritization, ensuring your defenses continuously evolve to meet emerging security challenges.

# Prerequisites

- **Copilot for Security Capacity**
- **Microsoft Defender for Endpoint**

> **Note:** This plugin is KQL-based and leverages advanced hunting queries to scan across Defender tables for risky behavior and suspicious activities. The tables include `CloudAppEvents`, `EmailEvents`, `EmailAttachmentInfo`, `AADSignIn`, and more.

# Step-by-Step Guided Walkthrough

In this guide, we will provide high-level steps to get started using the new tooling. We will start by adding the custom plugin.

1. **Go to Security Copilot**

    ![Main Page DEX](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Microsoft%20Security%20Experts/Microsoft%20Defender%20Experts%20Plugin/Images/mainpageDex.png)


2. **Download the Defender Experts plugin from GitHub**

3. **Select the plugins icon in the bottom left corner**

4. **Under Custom upload, select _Upload plugin_**

    ![Upload Plugin DEX](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Microsoft%20Security%20Experts/Microsoft%20Defender%20Experts%20Plugin/Images/uploadpluginDex.png)


5. **Select the Copilot for Security plugin and upload the DEX Plugin**

    ![Upload Plugin DEX](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Microsoft%20Security%20Experts/Microsoft%20Defender%20Experts%20Plugin/Images/uploadpluginDex.png)


6. **Click _Add_**

7. **Under Custom, you will see the plugin**

    ![View Plugin DEX](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Microsoft%20Security%20Experts/Microsoft%20Defender%20Experts%20Plugin/Images/ViewPluginDex.png)


8. **The custom package contains the following prompts:** **Under DEX, you will find the following**

    ![Skills DEX](https://github.com/Azure/Copilot-For-Security/blob/main/Plugins/Community%20Based%20Plugins/Microsoft%20Security%20Experts/Microsoft%20Defender%20Experts%20Plugin/Images/SkillsDex.png)


Let us get started using this together with the Copilot for Security capabilities.

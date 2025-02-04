![Security Copilot Overview](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)
# Microsoft Security Copilot Logic Apps
Documentation : https://learn.microsoft.com/en-us/copilot/security/connector-logicapp

The Microsoft Security Copilot Logic Apps connector allows you to call into Microsoft Security Copilot from a Logic Apps workflow. This document provides an introduction to the new connector actions you can leverage as well as sample use cases you can deploy to automate investigations such as on Sentinel incidents, email phishing, and others.

The first iteration of the Logic Apps connector exposes two actions:

- Evaluate Prompt - Given a natural language prompt, this action will invoke a new evaluation within Microsoft Security Copilot and return the output to your logic app workflow. The user can provide an optional sessionId, which will include relevant session context for the evaluation performed. If the sessionId is omitted, the action will create a new session.

- Evaluate Direct Skill - Given a natural language prompt, a skill name, and the skill required inputs, invoke a new evaluation and return its output. Use this action when you know the exact Microsoft Security Copilot skill that is required for the task. This action also allows the option to provide a sessionId.

Both the "Evaluate Prompt" and "Evaluate Direct Skill" actions allow the user to set an optional sessionId to execute the evaluation within the context of an existing session. If omitted, a new session will be created for the investigation.

# What you will achieve here :
Here you will find an array of differnt playbooks aligned with CyberSec scenarios that aim to acheive the following :
- Enhanced threat detection: Automation can swiftly analyze vast amounts of security data to detect threats that might otherwise go unnoticed.
- Proactive response: Automated playbooks enable instant responses to security incidents, reducing the window of opportunity for attackers.
- Continuous monitoring: Automation allows for real-time monitoring of security events, enabling rapid identification and mitigation of potential risks.
- Reduced human error: By automating repetitive tasks, the risk of human error in cybersecurity operations is significantly minimized.
- Improved incident response: Automated playbooks facilitate coordinated and consistent responses to security incidents, ensuring efficient resolution.
- Scalability: Automation enables cybersecurity operations to scale efficiently, keeping pace with growing volumes of threats and data.
- Compliance automation: Automated processes help ensure adherence to cybersecurity regulations and standards, reducing compliance risks.
- Resource optimization: By automating routine tasks, cybersecurity professionals can focus on strategic initiatives and proactive threat hunting.

**Disclaimer**: Please be aware that the logic apps provided are examples intended for use with Security Copilot. Users are encouraged to customize these samples to meet their specific requirements. These should serve as guidelines and inspiration for creating tailored logic apps for ones own use

**Technical Disclaimer: Logic Apps, SCU Usage, and Best Practices**

**Attention Customers!**

When utilizing Logic Apps on Copilot, please be aware that it may result in increased consumption of Secure Compute Units (SCUs). We recommend closely monitoring SCU usage to optimize resource management. 

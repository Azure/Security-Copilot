# Copilot for Security Custom Plugin - SOC Optimization in Sentinel

SOC Optimization is a feature of Microsoft Sentinel that provides the recommendations for optimal data utilization and attack detection.
This custom plugin connects to Azure REST APIs to get the details of all the recommendations delivered by SOC Optimization.

### Prerequisites:
* This plugin is useful when you have a Microsoft Sentinel workspace

### Note: 
The code in this custom plugin is also an example on how to query, from Copilot for Security, any Azure REST API. Implement the same strategy to develop custom plugins that gather comprehensive information about any Azure component (like Log Analytics, VMs, etc.) that you think would be beneficial for your Copilot for Security users in their investigations and promptbooks. 

### Instructions: 
1. Download the "manfiest" YAML file in this folder. Save it locally
3. Add the custom plugin in Copilot for Security by uploading the manfiest YAML file (see [Manage plugins in Microsoft Copilot for Security](https://learn.microsoft.com/en-us/copilot/security/manage-plugins?tabs=securitycopilotplugin))

### References:
* [SOC optimization - unlock the power of precision-driven security management](https://techcommunity.microsoft.com/t5/microsoft-sentinel-blog/soc-optimization-unlock-the-power-of-precision-driven-security/ba-p/4130589)
* [Azure REST API reference](https://learn.microsoft.com/en-us/rest/api/azure/)

### Sample prompts:
Is my Sentinel environment configured appropiately with reference to threat coverage and data utilization?
![Img1](./Images/1.jpeg)

Are there any tables in Sentinel that need to be optimized for better utilization? Please list only the optimizations related to data value in tables. Do not include recommendations related to threat coverage.
![Img2](./Images/2.jpeg)

Give me all the details related to the evidence that our coverge, in Sentinel, against AiTM (Adversary in the Middle) attacks is not yet optimal
![Img3](./Images/3.jpeg)

By looking at the data retrieved from SOC Optimization, with reference to our coverage, in Sentinel, against AiTM (Adversary in the Middle) give me all available suggestions
![Img4](./Images/4.jpeg)

By looking at the suggestions offered by SOC Optimization, is there any artifact from the Content Hub in Sentinel that we can add to leverage data collected from our Cisco SEG, in order to improve our coverage agaist AiTM (Adversary in the Middle) threats? List me ALL and ONLY the artifacts that, by name, refers to Cisco SEG
![Img5](./Images/5.jpeg)
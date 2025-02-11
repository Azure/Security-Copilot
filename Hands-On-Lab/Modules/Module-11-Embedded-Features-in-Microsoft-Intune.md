<h1> Module 11 -Embedded Features in Microsoft Intune</h1>
<h4>🎓 Level: 200 (Advanced)<h4>
<h4>⌛ Estimated time to complete this lab: 30 minutes</h4>
<h2>Objectives </h2>
</p></p>
This module showcases some powerful features that become available in Microsoft Intune when Microsoft Security Copilot is enabled. Features focus on improving device posture meaning ensuring you are running the most secure build, understanding details about assets, quickly understanding the impact of existing policies, comparing devices and other useful details obtained at machine speed. 
</p></p>
<h4>Note: Similar outcomes can be accomplished using the standalone Microsoft Security Copilot dashboard as seen within the embedded experience. </h4>
<h2>Prerequisites </h2>
</p></p>
* You have Microsoft Security Copilot enabled
</p></p>
* You have added the necessary amount of SCU's to complete the Additional Modules (15 SCUs if continuing directly on from the Beginner and Advanced Modules or 8 if you have re-installed Security Copilot).
</p></p>
* You must have access to Microsoft Intune in the same tenant as Microsoft Security Copilot so Security Copilot features are available in Microsoft Intune  
</p></p>
<h2>Exercise 1: Accessing Microsoft Intune and analyzing a device</h2>
</p></p>
At this point, we assume you have completed step one and have at least read only access to Microsoft Intune, which exists in the same tenant as Microsoft Security Copilot. 
</p></p>
1: Go to Intune.microsoft.com. This will bring you to the main Intune dashboard. Let’s click devices on the left to take us to the Device overview page. On that page, choose your Windows devices. 
<img width="1012" alt="intune2" src="../Images/intune1.png">
</p></p>
2: Now pick a system and click it. I’m choosing one that is out of compliance. 
</p></p>
<h4>Note: You could just hover next to a device and you will see a Security Copilot button popup allowing you to access the AI-generated insights on that device. </h4>
</p></p>
<img width="885" alt="Intune3" src="../Images/intune2.png">
</p></p>
3: Now click Explore this device. You may also see Copilot (preview) pop up to advertise what we are about to get into. 
</p></p>
<img width="821" alt="Intune4" src="../Images/intune3.png">
</p></p>
4: If you have the overview pop up, click "not now". You should see some Copilot AI-generated insights available to choose to quickly understand the device of interest. 
</p></p>
<img width="407" alt="Intune5" src="../Images/intune4.png">
</p></p>
5: Let’s try out "Summarize this device". It should take a few seconds and generate a nice summary of the current state of this device. Noice there are other options on the bottom such as seeing what is installed on this device.
</p></p>
<img width="383" alt="Intune6" src="../Images/intune5.png">
</p></p>
6: Try clicking what apps are installed. It will ask the App type, which for my example, I’m choosing "Managed apps" and clicking submit. 
</p></p>
<img width="403" alt="Intune7" src="../Images/intune6.png">
</p></p>
<h2>Exercise 2: Analyzing error code</h2>
</p></p>
7: Click the x to close out the pop up and select "Analyze error code"
</p></p>
<img width="771" alt="Intune8" src="../Images/intune7.png">
</p></p>
8: Once again, you may see the Copilot pop up advertising what we are about to get into. Choose to Dismiss that and you will find an Error Code bar you can fill in to analyze a error code. This is where you can put in error codes to analyze. 
</p></p>
<img width="431" alt="Intune9" src="../Images/intune8.png">
</p></p>
9: When you submit an error code, you will get a quick explanation of what it is. This is a much better approach to understanding error messages vs searching the Internet for an explanation. 
</p></p>
<img width="386" alt="Intune10" src="../Images/intune9.png">
</p></p>
<h2>Exercise 3: Comparing devices</h2>
</p></p>
10: Now let’s close that and move on to the next topic, which is using AI to quickly compare two devices. Click "Compare to another device"
</p></p>
<img width="706" alt="Intune11" src="../Images/intune10.png">
</p></p>
11: This will bring up a window asking for another device to compare against as well as what you are comparing for. Try putting in another device ID and choose an item to compare against. For my example, I'm going to compare "Configuration profiles". 
</p></p>
<img width="369" alt="Intune12" src="../Images/intune11.png">
</p></p>
<h2>Exercise 4: Comparing devices with AI help</h2>
</p></p>
12: Now let’s close the pop up and move on to the next topic. Click on the left devices. 
</p></p>
<img width="539" alt="Intune13" src="../Images/intune12.png">
</p></p>
13: Now click Configuration
</p></p>
<img width="630" alt="Intune14" src="../Images/intune13.png">
</p></p>
14: Now let’s choose to build a new Policy by clicking "Create". Then click "New Policy"
</p></p>
<img width="640" alt="Intune15" src="../Images/intune14.png">
</p></p>
15: This will bring up a pop up. Let’s build a policy profile for Windows 10 or Later and use the profile type "Settings catalog". Click create
</p></p>
<img width="441" alt="Intune16" src="../Images/intune15.png">
</p></p>
16: Let’s give it a name and click "next"
</p></p>
<img width="620" alt="Intune17" src="../Images/intune16.png">
</p></p>
17: Now you will see the Configuration settings options. Click +Add settings. This will bring up the Settings picker. Within that, choose Microsoft Edge, then from that drop down choose Application Guard settings. Click select all these settings. 
</p></p>
<img width="953" alt="Intune18" src="../Images/intune17.png">
18: Click the X on the top corner to close the popup. You will see more Application Guard settings. A common challenge is understanding what all these configuration settings mean. You can click on the Security Copilot button to get a explaining of what the setting means. For example, I’m looking at what Application Guard Container Proxy means. On the right, a pop up comes up explaining all the details of what this configuration setting can do. 
</p></p>
<img width="926" alt="Intune19" src="../Images/intune18.png">
</p></p>
<h2>Exercise 5: Summarize More Details</h2>
</p></p>
19: Now let’s close that popup and go back to Devices. Another point to explore how AI can summarize different configuration settings within Microsoft Intune. Click a device and select a policy configuration to explain. I'll pick an example of Purview Edge browser extension. You can pick any one you have within your environment. 
</p></p>
<img width="766" alt="Intune21" src="../Images/intune19.png">
</p></p> 
20: Within policies, you will see the "Summarize with Copilot" to get details of the policy. 
</p></p>
<img width="924" alt="Intune22" src="../Images/intune20.png">
21: This can be super helpful to quickly understand what policies you have and help with decisions on when to use or remove such policies. 
</p></p>
<h2>Exercise 6: Run a query</h2>
</p></p>
22: Next, let’s close that and click devices. Then click "All devices" and choose a device. 
</p></p>
<img width="698" alt="Intune23" src="../Images/intune21.png">
</p></p>
23: Now let’s choose "Device query". Then click Query with Copilot. 
</p></p>
<img width="776" alt="Intune24" src="../Images/intune22.png">
</p></p>
You will see options to query Copilot against. For example, I'll choose "show me all active processes". 
</p></p>
<img width="425" alt="Intune25" src="../Images/intune23.png">
</p></p>
You can also choose to add processes. Click add and run.
</p></p>
<img width="373" alt="Intune26" src="../Images/intune24.png">
</p></p>
You will see the results of what is running on the endpoint. 
</p></p>
<img width="1280" alt="Intune27" src="../Images/intune25.png">
</p></p>
<h4>These are just some of the powerful capabilities that become available when Microsoft Security Copilot is enabled in your environment.</h4>
</p></p>
Please click <a href="Module-12-Embedded-Features-in-Microsoft-Entra.md">here</a> to go to the next Advanced Module (Microsoft Entra) or click <a href="Deleting-SCU.md">here</a> to delete the SCUs and complete the course.

<h1> Module 10 - Embedded Features in Microsoft Purview</h1>
<h4>🎓 Level: 200 (Advanced)<h4>
<h4>⌛ Estimated time to complete this lab: 30 minutes</h4>
<h2>Objectives </h2>
</p></p>
This module walks you through how to use Microsoft Security Copilot to assist with generating a script within Microsoft Purview to discover specific desired content. 
<h2>Prerequisites </h2>
</p></p>
* You have Microsoft Security Copilot enabled
</p></p>
* You have added the necessary amount of SCU's to complete the Additional Modules (15 SCUs if continuing directly on from the Beginner and Advanced Modules or 8 if you have re-installed Security Copilot).
 </p></p>
* You must have access to Microsoft Purview in the same tenant as Microsoft Security Copilot so Security Copilot features are available in Microsoft Purview  
</p></p>
<h4>Note: This module will focus on embedded capabilities found with Microsoft Purivew when Microsoft Copilot for security is enabled. You can perform similar steps using the stand alone option for Microsoft Security Copilot</h4>
</p></p>
<h2>Exercise 1: Using Security Copilot to Create eDiscovery Search Queries</h2>
In this exercise, we will show you how to access Microsoft Purview and using AI to generate eDiscovery search queries to find various artifacts.
</p></p>
1: Go to purview.microsoft.com. Click View all Solutions to see all options
</p></p>
<img width="887" alt="purview1" src="../Images/purview1.png">
</p></p>
2: Select the eDiscovery button
</p></p>
<img width="848" alt="purview2" src="../Images/purview2.png">
</p></p>
3: You can create a new case or click Cases to select an existing case. For this example, we will just go to an existing case.
</p></p>
<img width="326" alt="purview3" src="../Images/purview3.png">
</p></p>
</p></p>
<img width="406" alt="Purview4" src="../Images/purview4.png">
</p></p>
4: You can create a new search or jump into an existing search like I’m doing here
</p></p>
<img width="469" alt="Purview5" src="../Images/purview5.png">
</p></p>
5: Select "Draft with Security Copilot"
</p></p>
<img width="460" alt="Purview6" src="../Images/purview6.png">
</p></p>
6: Here you can ask in natural language to ask Microsoft Security Copilot what to search for. 
</p></p>
<img width="917" alt="Purview7" src="../Images/purview7.png">
</p></p>
7. You could click the Suggested Prompts button to get an idea of some prompts you could use. 
</p></p>
<img width="388" alt="Purview8" src="../Images/purview8.png">
</p></p>
8. For my example, I’ll ask finding conversations containing specific keywords as shown. I'll click Refine to have Copilot clean this up into something that can be translated into a KQL result. 
</p></p>
<img width="361" alt="Purview9" src="../Images/purview9.png">
</p></p>
9: You should see a refined version of your request. If it looks good, choose to accept it
</p></p>
<img width="362" alt="Purview10" src="../Images/purview10.png">
</p></p>
10: Now choose to Generate KQL. This will create you KQL code you can use to hunt for your desired data. 
</p></p>
<img width="705" alt="Purview11" src="../Images/purview11.png">
</p></p>
11: Simply copy the code and run it to find your desired data. 
</p></p>
<h4>Now it’s your turn. Try opening a new case or opening an existing case and use Microsoft Security Copilot. Use the sample prompts and adjust to fit your eDiscovery needs. AI can simplify your eDiscovery process!</h4>
</p></p>
<h2>Exercise 2: Summarize Evidence Collected via eDiscovery with Security Copilot</h2>
</p></p>
12: Now lets explore how to use AI to summarize evidence collected via eDiscovery capabilities within Microsoft Purview. Click "Home" and select eDiscovery. Then click "Cases" to bring up your cases. You could also create a new case. 
</p></p>
<img width="736" alt="PurviewE1" src="../Images/purview12.png">
</p></p>
13. Next click "Review sets". 
</p></p>
<img width="494" alt="PurviewE2" src="../Images/purview13.png">
</p></p>
14. Next, im going to choose the existing review set. You could also create a new one if needed. 
</p></p>
<img width="617" alt="PurviewE3" src="../Images/purview14.png">
</p></p>
15.Finally, open the review set.
</p></p>
<img width="302" alt="PurviewE4" src="../Images/purview15.png">
</p></p>
16. I'm now going to create a filter query that looks at file classes that equals any conversation as shown. 
</p></p>
<img width="642" alt="PurviewE5" src="../Images/purview16.png">
</p></p>
17. Choose a review set within the source, you will see a Security Copilot Summarize button. Click that
</p></p>
<img width="799" alt="PurviewE6" src="../Images/purview17.png">
</p></p>
18. Security Copilot will summarize what was found, which you could continue to ask Security Copilot about the conversation as shown in my example. 
</p></p>
<img width="926" alt="PurviewE7" src="../Images/purview18.png">
</p></p>
19. The same concepts even apply across different languages. My next example shows conversations I would need to translate to understand. 
</p></p>
<img width="920" alt="PurviewE8" src="../Images/purview19.png">
</p></p>
<h2>Exercise 3: Summarizing DLP alerts with Security Copilot</h2>
</p></p>
20. Let's switch our focus to Data Loss Prevention. One challenge can be understanding the cause and impact associated with DLP alerts. This is another area Security Copilot can help. Let's explore this by first accessing the Data Loss Prevention section with Microsoft Purview and select Alerts. 
</p></p>
<img width="213" alt="PurviewD1" src="../Images/purview20.png">
</p></p>
21. Choose an alert and you should see Security Copilot provides a summary. 
</p></p>
<img width="802" alt="PurviewD2" src="../Images/purview21.png">
</p></p>
22. You not only get a summary, but you can also take these findings to the stand stand-alone of Security Copilot to continue your investigation with other tools and resources by clicking the three dots and choosing Open in Security Copilot. 
</p></p>
<img width="406" alt="PurviewD3" src="../Images/purview22.png">
</p></p>
<img width="696" alt="PurviewD4" src="../Images/purview23.png">
</p></p>
This feature gives the analyst a very quick view of the alert so they can decide what is the next best action. Maybe it is clicking to get more details within Microsoft Purview. Maybe its taking these finds to the stand alone version of Security Copilot to either investigate other resources or create a message using the power of AI summary capabilities. Maybe it’s an alert that can be ignored. The point is that AI makes this decision process much faster using the alert summary capabilities of Security Copilot built into Microsoft Purview. 
</p></p>
Please click <a href="Module-11-Embedded-Features-in-Microsoft-Intune.md">here</a> to go to the next Advanced Module (Microsoft Intune) or click <a href="Deleting-SCU.md">here</a> to delete the SCUs and complete the course.

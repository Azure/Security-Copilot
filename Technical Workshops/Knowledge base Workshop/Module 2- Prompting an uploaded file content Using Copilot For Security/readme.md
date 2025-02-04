# Welcome to Microsoft Security Copilot Labs!
# Introduction
![Security CoPilot Logo](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)
##  Prompting for an uploaded file in Security Copilot 
#### ⌛ Estimated time to complete this lab: 20 minutes
#### 🎓 Level: 200 (Proficient)

#### Objectives

Upon completing this technical guide, you will gain the following abilities:<br>

* Leverage the File upload capability  plugin with prompts direclty from Security Copilot.<br>


#### Scenario
"In this technical workshop, participants will learn how to search for documents and leverage the infromation in practical Scurity Operation scenarios .To successfully complete this task, you must meet the following prerequisites:<br>

* You need your own tenant and Microsoft Security Copilot instance.<br>
* uplaoded files from the Previous Module .<br>


# Workshop Agenda: Prompting for an uploaded file in Security Copilot 

## 1. Access the SANS (" Hunt Evil Poster Document")
- Access the Document from the samples folder in the GitHub Here [Hunt Evil Poster PDF](https://github.com/Azure/Copilot-For-Security/blob/main/Technical%20Workshops/Knowledge%20base%20Workshop/Sample%20Files/Hunt%20Evil%20Poster.pdf) or access it from the Link here : https://www.sans.org/posters/hunt-evil/

![Hunt Evil 3](https://github.com/Azure/Copilot-For-Security/blob/main/Images/KB%20Images/huntevil3.png?raw=true)

- Ensure the document is added on your file upload capability in Security Copilot 

## 2. Prompting Uploade files using Security Copilot 

- send out the first Prompt Querying the data in the document , we will focus on a couple of senarios , in the hunt evil document we will focus on pulling infromation associated with Lateral Movement ( key focus on how its achieed with Remote Access or Remote Execution)

**Prompt 1: Could you show me the event IDs associated with Remote execution from the SANS_DFPS_FOR508_v4.10_02-23 (1).pdf document from the uploaded files in a table format**

![hunt evil poster 1](https://github.com/Azure/Copilot-For-Security/blob/main/Images/KB%20Images/huntevilfileupload1.png)


**Prompt 2: Leveraging the above Event IDs , hunt my defender environment for any events associated with them.**

![Hunt Evil Poster 2](https://github.com/Azure/Copilot-For-Security/blob/main/Images/KB%20Images/huntevilfileupload2.png)


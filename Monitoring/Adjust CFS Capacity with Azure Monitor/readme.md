## Using Azure Automation to raise and lower the amount of SCUs programmatically

The first thing we need to do is create an Azure Automation Account. 
 <br />If you’ve never used an Automation Account before, you may need to follow [these instructions] (https://learn.microsoft.com/en-us/azure/automation/quickstarts/create-azure-automation-account-portal) to enable automation in Azure.
 <br />Once, you have that enabled find the Automation Accounts in Azure and select +Create to create a new one.
  <br />

![Image1](https://github.com/anfisher1967/Copilot-For-Security/blob/main/Images/Azure%20Automation%20Images/_AA.png)
 <br />

After hitting next, you’ll fill out the Basics information including the Subscription, Resource group and Region. 
 <br />You’ll also need to give the Automation Account a name.
  <br />

![Image2](https://github.com/anfisher1967/Copilot-For-Security/blob/main/Images/Azure%20Automation%20Images/_CreateAA.png)
 <br />

Select Next and confirm that the System assigned check box is checked. 
 <br />If you want to change the Networking settings (I change mine to Private access) or add Tags, do so. And then press Review + Create.
 <br />
![Image3](https://github.com/anfisher1967/Copilot-For-Security/blob/main/Images/Azure%20Automation%20Images/_system.png)
 <br />

 <br />Now that the account is created, we need to give it permissions to make the SCU change. 
 <br />In another browser tab, locate your Security Copilot Resource and select Access Control (IAM). 
 <br />Select the +Add button and choose Add role assignment.
 <br />
![Image4](https://github.com/anfisher1967/Copilot-For-Security/blob/main/Images/Azure%20Automation%20Images/_IAM.png)
 <br />

 <br />Select the Privileged administrator roles tab and select Contributor.
 <br />
![Image5](https://github.com/anfisher1967/Copilot-For-Security/blob/main/Images/Azure%20Automation%20Images/_IAM2.png)
 <br />

 <br />You may be thinking - “Whoa! I’m giving Contributor rights to this account.” 
 <br />But managed identities are the preferred method for runbooks because they allow your runbook to easily access other Microsoft Entra protected resources. 
 <br />The identity is managed by the Azure platform and doesn't require you to provision or rotate any secrets. If you need more information, find it here.

 <br />Now let’s pop back to our other tab and create the Runbook.
 <br />Find Runbooks in the Process Automation section. Select +Create a runbook.
 <br />
![Image5](https://github.com/anfisher1967/Copilot-For-Security/blob/main/Images/Azure%20Automation%20Images/_runbook.png)
 <br />

 <br />Give it a name, select PowerShell as the Runbook type and 7.2 as the Runtime version. Then press Review + Create.
 <br />
![Image6](https://github.com/anfisher1967/Copilot-For-Security/blob/main/Images/Azure%20Automation%20Images/_runbook2.png)
 <br />

You should now be at the Edit PowerShell Runbook page. Paste this code in the window. This code will change the number of SCUs from your current setting to one SCU.
```
Connect-AzAccount -Identity
Set-AzContext -Subscription "your subscription"
$Resource = Get-AzResource -ResourceGroupName YourResourceGroup -ResourceName TheNameofYourCoilotResource -ResourceType microsoft.securitycopilot/capacities
$Resource.Properties.numberOfUnits = 1
$Resource | Set-AzResource -Force
```
You can test it if you like in the Test pane. This will show you if there are any errors. Save the runbook.

Now, we’re going to set it so that this runbook kicks off every night at 10 p.m. Make your way back to the Azure Automation page and select Schedules in the Shared Resources section. Select +Add a schedule. Give the schedule a Name and select the date you want it to start. Select Recurring in the Recurrence section. And set Recur every to 1 Day. Set the expiration if you want to. Now select Create.
 <br />
![Image7](https://github.com/anfisher1967/Copilot-For-Security/blob/main/Images/Azure%20Automation%20Images/_schedule.png)
 <br />

Now you’re all finished! You can duplicate these steps to create another Automation that increases the SCUs at 7 am or whatever time your team starts their day.

And remember, if you are working an incident at 2 a.m. and need more SCUs, you can manually change this in the Azure portal at any time.

![Security CoPilot Logo](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)
# Microsoft Security Copilot Community
Welcome to the Security Copilot Repository!

Microsoft Security Copilot is a generative AI-powered assistant for daily operations in security and IT that empowers teams to protect at the speed and scale of AI.
- https://learn.microsoft.com/en-us/security-copilot/
- https://learn.microsoft.com/en-us/security-copilot/get-started-security-copilot
- https://learn.microsoft.com/en-us/security-copilot/plugin_overview
- https://learn.microsoft.com/en-us/security-copilot/connectors-overview
- https://aka.ms/copilotforsecurity

## Contributing
This project welcomes contributions and suggestions.  Most contributions require you to agree to a Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/). 
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

Here are the steps you can take to begin contributing to this project:

**GitHub account**: 
- Get a GitHub account – ([www.github.com](http://www.github.com) ) - Free account works fine.
- Login with your new account
  
**Fork the Repository**:
- Go to the community page: https://github.com/Azure/Copilot-For-Security
- Make sure you are on the master branch
- Click "Fork" -> "Create a new fork"
  ![Github New Fork](https://github.com/Azure/Copilot-For-Security/blob/main/Images/CFSGithubfork.png)
  ![Create New Fork](https://github.com/Azure/Copilot-For-Security/blob/main/Images/CFSGithubforkCreate.png)
- This will create a copy of the Security Copilot repository in your own GitHub account:
  ![View Your New Fork](https://github.com/Azure/Copilot-For-Security/blob/main/Images/CFSGithubforknew.png)

**Clone the fork to your local machine:**:
- You can install Gitbash from https://git-scm.com/downloads if you dont already have it.
-	Create a directory on your local machine where you will pull down the repository to and where you will be working from. 
    Example: “C:\Users\(username)\Documents\GitForks”
-	Open Gitbash and move into the directory “C:\Users\(username)\Documents\GitForks” 
-	Run : Git init
-	Run : Git clone <url of your fork> example: Git clone “https://github.com/(username)/ Copilot-For-Security-Fork”
-	Cd into the new directory that is created ie cd Copilot-For-Security-Fork
-	Set the upstream which is the original repo that you forked from ie the Copilot-For-Security community repo
-	Run : Git remote add upstream https://github.com/Azure/Copilot-For-Security
-	Run : Git remote -v

 	 ![Clone to Local Dir](https://github.com/Azure/Copilot-For-Security/blob/main/Images/Clonethefork.png)

You can do this using GitHub Desktop as well by downloading it from https://desktop.github.com

**Create a branch**:
- You can work with the local main branch, but it is recommended to work with a branch so if you have separate projects you are working on you can keep them isolated. 
- First you want to sync your local repository to the upstream master (the Azure community itself – not your fork)
    Run : git pull upstream main
- You should see a list of updates that are processed or a message saying you are up to date
- Now that you are in sync create your new branch
    Run : Git checkout -b <branch name> example Git checkout -b Sojeshs_CFSContributions

![Create new Branch](https://github.com/Azure/Copilot-For-Security/blob/main/Images/Createnewbranch.png)

**Install VS Code:**

[[Download Visual Studio Code - Mac, Linux, Windows](https://code.visualstudio.com/Download)]

**Open Branch in VS Code:**

Run VS Code and then File > Open Folder the local repository directory (Example: C:\Users\\(username)\Documents\GitForks\Copilot-For-Security-Fork)

You should see all the directories and files in the repository and at the bottom you can see which branch you are working on. Ensure you have the right branch selected before making any changes.

![Branch Selection](https://github.com/Azure/Copilot-For-Security/blob/main/Images/VSCodeBranchConfirmation.png)

**Stage, Commit and Publish your changes**

When you have created the content that you want in VS Code you will need to stage and commit your changes. This will commit them to the branch you have created locally on you machine. For example, I created a new folder by name "SentinelDailyOperations" and KQL Plugin called “KQL_SentinelDailyOperationsSample.yml” within the "Community Based Plugins" directory. You can also add any additional content needed to document and deploy this Plugin. 

![Branch Selection](https://github.com/Azure/Copilot-For-Security/blob/main/Images/CFSGithubCreateNewContent.png)

Now, when you are ready to commit your changes click on the Source Control icon on the left, enter a Message summarizing your changes and hit “+”. This stages the changes. Next click the checkmark to commit your changes.  These are still local to your machine. 
![Branch Selection](https://github.com/Azure/Copilot-For-Security/blob/main/Images/CFSGithubCreateNewContentStageandCommit.png)

![Branch Selection](https://github.com/Azure/Copilot-For-Security/blob/main/Images/CFSGithubCreateNewContentCommitChanges.png)

You can now publish this work off to your personal GitHub by clicking the icon next to the branch name (if it throws up a list up top of repositories pick yours <youraccount>/Copilot-For-Security *NOT* Azure/Copilot-For-Security). In this example case we are picking the main branch iteself to publish my changes with new plugin.

![Branch Selection](https://github.com/Azure/Copilot-For-Security/blob/main/Images/CFSPushChangestoYourGithub.png)

You can now review your commited changes in your GitHub going to the respective branch:
![Branch Selection](https://github.com/Azure/Copilot-For-Security/blob/main/Images/CFSSeeYourGithubCommittedChanges.png)

If you are done with all your work and ready to submit to the main repository, then you need to do a Pull Request. This request will kick off a set of automated checks and if those pass then it goes to a board of reviewers – one of whom has to check your work and accept the request and merge it to the master branch. 

![Branch Selection](https://github.com/Azure/Copilot-For-Security/blob/main/Images/CFSUpdateChangestoMainRepository.png)

The top portion of the "Open a pull request" page is critical. This shows from which repository and branch are you pulling from and to which repository are you pulling to. You should fill in the comments section with a meaningful name and a list of what you have done since the reviewer will be reading this. Then click “Create pull request”

![Branch Selection](https://github.com/Azure/Copilot-For-Security/blob/main/Images/CFSSeeChangesandCommitMainRepository.png)

![Branch Selection](https://github.com/Azure/Copilot-For-Security/blob/main/Images/CFSCreaePullRequestFinal.png)

Once the changes are merged to the main GitHub, you should be able to see changes committed to the main GitHub repository.

![Branch Selection](https://github.com/Azure/Copilot-For-Security/blob/main/Images/CFSMergePullRequesttoMainGithub.png)

**Check your pull request status and sync from main repository**

After your Pull Request has been merged, please check to make sure it got into the main repository. We recommend checking both in the GitHub website as well as by doing a sync to your local repo and verifying the changes are now in place.


**Good Luck and Happy Contributing to Security Copilot Community !!!!**

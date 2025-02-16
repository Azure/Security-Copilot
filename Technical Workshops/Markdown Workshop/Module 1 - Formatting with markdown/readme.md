## Module 1 - Formatting with Markdown in Microsoft Security Copilot

![Security CoPilot Logo](https://github.com/Azure/Copilot-For-Security/blob/main/Images/ic_fluent_copilot_64_64%402x.png)

#### ⌛ Estimated time to complete this lab: 15 minutes
#### 🎓 Level: 100 (Beginner)

The following example prompts demonstrate how users can modify the output from a plugin skill using Markdown. Large Language Models (LLMs) interpret context and follow instructions more effectively when delimiters and Markdown are included in prompts. Although natural language can be used, it often requires more detailed explanations than most users are willing to provide. By offering clear instructions and utilizing Markdown, as covered in this module, you can reduce the likelihood of output variance.

1. [Initial prompt](#initial-prompt)
2. [Formatting as a table with AskGPT](#formatting-as-a-table-with-askgpt)
3. [Formatting as a list with AskGPT](#formatting-as-a-list-with-askgpt)
4. [Combining a prompt with Markdown formatting instructions](#combining-a-prompt-with-Markdown-formatting-instructions)
5. [Available Markdown](#available-markdown)
6. [Increasing efficiency](#increasing-efficiency)


### Initial prompt

Running a prompt without specifying output expectations can lead to inconsistent formatting, such as alternating between tables and bullet points. When users don't provide detailed instructions on the desired output format, the skill will return all available data. In this example, the output starts with "Incident ID," followed by "Display Name," "Severity," and so on.

```
List the last 3 incidents from Defender.
```
![Image](./images/001_prompt_no_Markdown.png)

### Formatting as a table with AskGPT

To modify the default output, we can use the /AskGPT skill and instruct the model to take no action other than reading the instructions. Then, specify that subsequent outputs should follow the provided Markdown format. Keep in mind that this will not reformat existing results; the instruction must be set **before** the prompt for which you want to change the output format.
```
/AskGPT No action is needed at this time, simply review the following instructions and respond with 'Ready!'. Instructions: All additional responses will be formatted to conform to the following Markdown example.
## Markdown example
|  **Created Date**       | **Incident ID** | **Status** | **Incident URL**  | **Title**            | **Severity** | **Assigned To** | **Classification** | **Determination** | **Last Updated**             | 
|-------------------------|-----------------|------------|-------------------|----------------------|--------------|-----------------|--------------------|-------------------|------------------------------| 
| 2025-01-08T12:09:40.47Z |     1234        |   Active   | https://12.aka.ms | Multi-stage incident | High         | John.Doe        | Malware            | True Positive     | 2025-01-22T23:33:21.1733333Z |
```
![Image](./images/002_AskGPT_Markdown_formatting.png)

Notice that re-running the [Initial prompt](#initial-prompt) now results with the first column of "Created Date," followed by "Incident ID," and then "Status," instead of "Incident ID," "Display Name," and "Severity." **Be sure to apply these instructions before formatting other prompts.** For better organization and easier access, consider saving this prompt in a promptbook.

![Image](./images/003_AskGPT_formatting_as_a_table_prompt.png)

### Formatting as a list with AskGPT

Another example of Markdown formatting is shown below, using bullets, indentations, and a horizontal bar after each incident. In this example, the "Assigned To," "Classification," and "Determination" fields have been excluded from the formatted output by removing them from the Markdown example.
```
/AskGPT No action is needed at this time, simply review the following instructions and respond with 'Ready!'. Instructions: All additional responses will be formatted to conform to the following Markdown example.
- **Created Date**: `2025-01-08T12:09:40.47Z`
  - **Incident ID**: `1234`
  - **Status**: `Active`
  - **Title**: `Multi-stage incident`
    - **Severity**: `High`
  - **Last Updated**: `2025-01-22T23:33:21.1733333Z`
    -  **Incident URL**: [Incident Details](https://12.aka.ms)
---
```


![Image](./images/004_AskGPT_formatting_as_a_list_prompt.png)


![Image](./images/005_AskGPT_formatting_as_a_list_result.png)

---


### Combining a prompt with Markdown formatting instructions

Instead of separating the request, you can include the formatting within the prompt itself. Combining both prompt and formatting instructions can be useful when used with Logic Apps and helps reduce SCU utilization.

 ```
List the last 3 incidents from Defender. Ensure the output is formatted to conform to the following Markdown example.
## Markdown example
| **Incident ID** | **Status** | **Incident URL**  | **Title**            | **Severity** | **Assigned To** | **Classification** | **Determination** | **Created Date**         | **Last Updated**            | 
|-----------------|------------|-------------------|----------------------|--------------|-----------------|--------------------|-------------------|--------------------------|-----------------------------| 
|     1234        |   Active   | https://12.aka.ms | Multi-stage incident | High         | John.Doe        | Malware            | True Positive     | 2025-01-08T12:09:40.47Z | 2025-01-22T23:33:21.1733333Z |
```
![Image](./images/006_prompt_that_includes_AskGPT_formatting.png)


---
### Available Markdown

Given the speed of change within Security Copilot, the best way to visualize which Markdown syntax elements are available to you is by using the following prompt.

Please note that the standalone instance of Security Copilot currently does not support rendering all Markdown syntax elements (e.g., certain headings and images). While you can still include these elements in your prompts, the output will need to be processed and rendered by another service.

```
/AskGPT Assume the role of a Markdown syntax expert. Provide a comprehensive list of Markdown syntax elements, including tables, numbered lists, task lists, and horizontal rules. For each element, provide instructions on how I can replicate them myself and what it would look like when rendered.
```
For the official Markdown specification visit [CommonMark](https://commonmark.org/help/)

### Increasing efficiency

All the Markdown formatting methods above include extra characters to help users visualize the format. To increase efficiency, you can remove double spaces and extra hyphens. Here's an example of what this looks like:

```
| **Incident ID** | **Status** | **Incident URL** |
| --- | --- | --- |
| 1234 | Active | https://12.aka.ms |
```
# 1Password Plugin for Microsoft Security Copilot

## Overview

    The 1Password plugin enables Microsoft Security Copilot to securely access and retrieve secrets, credentials,  
    and other sensitive information stored in 1Password vaults.  
    This integration allows security analysts and automation workflows to leverage 1Password as a trusted source for secrets management within the Security Copilot environment.

## Installation

    1. Ensure you have access to the 1Password account with the necessary permissions to read vaults and items via 1Password Connect.
    2. Download or clone the plugin repository into your Security Copilot Community Plugins directory.
    3. Follow the standard plugin registration process for Microsoft Security Copilot, referencing this plugin's manifest file (`KQL_manifest_1password.yaml`).
    4. Ensure your 1Password Connect server is running and accessible from the Security Copilot environment.

## Setup Parameters

    The following parameters must be configured for the plugin to function correctly:

    - **1Password Connect Server URL**: The URL of your 1Password Connect server. This is required for the plugin to communicate with 1Password.
    - **1Password API Token**: A valid API token with permissions to access the necessary vaults and items in your 1Password account.
    - **Vault and Item Identifiers**: The identifiers for the vaults and items you wish to query. These can be specified in your prompts or workflows.

    Ensure these parameters are correctly set up in the plugin's configuration file or environment variables before use.
## Usage

    Once installed and configured, use Security Copilot prompts or workflows to query secrets from 1Password.

## Example prompt
    "Get secret details for item 'Database Credentials' in vault 'Production Secrets' using 1Password."
    The plugin will securely interact with your 1Password Connect server to fetch and return the requested information.

    For more details on 1Password Connect, refer to the official 1Password documentation. For plugin specifics, consult the manifest file.

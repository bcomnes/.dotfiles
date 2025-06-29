#!/bin/bash
# Git clean filter to redact sensitive API keys from Zed settings
# This script runs when files are staged for commit

sed -e 's/"brave_api_key": "[^"]*"/"brave_api_key": "REDACTED"/g' \
    -e 's/"database_url": "[^"]*"/"database_url": "REDACTED"/g' \
    -e 's/"github_personal_access_token": "[^"]*"/"github_personal_access_token": "REDACTED"/g'

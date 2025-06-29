#!/bin/bash
# Git smudge filter for Zed settings
# This script runs when files are checked out from the repository
# It passes content through unchanged since secrets need to be manually set

# Simply pass through the input unchanged
# User will need to manually replace REDACTED values with real secrets
cat

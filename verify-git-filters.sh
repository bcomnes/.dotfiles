#!/bin/bash
# Verification script to test Git clean/smudge filter setup

set -e

echo "🔍 Verifying Git clean/smudge filter setup..."
echo ""

# Check if filter scripts exist and are executable
echo "📁 Checking filter scripts..."
if [[ -x "./git-clean-secrets.sh" ]]; then
    echo "✅ git-clean-secrets.sh exists and is executable"
else
    echo "❌ git-clean-secrets.sh missing or not executable"
    exit 1
fi

if [[ -x "./git-smudge-secrets.sh" ]]; then
    echo "✅ git-smudge-secrets.sh exists and is executable"
else
    echo "❌ git-smudge-secrets.sh missing or not executable"
    exit 1
fi

# Check if .gitattributes exists and has the right content
echo ""
echo "📝 Checking .gitattributes..."
if [[ -f "./.gitattributes" ]]; then
    if grep -q "configs/config/zed/settings.json filter=redact-secrets" .gitattributes; then
        echo "✅ .gitattributes configured correctly"
    else
        echo "❌ .gitattributes missing filter configuration"
        exit 1
    fi
else
    echo "❌ .gitattributes file missing"
    exit 1
fi

# Check Git filter configuration
echo ""
echo "⚙️  Checking Git filter configuration..."
CLEAN_FILTER=$(git config filter.redact-secrets.clean 2>/dev/null || echo "")
SMUDGE_FILTER=$(git config filter.redact-secrets.smudge 2>/dev/null || echo "")
FILTER_REQUIRED=$(git config filter.redact-secrets.required 2>/dev/null || echo "")

if [[ -n "$CLEAN_FILTER" ]]; then
    echo "✅ Clean filter configured: $CLEAN_FILTER"
else
    echo "❌ Clean filter not configured. Run ./setup-git-filters.sh"
    exit 1
fi

if [[ -n "$SMUDGE_FILTER" ]]; then
    echo "✅ Smudge filter configured: $SMUDGE_FILTER"
else
    echo "❌ Smudge filter not configured. Run ./setup-git-filters.sh"
    exit 1
fi

if [[ "$FILTER_REQUIRED" == "true" ]]; then
    echo "✅ Filter marked as required"
else
    echo "⚠️  Filter not marked as required (optional but recommended)"
fi

# Test the clean filter functionality
echo ""
echo "🧪 Testing clean filter functionality..."
if [[ -f "configs/config/zed/settings.json" ]]; then
    TEST_OUTPUT=$(cat configs/config/zed/settings.json | ./git-clean-secrets.sh)

    if echo "$TEST_OUTPUT" | grep -q '"brave_api_key": "REDACTED"'; then
        echo "✅ brave_api_key redaction working"
    else
        echo "❌ brave_api_key redaction failed"
        exit 1
    fi

    if echo "$TEST_OUTPUT" | grep -q '"database_url": "REDACTED"'; then
        echo "✅ database_url redaction working"
    else
        echo "❌ database_url redaction failed"
        exit 1
    fi

    if echo "$TEST_OUTPUT" | grep -q '"github_personal_access_token": "REDACTED"'; then
        echo "✅ github_personal_access_token redaction working"
    else
        echo "❌ github_personal_access_token redaction failed"
        exit 1
    fi
else
    echo "⚠️  Zed settings file not found, skipping filter test"
fi

# Test what would actually be committed
echo ""
echo "💾 Testing actual Git staging behavior..."
if [[ -f "configs/config/zed/settings.json" ]]; then
    # Stage the file temporarily to test
    git add configs/config/zed/settings.json 2>/dev/null || true

    # Check what's in the index (what would be committed)
    INDEX_CONTENT=$(git show :configs/config/zed/settings.json 2>/dev/null || echo "")

    if [[ -n "$INDEX_CONTENT" ]]; then
        if echo "$INDEX_CONTENT" | grep -q '"brave_api_key": "REDACTED"' && \
           echo "$INDEX_CONTENT" | grep -q '"database_url": "REDACTED"' && \
           echo "$INDEX_CONTENT" | grep -q '"github_personal_access_token": "REDACTED"'; then
            echo "✅ Secrets properly redacted in Git index"
        else
            echo "❌ Secrets NOT redacted in Git index!"
            echo "⚠️  Your real API keys might be committed!"
            exit 1
        fi
    else
        echo "⚠️  Could not test Git index content"
    fi
else
    echo "⚠️  Zed settings file not found, skipping Git staging test"
fi

echo ""
echo "🎉 All checks passed! Your Git filters are working correctly."
echo ""
echo "🔐 Your secrets will be automatically redacted before committing."
echo "📋 Remember to manually set real API keys after cloning on new machines."

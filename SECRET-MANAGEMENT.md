# Secret Management with Git Clean/Smudge Filters

This repository uses Git clean/smudge filters to automatically redact sensitive API keys and credentials before committing them to version control.

## How It Works

- **Clean Filter**: Runs when staging files for commit, automatically replacing sensitive values with `REDACTED` placeholders
- **Smudge Filter**: Runs when checking out files, passes content through unchanged (you manually set real values)

## Files Protected

- `configs/config/zed/settings.json` - Redacts:
  - `brave_api_key`
  - `database_url`
  - `github_personal_access_token`

## Setup Instructions

### Initial Setup (First Time)

1. Clone the repository
2. Run the setup script:
   ```bash
   ./setup-git-filters.sh
   ```
3. Manually edit `configs/config/zed/settings.json` to replace `REDACTED` values with your actual API keys

### Adding New Machines

When setting up on a new machine:

1. Clone the repository
2. Run the setup script: `./setup-git-filters.sh`
3. Edit `configs/config/zed/settings.json` and replace all `REDACTED` values with your real credentials

## How to Add New Protected Files

1. Add the file pattern to `.gitattributes`:
   ```
   path/to/sensitive-file.json filter=redact-secrets
   ```

2. Update `git-clean-secrets.sh` to handle the specific sensitive keys in that file:
   ```bash
   sed -e 's/"your_secret_key": "[^"]*"/"your_secret_key": "REDACTED"/g'
   ```

## Verification

To verify the filters are working:

1. Make changes to a protected file
2. Stage it: `git add configs/config/zed/settings.json`
3. Check what would be committed: `git show :configs/config/zed/settings.json`
4. Verify sensitive values show as `REDACTED`

## Important Notes

⚠️ **Always verify your secrets are redacted before pushing commits**

⚠️ **The filter only works after running the setup script on each machine**

⚠️ **If you forget to run setup, your real secrets could be committed!**

## Files in This Setup

- `.gitattributes` - Defines which files use the filter
- `git-clean-secrets.sh` - Script that redacts secrets before commit
- `git-smudge-secrets.sh` - Script that handles checkout (pass-through)
- `setup-git-filters.sh` - Configures Git to use the filters
- `SECRET-MANAGEMENT.md` - This documentation

## Troubleshooting

### Filter Not Working
- Ensure you've run `./setup-git-filters.sh`
- Check Git config: `git config --list | grep filter.redact-secrets`
- Verify scripts are executable: `ls -la git-*-secrets.sh`

### Secrets Still Visible in Commits
- The filter only applies to files listed in `.gitattributes`
- Make sure the file path in `.gitattributes` matches exactly
- Test the clean script manually: `cat file.json | ./git-clean-secrets.sh`

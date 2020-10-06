#!/bin/sh

# Reference: https://help.github.com/en/articles/changing-author-info
# Step 1: Copy this file to root of git repo you want to fix
# Step 2: Update OLD and CORRECT variables accordingly
# Step 3: Execute
# Step 4: Review in tool like GitHub Desktop to see avatar/name/email updates on suspected commits
# Step 5: git push --force --tags origin 'refs/heads/*' to force push to remote repo

git filter-branch -f --env-filter '
OLD_EMAIL="cspargo@gmail.com"
CORRECT_NAME="Craig Spargo"
CORRECT_EMAIL="craig.spargo@apria.com"
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags

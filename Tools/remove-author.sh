#!/bin/sh
#Code from : https://stackoverflow.com/a/30737248/839573
git filter-branch -f --env-filter '
 
OLD_EMAIL=""
CORRECT_NAME=""
CORRECT_EMAIL=""

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

#use the command after to commit changes.
#git push --force --tags origin 'refs/heads/*'
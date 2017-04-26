# Git Commands
## Repo Setup
1. Create repo in BitBucket first
2. mkdir or cd to directory you want the repo directory to be stored under
3. Create local repo

Use clone command

    git clone https://cspargo@bitbucket.org/cspargo/aws.git

Optional: Create branch called "cspargo"

    git checkout -b cspargo

Pull changes from remote to local (branch specific)

    git pull origin cspargo

Push changes from local to remote (branch specific)

    git push origin cspargo

## General commands
Add/Remove files from staging

    git add file.txt
    git rm file.txt

Commit changes with message

    git commit -m "I did a thing!"

### Manualy create local repo and configure remote repo
Add remote (origin) to local repo config

    git remote add origin https://cspargo@bitbucket.org/cspargo/aws.git

## References
* Atlassian Basic Git Commands
    * <https://www.atlassian.com/git/tutorials/svn-to-git-prepping-your-team-migration#basic-git-commands>
* MarkDown Syntax
    * <https://daringfireball.net/projects/markdown/syntax>

Mac: <kbd>opt+shift+up</kbd> or <kbd>opt+shift+down</kbd>
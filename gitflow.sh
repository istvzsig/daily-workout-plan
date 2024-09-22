#!/bin/bash

# Prompt for the branch name
read -p "Enter the branch name to merge into master: " BRANCH_NAME

# Checkout the master branch
git checkout master

# Fetch the latest changes from the remote repository
git fetch origin
git pull origin master

# Checkout the branch with older commits
git checkout $BRANCH_NAME

# Rebase the branch onto master
git rebase master

# Checkout the master branch again
git checkout master

# Merge the rebased branch into master
git merge $BRANCH_NAME

# Push the changes to the remote repository
git push origin master

echo "Successfully merged $BRANCH_NAME into master."

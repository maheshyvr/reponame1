#!/bin/bash
mkdir ${GITHUB_Repo_Name}
cd ${GITHUB_Repo_Name}
git init

#echo &quot;Adding Bitbucket remote as origin&quot;

git remote add origin git@bitbucket.org:name/${GITHUB_Repo_Name,,}.git

#echo &quot;Adding Github remote as sync&quot;

git remote add sync git@git.github.com:Repositoryname/${GITHUB_Repo_Name,,}.git

#echo &quot;First pulling from github using sync remote&quot;

git pull sync master

#cd ${GITHUB_Repo_Name}

#cat &lt;&lt;EOT&gt;&gt;getAllBranches.sh
#for branch in `git branch -a | grep remotes | grep -v HEAD | grep -v master `; do
# git branch --track ${branch#remotes/origin/} $branch
#done
#EOT
{
echo &quot;for branch in `git branch -a | grep remotes | grep -v HEAD | grep -v master `; do &quot;
echo &quot;git branch --track ${branch#remotes/origin/} $branch &quot;
echo &quot;done&quot;
} &gt;&gt;getAllBranches.sh
chmod +x getAllBranches.sh

./getAllBranches.sh

#git push –all

for branch in `git branch -a | grep remotes | grep -v HEAD | grep -v master `; do
   git branch --track ${branch#remotes/origin/} $branch

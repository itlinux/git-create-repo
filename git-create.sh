#!/bin/sh -x
# Created by Remo Mattei
# Email: rm@rm.ht
# In order to be able to use this script you need the two fields. \
#    One will be the Repo Name the other is the Description
# MAKE SURE TO CHANGE THE TOKEN
#
repo_name=$1
repo_des=$2

if [ $# -lt 2 ] ; then
        echo "Usage: <repo-name> <repo-description>"
        echo "IMPORTANT: <change your token variable YOURTOKENGOESHERE>"
    else

    mkdir $repo_name && cd $repo_name
    touch README.adoc
    printf "= $repo_des \n" >> README.adoc
    git init
    git config user.name "Remo Mattei"
    git config user.email rm@rm.ht

    curl -i -H 'Authorization: token YOURTOKENGOESHERE' https://api.github.com/user/repos -d "{\"name\":\"$repo_name\",\"description\":\"$repo_des\"}"
    git add README.adoc
    git commit -m "First Commit"
    git remote add origin git@github.com:itlinux/$repo_name
    git push -u origin master
    echo $repo_name has been created
fi


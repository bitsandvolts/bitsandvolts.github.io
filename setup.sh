#!/bin/bash

# check if prettier is installed
echo -n "prettier: "
which prettier &> /dev/null
if [ $? -ne 0 ]; then
    echo "ERROR:"
    echo "Please install prettier using 'sudo pacman -Sy prettier'"
    exit 1
else
    echo "OK"
fi

# check if gitlint is installed
echo -n "gitlint: "
which gitlint &> /dev/null
if [ $? -ne 0 ]; then
    echo "ERROR:"
    echo "Please install gitlint using 'pip install gitlint'"
    exit 1
else
    echo "OK"
fi

# check git version
echo -n "git: "
currentver="$(git --version)"
requiredver="2.9.0"
if [ "$(printf '%s\n' "$requiredver" "$currentver" | sort -V | head -n1)" = "$requiredver" ]; then 
    echo "OK"
else
    echo "ERROR"
    echo "Please update git to version ${requiredver} or newer"
fi

# set hook folder
hookfolder=".githooks"
echo "set githooks folder to ${hookfolder}"
git config core.hooksPath ${hookfolder}

# set default commit message
msgpath=".gitcommitmsg"
echo "set default commit message path to ${msgpath}"
git config commit.template ${msgpath}

# select user
echo "what is your name?"
select name in Bjoern Kirthihan
do
    case $name in 
        Bjoern)
            author="Bjoern Hartmann"
            email="bjoern.hartmann@rwth-aachen.de"
            break;;
        Kirthihan)
            author="Kirthihan Yasotharan"
            email="kirthihan.yasotharan@rwth-aachen.de"
            break;;
esac    
done

# set local email address
echo "set local email address to ${email}"
git config user.email "${email}"

# set local name
echo "set local user name to ${author}"
git config user.name "${author}"

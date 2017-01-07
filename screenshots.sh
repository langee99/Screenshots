#!/bin/bash
# Written by: Eric Lange

# Purpose:
#   Move screenshots from your Desktop into a Screenshots folder 
#       within your Documents folder

if [ -e ~/Documents/Screenshots ] ; then

    echo -e "\033[33;1m`ls -d ~`/Documents/Screenshots\033[0m already exists"

else

    echo -e "\033[32mCreating Screenshots directory...\033[0m"

    mkdir ~/Documents/Screenshots &> /dev/null
    
    if [ ! -e ~/Documents/Screenshots ] ; then
        echo -e "\033[1;31mERROR: Directory was unable to be created\033[0m"
        exit 1
    fi

    echo -e "Directory has been created at \033[1;33m`ls -d ~/Documents/Screenshots`\033[0m"
fi

if [ `ls ~/Desktop/ | grep "Screen Shot" | wc -l` -ge 1 ]; then
    
    # Formatting depending on how many files are moved
    if [ `ls ~/Desktop | grep "Screen Shot" | wc -l | awk -F ' ' '{print $1}'` -ge 2 ] ; then
        echo -e "Moved \033[32m`ls ~/Desktop | grep "Screen Shot" | wc -l | awk -F ' ' '{print $1}'`\033[0m screen shot's to \033[33;1m`ls -d ~`/Documents/Screenshots\033[0m"
    else
        echo -e "Moved \033[32m`ls ~/Desktop | grep "Screen Shot" | wc -l | awk -F ' ' '{print $1}'`\033[0m screen shot to \033[33;1m`ls -d ~`/Documents/Screenshots\033[0m"
    fi

    mv ~/Desktop/"Screen Shot"* ~/Documents/Screenshots

else
    echo -e "\033[1;31mNo screenshots on the desktop to move\033[0m"
fi


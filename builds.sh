#!/bin/bash

# echo "===== Patching static HTML Pages with Variables ====="
# echo "/n SELECT ENVIRONMENT.../n"

# echo "1. DEV"
# echo "2. QA"
# echo "3. PROD/n/n"

#------------------------------------------------
#sed 's/$Key/https:\/\/${map[$key]}/g' hello.html > build/hello.html

echo Hello, please provide the environment like dev/qa/prod ?
read environment
echo Hi! you have provided ennvironment : $environment

declare -A devMap=(["_COMPANY_NAME_"]="dev-www.google.com" ["Key2"]="Value2-dev2")
declare -A qaMap=(["_COMPANY_NAME_"]="qa-www.google.com" ["Key2"]="Value2-qa2")
declare -A prodMap=(["_COMPANY_NAME_"]="www.google.com" ["Key2"]="Value2-prod2")


#check if build directory exists

#declare -A devMap=(["Key1"]="www.google.com")


mkdir -p build

if [ "$environment" = "dev" ]; then
   for key in ${!devMap[@]}
    do
        sed 's/'$key'/https:\/\/'${devMap[$key]}'/g' hello.html > build/hello.html
	    # echo "["$key"]:"${devMap[$key]}""
    done
elif [ "$environment" = "qa" ]; then
   for key in ${!qaMap[@]}
    do
	    sed 's/'$key'/https:\/\/'${qaMap[$key]}'/g' hello.html > build/hello.html
        # echo "["$key"]:"${qaMap[$key]}""
    done
elif [ "$environment" = "prod" ]; then
   for key in ${!prodMap[@]}
    do
	    sed 's/'$key'/https:\/\/'${prodMap[$key]}'/g' hello.html > build/hello.html
       # echo "["$key"]:"${prodMap[$key]}""
    done
else
   echo "Provided input does not match with dev/qa/prod environments in lowecase "
fi
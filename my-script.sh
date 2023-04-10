#newVersion=$(sudo grep -oPm1 "(?<=<version>)[^-]+"< "/home/vsts/work/1/s/msa-dto/pom.xml")
        newVersion=$(grep -m 1 "<version>" pom.xml | sed 's/.*<version>\([^<]*\)<\/version>.*/\1/')
        if [ "$newVersion" == "2.7.11" ]
        then
                echo "ERROR : Version $newVersion already exists, try with a different version."
                exit 1
        else
                echo "Previous version : 2.7.11"
                echo "Actual version : $newVersion"
                echo "The build is processing ! "
                echo "##vso[task.setvariable variable=appversion]$newVersion"
                # Tag only main branches
                branch_name=$(basename $GITHUB_REF)
                if [ "$branch_name" == "release" ] || [ "$branch_name" == "master" ]
                then
                    tagname="$newVersion-$branch_name-$GITHUB_RUN_NUMBER"
                    echo "Creating Tag : $tagname"
                    # Output vars are not grabbed by the get source's tag task since it's another job
                    cd $GITHUB_WORKSPACE/
                    git config --global user.name "PrashanthVasam"
                    git config --global user.email "prashanth.vasam@cgi.com"
                    git tag "$tagname"
                    git -c http.extraheader="AUTHORIZATION: bearer $secrets.OAUTH_TOKEN" push origin --tags
                else
                    echo "Branch $branch_name is not a Tag candidate"
                fi
                exit 0
        fi

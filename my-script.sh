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
                if [ "$GITHUB_REF" == "release" ] || [ "$GITHUB_REF" == "master" ]
                then
                    tagname="$newVersion-$GITHUB_REF-$GITHUB_RUN_NUMBER }}"
                    echo "Creating Tag : $tagname"
                    # Output vars are not grabbed by the get source's tag task since it's another job
                    cd /home/vsts/work/1/s/common-utils/
                    git tag "$tagname"
                    git -c http.extraheader="AUTHORIZATION: bearer ${{ env.System_AccessToken }}" push origin --tags
                else
                    echo "Branch $GITHUB_REF is not a Tag candidate"
                fi
                exit 0
        fi

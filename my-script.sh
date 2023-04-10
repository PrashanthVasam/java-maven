#newVersion=$(sudo grep -oPm1 "(?<=<version>)[^-]+"< "/home/vsts/work/1/s/msa-dto/pom.xml")
        newVersion=$(grep -m 1 "<version>" pom.xml | sed 's/.*<version>\([^<]*\)<\/version>.*/\1/')
        if [ "$newVersion" == "${{ env.appversion }}" ]
        then
                echo "ERROR : Version $newVersion already exists, try with a different version."
                exit 1
        else
                echo "Previous version : ${{ env.appversion }}"
                echo "Actual version : $newVersion"
                echo "The build is processing ! "
                echo "##vso[task.setvariable variable=appversion]$newVersion"
                # Tag only main branches
                if [ "${{ github.ref }}" == "release" ] || [ "${{ github.ref }}" == "master" ]
                then
                    tagname="$newVersion-${{ github.ref }}-${{ github.run_number }}"
                    echo "Creating Tag : $tagname"
                    # Output vars are not grabbed by the get source's tag task since it's another job
                    cd /home/vsts/work/1/s/common-utils/
                    git tag "$tagname"
                    git -c http.extraheader="AUTHORIZATION: bearer ${{ env.System_AccessToken }}" push origin --tags
                else
                    echo "Branch ${{ github.ref }} is not a Tag candidate"
                fi
                exit 0
        fi

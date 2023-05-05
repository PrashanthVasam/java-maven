

aws configure set aws_access_key_id "ASIAYCGQOG7ZWODBISHE"
aws configure set aws_secret_access_key "+A8GCfRndftDyuAMvbc8Q8OHPA9YFlo8CZz1o0KA"
aws configure set aws_session_token "IQoJb3JpZ2luX2VjEPn//////////wEaDmFwLXNvdXRoZWFzdC0yIkcwRQIhAP4EfeVCgixJluXiftwUBLaxxWCXqtu5PrLyaC0JX0WcAiAvBiGbCzVqSBa1TxqMuoXjmT1WRnuU5tIyTmH96T1friqMAwgSEAMaDDU1NDQ4NzkyMDYyNyIMztIAFxNG9c2QaDTGKukCsNV7PqtrNxEpf5cN0MgVxmzJGCv4TjssNIVZJrXCouCtNwYQH5Ybjqu3cLDaBzzfiwEoL62xgop0BWF0ojHcz7JK0AW924clF8RiWqDTdLscPSidJ1iSsbCqECus2aymP0RX6lc/UP+2tjxt9xvzPA8ehuSkzLAXewlTVgdDxmjINOm4VbspfZv9Ve/IoEQrFSpwKwnfb+AggB4F2c9tT64XhGJBpnjnZD2R5dTcKjR4z0ZCH7lwk7+4WeDigGkVrQGOzD/i0g7UB7Nn75hYH2655zZLHq5lfIazPz5w9lBivw9a7k8AEEG20onMZanMzUaal249VrcC3RhouPQx4y9o1GaB0qtzJd28/8JpWfPVIP5CZV1W7B2zej8ge5pPKwy4NRHm/ko2xizQV89wHp1vi0K0locg2J9mge3Xh3sYvL77ZSqctQBVJA35GIzSKsW87ISIqevCXkJ2hZDYB6coZ+8H+rKTDTDbgtOiBjqmAe60OQtdsqRzXl03dzbAahySv2mwaNi34DeOGX3Bw7pC/mcjBVDkp3v4jpmUY+Rghsagrxwlhzi+c+YwAk6nBNfgKvFBpPvdMq7JwKvwOtt2q/o8eQZffwB2rXFou+OD5OaLpixkUp9oOlE2ea44q4x1/AiwImbK1sYgdnArlpOwfg9GTruWTO1irDUn5quE0xOiz6+ygXrjsKSNmdJaCITQDcsWP0M="

aws configure set region "us-east-1"

az login --service-principal -u 1c489fed-96b9-4dcd-81bc-6f70aecda002 -p eTtGT07_OCsO~0Nsk.5dWHG.eIxIR.LAo. --tenant b9fec68c-c92d-461e-9a97-3d03a0f18b82

az acr login --name TOTEMTEST
helm pull oci://totemtest.azurecr.io/helm/msa-dev-helm --version 0.1.0
pwd
ls
aws ecr get-login-password --region us-east-1 | helm registry login --username AWS --password-stdin 554487920627.dkr.ecr.us-east-1.amazonaws.com
helm push /home/runner/work/java-maven/java-maven/msa-dev-helm-0.1.0.tgz oci://554487920627.dkr.ecr.us-east-1.amazonaws.com/



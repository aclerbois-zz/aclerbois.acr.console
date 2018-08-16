set /p VersionNumber=Which version number?

docker build -t aclerbois.acr.console:%VersionNumber% .

docker tag aclerbois.acr.console:%VersionNumber% aclerboisblog.azurecr.io/aclerbois.acr.console:%VersionNumber%

docker push aclerboisblog.azurecr.io/aclerbois.acr.console:%VersionNumber%
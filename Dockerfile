FROM microsoft/dotnet:2.1-runtime AS base
WORKDIR /app

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY aclerbois.acr.console.csproj ./
RUN dotnet restore /aclerbois.acr.console.csproj
COPY . .
WORKDIR /src/
RUN dotnet build aclerbois.acr.console.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish aclerbois.acr.console.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "aclerbois.acr.console.dll"]

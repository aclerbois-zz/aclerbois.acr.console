FROM microsoft/dotnet:2.1-runtime AS base
WORKDIR /app

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY . .
RUN dotnet restore aclerbois.acr.console.csproj -nowarn:msb3202,nu1503
RUN dotnet build aclerbois.acr.console.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish aclerbois.acr.console.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "aclerbois.acr.console.dll"]

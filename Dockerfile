FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
WORKDIR /app
COPY EchoService ./
RUN dotnet restore 

# STAGE02 - Publish the application
FROM build-env AS publish
RUN dotnet publish -c Release -o /app

# STAGE03 - Create the final image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "SimpleEcho.dll", "--server.urls", "http://*:80"]
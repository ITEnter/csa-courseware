FROM microsoft/dotnet:2.2-sdk AS build-env
WORKDIR /app
COPY EchoService ./
RUN dotnet restore 

# STAGE02 - Publish the application
FROM build-env AS publish
RUN dotnet publish -c Release -o /app

# STAGE03 - Create the final image
FROM microsoft/dotnet:2.2-aspnetcore-runtime
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "SimpleEcho.dll", "--server.urls", "http://*:80"]
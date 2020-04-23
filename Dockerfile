FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
WORKDIR /app
COPY EchoService ./
RUN mkdir /build && dotnet restore 
RUN dotnet build -o /build

# STAGE02 - Create the final image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=build-env /build .
ENTRYPOINT ["dotnet", "SimpleEcho.dll", "--server.urls", "http://*:80"]
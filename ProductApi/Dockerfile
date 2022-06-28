FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /app

COPY . ./
RUN dotnet restore "ProductApi.csproj"
RUN dotnet publish "ProductApi.csproj" -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:6.0
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "ProductApi.dll"]
#FROM mcr.microsoft.com/dotnet/aspnet:3.1-alpine AS base
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

#FROM mcr.microsoft.com/dotnet/sdk:3.1-alpine AS build
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /src
COPY . .
RUN dotnet restore "pfs.csproj"

FROM build AS publish
RUN dotnet publish ./pfs.csproj -c release -o /app/publish

FROM base AS final
RUN apt update && apt install -y libglibd-2.0-0 fuse
WORKDIR /app
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false
COPY --from=publish /app/publish .
RUN cp /app/runtimes/linux-x64/native/libMonoFuseHelper.so /lib/libMonoFuseHelper
RUN chown 666:666 /mnt
ENTRYPOINT ["dotnet", "pfs.dll"]


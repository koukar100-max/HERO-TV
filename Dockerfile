FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# تثبيت أداة السيرفر المحلي الخفيفة والمضمونة
RUN dotnet tool install --global dotnet-serve

# نسخ ملف الـ JSON والأكواد إلى بيئة التشغيل
COPY . .

# تشغيل السيرفر على المنفذ 8080 لتغذية التطبيق
EXPOSE 8080
ENV PATH="${PATH}:/root/.dotnet/tools"
ENTRYPOINT ["dotnet-serve", "-p", "8080", "-a", "0.0.0.0", "--cors"]

set executable=.\modules\swagger-codegen-cli\target\swagger-codegen-cli.jar

If Not Exist %executable% (
  mvn clean package
)

set lang=csharp

set api_package=Zoo.API
set api_url=http://localhost:5272/swagger/v1/swagger.json
set template_dir=modules\swagger-codegen\src\main\resources\%lang%
set output_dir=output\client\zoo\%lang%
set config_file=configurate\%lang%-config.json

set JAVA_OPTS=%JAVA_OPTS% -XX:MaxPermSize=256M -Xmx1024M -DloggerPath=conf/log4j.properties
set ags=generate --api-package %api_package% -t %template_dir% -i %api_url% -l %lang% -o %output_dir% -c %config_file%

java %JAVA_OPTS% -jar %executable% %ags%

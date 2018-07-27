@ECHO OFF
set /p type_build=build or rebuild:

if "%type_build%"=="rebuild" goto rrebuild
	echo "Start Build"
	timeout 3 > nul
	msbuild /t:Build CppUnit/CppUnit_vs120.sln
	msbuild /t:Build Foundation/Foundation_vs120.sln 
	msbuild /t:Build XML/XML_vs120.sln
	msbuild /t:Build JSON/JSON_vs120.sln 
	msbuild /t:Build Util/Util_vs120.sln 
	msbuild /t:Build Net/Net_vs120.sln	
	echo "Finish build poco"
	cd ..
goto end

:rrebuild
	echo "Start Rebuild"
	timeout 3 > nul
	msbuild /t:Rebuild CppUnit/CppUnit_vs120.sln
	msbuild /t:Rebuild Foundation/Foundation_vs120.sln 
	msbuild /t:Rebuild XML/XML_vs120.sln
	msbuild /t:Rebuild JSON/JSON_vs120.sln 
	msbuild /t:Rebuild Util/Util_vs120.sln 
	msbuild /t:Rebuild Net/Net_vs120.sln	
	echo "Finish rebuild poco"
	cd ..
:end

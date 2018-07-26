@ECHO OFF
set /p type_build=build or rebuild:
if "%type_build%"=="rebuild" goto rrebuild
	echo "Start Build"
	cd CppUnit
	msbuild /t:Build CppUnit_vs120.sln 
	cd ..
	cd Foundation
	msbuild /t:Build Foundation_vs120.sln 
	cd ..
	cd Util 
	msbuild /t:Build Util_vs120.sln 
	cd ..
	cd XML 
	msbuild /t:Build XML_vs120.sln 
	cd ..
	cd Net
	msbuild /t:Build Net_vs120.sln	
goto end

:rrebuild
	echo "Start Rebuild"
	cd CppUnit
	msbuild /t:Rebuild CppUnit_vs120.sln 
	cd ..
	cd Foundation
	msbuild /t:Rebuild Foundation_vs120.sln 
	cd ..
	cd Util 
	msbuild /t:Rebuild Util_vs120.sln 
	cd ..
	cd XML 
	msbuild /t:Rebuild XML_vs120.sln 
	cd ..
	cd Net
	msbuild /t:Rebuild Net_vs120.sln	
:end

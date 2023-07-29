
@echo on
cls
setlocal
PUSHD %~DP0
TITLE TEST

echo.
%_NT.TXT
chcp 949




echo ########################################################## >> [RES]_%COMPUTERNAME%_NT.txt 2>nul
echo ############### windows script	#######################	>> [RES]_%COMPUTERNAME%_NT.txt 2>nul
echo ########################################################## >> [RES]_%COMPUTERNAME%_NT.txt 2>nul
echo.								>> [RES]_%COMPUTERNAME%_NT.txt 2>nul
echo.								>> [RES]_%COMPUTERNAME%_NT.txt 2>nul


echo ################# JOB TIMES      #########################	>> [RES]_%COMPUTERNAME%_NT.txt 2>nul
echo.								>> [RES]_%COMPUTERNAME%_NT.txt 2>nul
echo.								>> [RES]_%COMPUTERNAME%_NT.txt 2>nul
data /t >> [RES]_%COMPUTERNAME%_NT.txt 2>nul

echo ########################################################## >> [RES]_%COMPUTERNAME%_NT.txt 2>nul
echo.								>> [RES]_%COMPUTERNAME%_NT.txt 2>nul
echo.								>> [RES]_%COMPUTERNAME%_NT.txt 2>nul


echo ################# OS information   #######################	>> [RES]_%COMPUTERNAME%_NT.txt 2>nul
echo.								>> [RES]_%COMPUTERNAME%_NT.txt 2>nul
systeminfo							>> [RES]_%COMPUTERNAME%_Info.txt 2>nul
type [RES]_%COMPUTERNAME%_Info.txt | find /I "OS" 		>> [RES]_%COMPUTERNAME%_NT.txt 2>nul
type [RES]_%COMPUTERNAME%_Info.txt |find /I "Domain" 		>> [RES]_%COMPUTERNAME%_NT.txt 2>nul
echo.								>> [RES]_%COMPUTERNAME%_NT.txt 2>nul
echo OS Information 						>> [RES]_%COMPUTERNAME%_NT.txt 2>nul

echo ########################################################## >> [RES]_%COMPUTERNAME%_NT.txt 2>nul
echo.								>> [RES]_%COMPUTERNAME%_NT.txt 2>nul
echo.								>> [RES]_%COMPUTERNAME%_NT.txt 2>nul

echo ###################### START  ############################	>> [RES]_%COMPUTERNAME%_NT.txt 2>nul
echo "SRV-001 START INSPECTING"			 			>> [RES]_%COMPUTERNAME%_NT.txt 2>nul
echo.								>> [RES]_%COMPUTERNAME%_NT.txt 2>nul

echo "[SRV-001] get community string weakness " 		>> [RES]_%COMPUTERNAME%_NT.txt 2>nul
echo.								>> [RES]_%COMPUTERNAME%_NT.txt 2>nul

echo "# rule : value changes and using community string character + Integer = 10 character raise good" >> [RES]_%COMPUTERNAME%_NT.txt 2>nul
echo .								>> [RES]_%COMPUTERNAME%_NT.txt 2>nul
echo "# 1.contact service" 						>> [RES]_%COMPUTERNAME%_NT.txt 2>nul
net start |find /I "SNMP"						>> [RES]_%COMPUTERNAME%_NT.txt 2>nul
echo.								>> [RES]_%COMPUTERNAME%_NT.txt 2>nul

echo "# 2. contact registre setting"				>> [RES]_%COMPUTERNAME%_NT.txt 2>nul

reg query "HKLM\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities" /s >> [RES]_%COMPUTERNAME%_NT.txt

echo. >> [RES]_%COMPUTERNAME%_NT.txt 2>nul
echo. >> [RES]_%COMPUTERNAME%_NT.txt 2>nul

echo "[SRV-001] END"						>> [RES]_%COMPUTERNAME%_NT.txt 2>nul
echo .								>> [RES]_%COMPUTERNAME%_NT.txt 2>nul

echo ########################################################## >> [RES]_%COMPUTERNAME%_NT.txt 2>nul
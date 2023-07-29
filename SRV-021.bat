@echo on
:: 명령 자체가 실행될 ?? 콘솔에 표시되지 않게 해줘요
cls
:: :: 화면 지우기   clear
setlocal
:: 기존 bat파일 영향주지 않게 프로세스 선점하는 환경설정.
PUSHD %~DP0
:: 현재 디렉토리 지정 : PUSHD 이걸 메모리에 올림.     그리고   현재 디렉토리 위치를 배치파일이 실행되는 디렉토리로 변경 설정. 
TITLE SRV-021


echo. SRV-021 START
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
echo [SRV-021] "FTP 서비스 접근 제어 설정 미비"                                                                   >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
echo [_START_]                                                                                 >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
echo # 기준 : FTP 서비스에 접근제한 설정이 되어 있는 경우 양호     >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
echo # 현황                                                                                       >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
echo.                                                                                          >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
echo # 1.서비스 확인                                                                                  >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
net start |findstr /I "filezilla ftp publishing"                           >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
:: findstr은 filezilla, ftp, publishing 이런식으로 끊어서 룩업 가능
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
echo # 2.MetaBase.xml 확인                                                                       >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
if exist "%cd%\[RESULT]_%COMPUTERNAME%_IIS_Security_Policy.txt" (
   type "%cd%\[RESULT]_%COMPUTERNAME%_IIS_S
ecurity_Policy.txt" |find /I "ip security"      >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
   ) else (
 echo MetaBase.xml파일이 존재하지 않음                                                          >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
   )
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul

echo # 3-1.applicationHost.config 확인                                                              >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
if exist "%cd%\[RESULT]_%COMPUTERNAME%_IIS7_Security_Policy.txt" (
   type "%cd%\[RESULT]_%COMPUTERNAME%_IIS7_Security_Policy.txt" |findstr /I "accesstype users ipaddress" |find /v "path=" >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
   ) else (
 echo applicationHost.config파일이 존재하지 않음                                                   >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
   )
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul

echo # 3-2.applicationHost.xml 확인                                                                 >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
if exist "%cd%\[RESULT]_%COMPUTERNAME%_IIS7_Security_Policy2.txt" (
   type "%cd%\[RESULT]_%COMPUTERNAME%_IIS7_Security_Policy2.txt" |findstr /I "accesstype users ipaddress" |find /v "path=" >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
   ) else (
 echo applicationHost.xml파일이 존재하지 않음                                                   >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
   )
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
echo [_END_]                                                                                    >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
echo SRV-021 END                                                                                >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
echo iis파일에서 system.ftpserver 검색 후 ipsecurity 참고                                        >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
echo ######################################################################################     >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
echo [_RSTART_]                                                                                 >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul
echo [_REND_]                                                                                    >> [RESULT]_%COMPUTERNAME%SRV-021.txt 2>nul

@echo on
:: 명령 자체가 실행될 ?? 콘솔에 표시되지 않게 해줘요
cls
:: :: 화면 지우기   clear
setlocal
:: 기존 bat파일 영향주지 않게 프로세스 선점하는 환경설정.
PUSHD %~DP0
:: 현재 디렉토리 지정 : PUSHD 이걸 메모리에 올림.     그리고   현재 디렉토리 위치를 배치파일이 실행되는 디렉토리로 변경 설정. 
TITLE SRV-013

echo. SRV-013 START
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
echo [SRV-013] "Anonymous 계정의 FTP 서비스 접속 제한 미비"                                                  >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
echo.                                                                                          >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
echo [_START_]                                                                                 >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
echo # 기준 : FTP를 사용하지 않거나 "익명 연결 허용"이 체크되어 있지 않은 경우 양호(Default : 사용 안 함)  >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
echo # 현황                                                                                       >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nulecho.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
echo.                                                                                          >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
echo # 1-1.서비스 확인                                                                         >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
net start |findstr /I "filezilla ftp publishing"                           >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
:: findstr과 find의 차이
:: find: 한 번에 하나의 문자열만 검색할 수 있습니다.
:: findstr: 여러 문자열을 동시에 검색하여 지정된 문자열을 포함하는 줄을 찾을 수 있습니다.
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
echo # 1-2.포트 확인(21)                                                                           >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
netstat -na |find "21" |find /I "LISTENING"                                            >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
:: netstat 명령은 활성 네트워크 (아이피, 포트, 상태) 등 표시
:: -n: 주소와 포트 번호를 숫자 형식으로 표시(호스트 이름이나 서비스로 보여주는 대신).
:: -a: 모든 연결과 포트 표시
:: "21" : FTP 포트 찾음
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul

echo # 2.MetaBase.xml 확인                                                                       >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
:: MetaBase.xml 파일은 IIS 6.0 및 이전 버전에서 사용된  IIS Admin 설정 파일
if exist "%cd%\[RESULT]_%COMPUTERNAME%_IIS_Security_Policy.txt" (
   type "%cd%\[RESULT]_%COMPUTERNAME%_IIS_Security_Policy.txt" |find "anonymousAuthentication enabled" |find /v "IUSR" >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
:: type "%cd%\[RESULT]_%COMPUTERNAME%_IIS_Security_Policy.txt": 이 부분은 파일의 내용을 표시하는 명령어입니다. type 명령은 파일의 내용을 화면에 출력.
:: "IUSR"을 제외하고 출력
   ) else (
 echo MetaBase.xml파일이 존재하지 않음                                                          >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
   )
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul

echo # 3-1.applicationHost.config 확인                                                              >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
::  applicationHost.config 파일은 6.0버전 이상의 IIS 서버 및 관련 웹 응용 프로그램에 대한 설정 및 구성이 포함된 중요한 구성 파일
:: %SystemRoot%\system32\inetsrv\config 경로
if exist "%cd%\[RESULT]_%COMPUTERNAME%_IIS7_Security_Policy.txt" (
   type "%cd%\[RESULT]_%COMPUTERNAME%_IIS7_Security_Policy.txt" |find "anonymousAuthentication enabled" |find /v "IUSR" >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
   ) else (
 echo applicationHost.config파일이 존재하지 않음                                                   >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
   )
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul

echo # 3-2.applicationHost.xml 확인                                                                 >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
:: 사실은 더 이상 사용하지 않는 파일. 존재하면 안되는 파일
if exist "%cd%\[RESULT]_%COMPUTERNAME%_IIS7_Security_Policy2.txt" (
   type "%cd%\[RESULT]_%COMPUTERNAME%_IIS7_Security_Policy2.txt" |find "anonymousAuthentication enabled" |find /v "IUSR" >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
   ) else (
 echo applicationHost.xml파일이 존재하지 않음                                                   >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
   )
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
echo # 4.레지스트리 확인                                                                              >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\MSFTPSVC\Parameters" /s |find "AllowAnonymous" >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
:: reg query : 레지스트리 키와 해당 값들을 읽는 데 사용
:: 이후 로컬 컴퓨터에서 Microsoft FTP 서비스의 "Parameters" 하위 키를 찾는다.
:: /s는 reg query의 명령어로, 지정된 키뿐만 아니라 모든 하위 키에서 검색한다.
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
echo [_END_]                                                                                    >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
echo SRV-013 END                                                                                >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
echo ######################################################################################     >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-013.txt 2>nul
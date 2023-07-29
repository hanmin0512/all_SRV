@echo on
:: 명령 자체가 실행될 ?? 콘솔에 표시되지 않게 해줘요
cls
:: :: 화면 지우기   clear
setlocal
:: 기존 bat파일 영향주지 않게 프로세스 선점하는 환경설정.
PUSHD %~DP0
:: 현재 디렉토리 지정 : PUSHD 이걸 메모리에 올림.     그리고   현재 디렉토리 위치를 배치파일이 실행되는 디렉토리로 변경 설정. 
TITLE TEST
:: 콘솔 창 제목 ㅋㅋ



:: ------------------------------------------------------
rem 주석
:: ------------------------------------------------------

echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
:: 콘솔에 빈 줄을 출력한다. [RESULT]_%COMPUTERNAME%_NT.txt  이 파일로 빈칸 생성 2>nul은 오류를 무시하고 리다이렉션 하는 역할. 이것을 넣으면 "계속하려면 아무키나 누르세요~~~" 가 안뜸.
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
chcp 949
:: 한글 출력때문에 ANSI 인코딩으로 이 bat 소스를 설정해주는 함수
echo ######################################################################################   >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul 
echo #################################################     >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo ##########                  Windows Script                   #######     >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo #################################################     >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul

echo ################## Job time #################  >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                               >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
date /t   >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul  
:: 현재날짜를 (yyyy/mm/dd) 이런식으로 표현해 줌
time /t >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul 
:: 시간 표현해 줌
echo #######################################  >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                               >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                               >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul



echo ################## OS Information #################  >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                               >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
systeminfo                                                   >> [RESULT]_%COMPUTERNAME%_SYSTEMINFO.txt
type [RESULT]_%COMPUTERNAME%_SYSTEMINFO.txt |find /I "OS"  >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
type [RESULT]_%COMPUTERNAME%_SYSTEMINFO.txt |find /I "Domain"  >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
:: find /I는 시스템인포 중 "OS" 와 "Domain" 들어간 부분만 찾아서 리다이렉션
echo.                                                                               >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo OS Information   >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo #######################################  >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                               >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                               >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul





echo ##################################  진단시작  ################################## >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul

chcp 949

echo. SRV-001 START
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [SRV-001] "SNMP Community 스트링 설정 미흡"                                      >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                          >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_START_]                                                                                 >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 기준 : community string 값을 변경하여 사용하고 있고 영문+숫자 10자리 이상 또는 영문+숫자+특수문자 8자리 이상일 경우 양호  >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 현황                                                                                      >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 1.서비스 확인                                                                 >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
net start |find /I "SNMP"                                                                       >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 2-1.ValidCommunities설정 확인                                                              >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities"  >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul 2>&1
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 2-2.Trap Commnunities 설정 확인                                                          >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
reg query "HKLM\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\TrapConfiguration" /s         >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nulecho.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_END_]                                                                                    >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo SRV-001 END                                                                                >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo ######################################################################################     >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul


echo. SRV-003 START
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [SRV-003] "SNMP 접근 통제 미설정"                                                >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                          >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_START_]                                                                                 >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 기준 : 특정 호스트만 SNMP 패킷을 받을 수 있도록 SNMP Access Control이 설정된 경우 양호(PermittedManagers 설정이 있으면 양호)  >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 현황                                                                                        >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 1.서비스 확인                                                                         >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
net start |find /I "SNMP"                                                                       >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 2-1.ValidCommunities 설정 확인                                                              >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SNMP\Parameters" /s  >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul 2>&1
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 2-2.Access Control 설정 확인                                                                   >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\SNMP\Parameters\PermittedManagers" >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul 2>&1
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_END_]                                                                                    >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo SRV-003 END                                                                                >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo ######################################################################################     >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul

echo. SRV-004 START
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [SRV-004] "불필요한 SMTP 서비스 실행"                                                  >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                          >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_START_]                                                                                 >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 기준 : 불필요한 SMTP서비스가 비활성화되어 있는 경우 양호       >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 현황                                                                                        >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 1-1.IIS구동 확인                                                                         >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
net start |find /I "IIS Admin"                                                                  >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
:: net start : 실행중인 서비스
:: | net start 명령의 출력을 가져와서 다음 명령(find)의 입력으로 보냄
:: find /I : 찾기 옵션이고 /I는 대소문자 구분 X
:: IIS Admin을 대상으로 검색
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 1-2.IIS구동 확인                                                                         >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
net start |find /I "World Wide Web"                                          >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 2-1.SMTP구동 확인                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
net start |find /I "Simple Mail Transfer Protocol"                                         >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 2-2.SMTP구동 확인                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
net start |find /I "SMTP"                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_END_]                                                                                    >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo SRV-004 END                                                                                >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo ######################################################################################     >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul

echo. SRV-013 START
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [SRV-013] "Anonymous 계정의 FTP 서비스 접속 제한 미비"                                                  >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                          >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_START_]                                                                                 >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 기준 : FTP를 사용하지 않거나 "익명 연결 허용"이 체크되어 있지 않은 경우 양호(Default : 사용 안 함)  >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 현황                                                                                       >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nulecho.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                          >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 1-1.서비스 확인                                                                         >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
net start |findstr /I "filezilla ftp publishing"                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
:: findstr과 find의 차이
:: find: 한 번에 하나의 문자열만 검색할 수 있습니다.
:: findstr: 여러 문자열을 동시에 검색하여 지정된 문자열을 포함하는 줄을 찾을 수 있습니다.
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 1-2.포트 확인(21)                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
netstat -na |find "21" |find /I "LISTENING"                                            >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
:: netstat 명령은 활성 네트워크 (아이피, 포트, 상태) 등 표시
:: -n: 주소와 포트 번호를 숫자 형식으로 표시(호스트 이름이나 서비스로 보여주는 대신).
:: -a: 모든 연결과 포트 표시
:: "21" : FTP 포트 찾음
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul

echo # 2.MetaBase.xml 확인                                                                       >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
:: MetaBase.xml 파일은 IIS 6.0 및 이전 버전에서 사용된  IIS Admin 설정 파일
if exist "%cd%\[RESULT]_%COMPUTERNAME%_IIS_Security_Policy.txt" (
   type "%cd%\[RESULT]_%COMPUTERNAME%_IIS_Security_Policy.txt" |find "anonymousAuthentication enabled" |find /v "IUSR" >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
:: type "%cd%\[RESULT]_%COMPUTERNAME%_IIS_Security_Policy.txt": 이 부분은 파일의 내용을 표시하는 명령어입니다. type 명령은 파일의 내용을 화면에 출력.
:: "IUSR"을 제외하고 출력
   ) else (
 echo MetaBase.xml파일이 존재하지 않음                                                          >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
   )
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul

echo # 3-1.applicationHost.config 확인                                                              >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
::  applicationHost.config 파일은 6.0버전 이상의 IIS 서버 및 관련 웹 응용 프로그램에 대한 설정 및 구성이 포함된 중요한 구성 파일
:: %SystemRoot%\system32\inetsrv\config 경로
if exist "%cd%\[RESULT]_%COMPUTERNAME%_IIS7_Security_Policy.txt" (
   type "%cd%\[RESULT]_%COMPUTERNAME%_IIS7_Security_Policy.txt" |find "anonymousAuthentication enabled" |find /v "IUSR" >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
   ) else (
 echo applicationHost.config파일이 존재하지 않음                                                   >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
   )
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul

echo # 3-2.applicationHost.xml 확인                                                                 >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
:: 사실은 더 이상 사용하지 않는 파일. 존재하면 안되는 파일
if exist "%cd%\[RESULT]_%COMPUTERNAME%_IIS7_Security_Policy2.txt" (
   type "%cd%\[RESULT]_%COMPUTERNAME%_IIS7_Security_Policy2.txt" |find "anonymousAuthentication enabled" |find /v "IUSR" >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
   ) else (
 echo applicationHost.xml파일이 존재하지 않음                                                   >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
   )
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 4.레지스트리 확인                                                                              >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\MSFTPSVC\Parameters" /s |find "AllowAnonymous" >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
:: reg query : 레지스트리 키와 해당 값들을 읽는 데 사용
:: 이후 로컬 컴퓨터에서 Microsoft FTP 서비스의 "Parameters" 하위 키를 찾는다.
:: /s는 reg query의 명령어로, 지정된 키뿐만 아니라 모든 하위 키에서 검색한다.
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_END_]                                                                                    >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo SRV-013 END                                                                                >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo ######################################################################################     >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul

echo. SRV-018 START
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [SRV-018] "불필요한 하드디스크 기본 공유 활성화"                                                         >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_START_]                                                                                 >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 기준 : 기본공유 항목(C$, D$ 등)이 존재하지 않고 AutoShareServer 레지스트리 값이 0일 경우 양호  >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 현황                                                                                       >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo 1. net share 확인 >>                                                                         [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
sc query "LanmanServer" | find /i "state" >>                                                     share_temp.txt

FOR /F "tokens=4 delims= " %%S IN (share_temp.txt) DO (set state=%%S)
IF "%state%" == "RUNNING" (
   net share | find /v "IPC$" | find /v "command" >>                                              [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
) ELSE (
   echo "Share service is not started." >>                                                        [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
)
echo. >>                                                                                          [RESULT]_%COMPUTERNAME%_NT.txt 2>nul

echo 2. 레지스트리 확인 >>                                                                         [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
reg query "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /s |find /I "AutoShareServer" >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul 2>&1
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_END_]                                                                                    >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo SRV-018 END                                                                                >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo ######################################################################################     >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul


echo. SRV-020 START
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [SRV-020] "공유에 대한 접근 통제 미비"                                                              >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_START_]                                                                                 >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 기준 : 일반공유 디렉터리가 없거나 공유 디렉토리 접근 권한에 Everyone이 없을 경우 양호   >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 현황                                                                                      >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo 1. net share 확인 >>                                                                         [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
FOR /F "tokens=4 delims= " %%S IN (share_temp.txt) DO (set state=%%S)
:: share_temp.txt 라는 파일에서
:: FOR /F`는 윈도우 CMD에서 사용되는 반복 작업을 수행할 때 사용되는 명령어
:: "tokens=4" 옵션으로 4번째 단어를 가져와서, 
:: `delims`(delimiter)은 `FOR /F` 명령어에서 사용되는 옵션으로, 입력 문자열에서 분리자(delimiter)로 사용할 문자를 지정하므로, 띄어쓰기 까지 구분
:: 그 후에 %%S 변수 = state에 저장한다. DO는 DO 뒤의 괄호 부분을 반복실행될 명령문으로 정의/
IF "%state%" == "RUNNING" (
:: `state` 변수에 저장된 값이 "RUNNING" 이면
   net share | find /v "IPC$" | find /v "command" >>                                              [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
:: `net share` 명령어의 출력 결과에서 "IPC$"나 "command"를 제외한 모든 항목을 출력한다. (/v)
:: "|" 기호는 앞의 명령어를 뒤의 명령어로 전달하는 연결자.
   FOR /F "tokens=1 skip=4 " %%j IN ('net share') DO net share %%j >>                             [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
::  "net share" 명령어를 실행하여, 실행 결과에서 5번째 줄부터 시작하여 각 줄의 첫 번째 단어(공유 폴더 이름)를 변수로 지정하고, "net share" 명령어를 재실행하여 해당 변수의 값을 출력
) ELSE (
   echo "Share service is not started." >>                                                        [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
)
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_END_]                                                                                    >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
del share_temp.txt
echo SRV-020 END                                                                                >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo ######################################################################################     >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_RSTART_]                                                                                 >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_REND_]                                                                                    >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul

echo. SRV-021 START
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [SRV-021] "FTP 서비스 접근 제어 설정 미비"                                                                   >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_START_]                                                                                 >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 기준 : FTP 서비스에 접근제한 설정이 되어 있는 경우 양호     >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 현황                                                                                       >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                          >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 1.서비스 확인                                                                                  >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
net start |findstr /I "filezilla ftp publishing"                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
:: findstr은 filezilla, ftp, publishing 이런식으로 끊어서 룩업 가능
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 2.MetaBase.xml 확인                                                                       >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
if exist "%cd%\[RESULT]_%COMPUTERNAME%_IIS_Security_Policy.txt" (
   type "%cd%\[RESULT]_%COMPUTERNAME%_IIS_S
ecurity_Policy.txt" |find /I "ip security"      >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
   ) else (
 echo MetaBase.xml파일이 존재하지 않음                                                          >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
   )
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul

echo # 3-1.applicationHost.config 확인                                                              >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
if exist "%cd%\[RESULT]_%COMPUTERNAME%_IIS7_Security_Policy.txt" (
   type "%cd%\[RESULT]_%COMPUTERNAME%_IIS7_Security_Policy.txt" |findstr /I "accesstype users ipaddress" |find /v "path=" >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
   ) else (
 echo applicationHost.config파일이 존재하지 않음                                                   >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
   )
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul

echo # 3-2.applicationHost.xml 확인                                                                 >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
if exist "%cd%\[RESULT]_%COMPUTERNAME%_IIS7_Security_Policy2.txt" (
   type "%cd%\[RESULT]_%COMPUTERNAME%_IIS7_Security_Policy2.txt" |findstr /I "accesstype users ipaddress" |find /v "path=" >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
   ) else (
 echo applicationHost.xml파일이 존재하지 않음                                                   >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
   )
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_END_]                                                                                    >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo SRV-021 END                                                                                >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo iis파일에서 system.ftpserver 검색 후 ipsecurity 참고                                        >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo ######################################################################################     >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_RSTART_]                                                                                 >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_REND_]                                                                                    >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul

echo. SRV-022 START
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [SRV-022] "계정의 비밀번호 미설정, 빈 암호 사용 관리 미흡"                                                     >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_START_]                                                                                 >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 기준 : "로컬 계정에서 빈 암호 사용 제한" 정책이 "사용"으로 되어 있을 경우 양호(LimitBlankPasswordUse = 4,1)   >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 결과 값이 존재하지 않으면 Default 설정 적용(Default 설정: LimitBlankPasswordUse 1 양호 0 이면 취약)                    >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 현황                                                                                       >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 1.로컬보안정책 확인                                                                             >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
REG QUERY ^"HKLM\SYSTEM\CurrentControlSet\Control\Lsa^" LimitBlankPasswordUse           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
:: "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /s |find /I "AutoShareServer"
:: ^"HKLM\SYSTEM\CurrentControlSet\Control\Lsa^"는 ^ 기호를 사용하여 따옴표 안에 있는 문자열 중간에 있는 큰따옴표(")를 이스케이프하여 에러 없이 명령을 실행할 수 있다. 하지만 명령어 실행에 직접적인 역할은 하지 않는다.
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_END_]                                                                                 >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo SRV-022 END                                                                                >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo ######################################################################################     >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_RSTART_]                                                                                 >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_REND_]                                                                                    >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul

echo. SRV-023 START
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [SRV-023] "원격 터미널 서비스의 암호화 수준 설정 미흡"                                                      >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_START_]                                                                                 >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 기준 : 터미널 서비스를 사용하지 않는 경우 양호(MinEncryptionLevel   = 2 이상이면 양호)     >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 현황                                                                                      >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 1.서비스 확인                                                       >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
net start |find /I "Terminal Services"                                                            >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 2.레지스트리 확인(MinEncryptionLevel)                                                          >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /s |find /I "MinEncryptionLevel"  >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul 2>&1
:: 2>&1는 화면에는 오류메세지를 띄우지 않으며, 로그파일에는 오류메세지를 기록
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_END_]                                                                                    >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo SRV-023 END                                                                                >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo ######################################################################################     >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_RSTART_]                                                                                 >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_REND_]                                                                                    >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul

echo. SRV-024 START
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [SRV-024] "취약한 Telnet 인증 방식 사용"                                                                   >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_START_]                                                                                 >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 기준 : Telnet 서비스가 구동 되고 있지 않거나, 인증방법이 NTLM 일 경우 양호      >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
:: Challenge Response 형식의 New Technology LAN Manager 암호화 방식)
echo # 현황                                                                                       >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 1.서비스 확인(net start)                                                                        >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
net start |find /I "Telnet"                                                                       >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 2.레지스트리 확인                                                                         >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
reg query "HKLM\Software\Microsoft\TelnetServer\1.0\SecurityMechanism"                          >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
:: 서버 들어가서 직접 보기
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_END_]                                                                                    >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo SRV-024 END                                                                                >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo ######################################################################################     >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_RSTART_]                                                                                 >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo #    : SecurityMechanism 2 = NTLM                                                          >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo #    : SecurityMechanism 4 = Password                                                      >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo #    : SecurityMechanism 6 = NTLM, Password                                                >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_REND_]                                                                                    >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul

echo. SRV-027 START
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [SRV-027] "서비스 접근 IP 및 포트 제한 미비"                                                              >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_START_]                                                                                  >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 기준 : 방화벽 제품 또는 Windows 방화벽 기능을 사용하고 있을 경우 양호함     >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 현황                                                                                      >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                          >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 1.레지스트리 확인                                                                              >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
reg query "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v "EnableFirewall" >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
:: 1이 Enable, 0이 Disable
reg query "HKLM\SYSTEM\CurrentControlSet\services\SharedAccess\Parameters\FirewallPolicy\PublicProfile" /v "EnableFirewall" >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 2."Windows (Defender) Firewall 서비스 동작 유무 체크"                                      >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
net start | find /I "firewall" >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
:: CMD에서 직접 확인 가능
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul                                                                                      >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_END_]                                                                                    >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo SRV-027 END                                                                                >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo ######################################################################################     >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_RSTART_]                                                                                 >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_REND_]                                                                                    >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul

echo. SRV-028 START
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [SRV-028] "원격 터미널 접속 타임아웃 설정"                                                              >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_START_]                                                                                 >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 기준 : 원격 터미널을 사용하지 않거나, 사용 시 Session Timeout이 설정되어 있는 경우 양호     >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 현황                                                                                      >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                          >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 1.서비스 확인(Remote Desktop Service / Terminal Services)                                            >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
net start |find /I "Remote Desktop Services"                                               >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
net start |find /I "Terminal Services"                                                            >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                          >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                          >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 2-1.레지스트리 확인(Remote Desktop Service_MaxIdleTime)                                                                >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /s |find /I "MaxIdleTime" |find /v "fInheritMaxIdleTime"  >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul 2>&1
:: 30분이 적절 (세션 시간 제한) (MaxIdleTime 설정 확인 방법: 60000=1분, 300000=5분) 
echo.                                                                                          >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                          >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 2-2.레지스트리 확인(Terminal Services_MaxIdleTime)                                                                >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /s |find /I "MaxIdleTime"  >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul 2>&1
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_END_]                                                                                    >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo SRV-028 END                                                                                >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo ######################################################################################     >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_RSTART_]                                                                                 >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo #    : (MaxIdleTime 설정 확인 방법: 60000=1분, 300000=5분)                                       >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [_REND_]                                                                                    >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul

echo. SRV-029 START
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo [SRV-029] "SMB세션 중단 관리 설정 미비"                                                             >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 기준 : SMB세션 중단 설정이 15분으로 되어 있는 경우 양호       >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo #    : MS 권고 : 15분                                                                       >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo #    : 클라이언트에서 활동을 시작하면 SMB세션이 자동으로 다시 설정되므로 영향도 거의 없음                                  >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo #    : 독립 실행형 서버의 경우 기본값이 15분이며, 도메인 및 도메인 컨트롤러는 정의되지 않음                               >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 현황                                                                                      >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                          >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo # 1.레지스트리 확인(MaxIdleTime)                                                                >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
reg query "HKLM\System\CurrentControlSet\Services\LanManServer\Parameters" /s |find /I "AutoDisconnect" >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
:: 10진수 15 = 16진수 f
reg query "System\CurrentControlSet\Services\LanManServer\Parameters" /s |find /I "EnableForcedLogOff" >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo SRV-029 END                                                                                >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo ######################################################################################     >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%_NT.txt 2>nul
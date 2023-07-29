@echo on
:: 명령 자체가 실행될 ?? 콘솔에 표시되지 않게 해줘요
cls
:: :: 화면 지우기   clear
setlocal
:: 기존 bat파일 영향주지 않게 프로세스 선점하는 환경설정.
PUSHD %~DP0
:: 현재 디렉토리 지정 : PUSHD 이걸 메모리에 올림.     그리고   현재 디렉토리 위치를 배치파일이 실행되는 디렉토리로 변경 설정. 
TITLE SRV-004

echo. SRV-004 START
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-004.txt 2>nul
echo [SRV-004] "불필요한 SMTP 서비스 실행"                                                  >> [RESULT]_%COMPUTERNAME%SRV-004.txt 2>nul
echo.                                                                                          >> [RESULT]_%COMPUTERNAME%SRV-004.txt 2>nul
echo [_START_]                                                                                 >> [RESULT]_%COMPUTERNAME%SRV-004.txt 2>nul
echo # 기준 : 불필요한 SMTP서비스가 비활성화되어 있는 경우 양호       >> [RESULT]_%COMPUTERNAME%SRV-004.txt 2>nul
echo # 현황                                                                                        >> [RESULT]_%COMPUTERNAME%SRV-004.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-004.txt 2>nul
echo # 1-1.IIS구동 확인                                                                         >> [RESULT]_%COMPUTERNAME%SRV-004.txt 2>nul
net start |find /I "IIS Admin"                                                                  >> [RESULT]_%COMPUTERNAME%SRV-004.txt 2>nul
:: net start : 실행중인 서비스
:: | net start 명령의 출력을 가져와서 다음 명령(find)의 입력으로 보냄
:: find /I : 찾기 옵션이고 /I는 대소문자 구분 X
:: IIS Admin을 대상으로 검색
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-004.txt 2>nul
echo # 1-2 WWW 구동 확인                                                                         >> [RESULT]_%COMPUTERNAME%SRV-004.txt 2>nul
net start |find /I "World Wide Web"                                          >> [RESULT]_%COMPUTERNAME%SRV-004.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-004.txt 2>nul
echo # 2-1.SMTP구동 확인                                                                           >> [RESULT]_%COMPUTERNAME%SRV-004.txt 2>nul
net start |find /I "Simple Mail Transfer Protocol"                                         >> [RESULT]_%COMPUTERNAME%SRV-004.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-004.txt 2>nul
echo # 2-2.SMTP구동 확인                                                                           >> [RESULT]_%COMPUTERNAME%SRV-004.txt 2>nul
net start |find /I "SMTP"                                           >> [RESULT]_%COMPUTERNAME%SRV-004.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-004.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-004.txt 2>nul
echo [_END_]                                                                                    >> [RESULT]_%COMPUTERNAME%SRV-004.txt 2>nul
echo SRV-004 END                                                                                >> [RESULT]_%COMPUTERNAME%SRV-004.txt 2>nul
echo ######################################################################################     >> [RESULT]_%COMPUTERNAME%SRV-004.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-004.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-004.txt 2>nul
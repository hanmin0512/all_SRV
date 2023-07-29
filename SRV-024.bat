@echo on
:: 명령 자체가 실행될 ?? 콘솔에 표시되지 않게 해줘요
cls
:: :: 화면 지우기   clear
setlocal
:: 기존 bat파일 영향주지 않게 프로세스 선점하는 환경설정.
PUSHD %~DP0
:: 현재 디렉토리 지정 : PUSHD 이걸 메모리에 올림.     그리고   현재 디렉토리 위치를 배치파일이 실행되는 디렉토리로 변경 설정. 
TITLE SRV-024

echo [SRV-024] "취약한 Telnet 인증 방식 사용"                                                                   >> [RESULT]_%COMPUTERNAME%SRV-024.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-024.txt 2>nul
echo [_START_]                                                                                 >> [RESULT]_%COMPUTERNAME%SRV-024.txt 2>nul
echo # 기준 : Telnet 서비스가 구동 되고 있지 않거나, 인증방법이 NTLM 일 경우 양호      >> [RESULT]_%COMPUTERNAME%SRV-024.txt 2>nul
:: Challenge Response 형식의 New Technology LAN Manager 암호화 방식)
echo # 현황                                                                                       >> [RESULT]_%COMPUTERNAME%SRV-024.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-024.txt 2>nul
echo # 1.서비스 확인(net start)                                                                        >> [RESULT]_%COMPUTERNAME%SRV-024.txt 2>nul
net start |find /I "Telnet"                                                                       >> [RESULT]_%COMPUTERNAME%SRV-024.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-024.txt 2>nul
echo # 2.레지스트리 확인                                                                         >> [RESULT]_%COMPUTERNAME%SRV-024.txt 2>nul
reg query "HKLM\Software\Microsoft\TelnetServer\1.0\SecurityMechanism"                          >> [RESULT]_%COMPUTERNAME%SRV-024.txt 2>nul
:: 서버 들어가서 직접 보기
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-024.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-024.txt 2>nul
echo [_END_]                                                                                    >> [RESULT]_%COMPUTERNAME%SRV-024.txt 2>nul
echo SRV-024 END                                                                                >> [RESULT]_%COMPUTERNAME%SRV-024.txt 2>nul
echo ######################################################################################     >> [RESULT]_%COMPUTERNAME%SRV-024.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-024.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-024.txt 2>nul
echo [_RSTART_]                                                                                 >> [RESULT]_%COMPUTERNAME%SRV-024.txt 2>nul
echo #    : SecurityMechanism 2 = NTLM                                                          >> [RESULT]_%COMPUTERNAME%SRV-024.txt 2>nul
echo #    : SecurityMechanism 4 = Password                                                      >> [RESULT]_%COMPUTERNAME%SRV-024.txt 2>nul
echo #    : SecurityMechanism 6 = NTLM, Password                                                >> [RESULT]_%COMPUTERNAME%SRV-024.txt 2>nul
echo [_REND_]        
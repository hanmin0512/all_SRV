@echo on
:: 명령 자체가 실행될 ?? 콘솔에 표시되지 않게 해줘요
cls
:: :: 화면 지우기   clear
setlocal
:: 기존 bat파일 영향주지 않게 프로세스 선점하는 환경설정.
PUSHD %~DP0
:: 현재 디렉토리 지정 : PUSHD 이걸 메모리에 올림.     그리고   현재 디렉토리 위치를 배치파일이 실행되는 디렉토리로 변경 설정. 
TITLE SRV-003

echo. SRV-003 START
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-003.txt 2>nul
echo [SRV-003] "SNMP 접근 통제 미설정"                                                >> [RESULT]_%COMPUTERNAME%SRV-003.txt 2>nul
echo.                                                                                          >> [RESULT]_%COMPUTERNAME%SRV-003.txt 2>nul
echo [_START_]                                                                                 >> [RESULT]_%COMPUTERNAME%SRV-003.txt 2>nul
echo # 기준 : 특정 호스트만 SNMP 패킷을 받을 수 있도록 SNMP Access Control이 설정된 경우 양호(PermittedManagers 설정이 있으면 양호)  >> [RESULT]_%COMPUTERNAME%SRV-003.txt 2>nul
echo # 현황                                                                                        >> [RESULT]_%COMPUTERNAME%SRV-003.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-003.txt 2>nul
echo # 1.서비스 확인                                                                         >> [RESULT]_%COMPUTERNAME%SRV-003.txt 2>nul
net start |find /I "SNMP"                                                                       >> [RESULT]_%COMPUTERNAME%SRV-003.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-003.txt 2>nul
echo # 2-1.ValidCommunities 설정 확인                                                              >> [RESULT]_%COMPUTERNAME%SRV-003.txt 2>nul
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SNMP\Parameters" /s  >> [RESULT]_%COMPUTERNAME%SRV-003.txt 2>nul 2>&1
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-003.txt 2>nul
echo # 2-2.Access Control 설정 확인                                                                   >> [RESULT]_%COMPUTERNAME%SRV-003.txt 2>nul
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\SNMP\Parameters\PermittedManagers" >> [RESULT]_%COMPUTERNAME%SRV-003.txt 2>nul 2>&1
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-003.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-003.txt 2>nul
echo [_END_]                                                                                    >> [RESULT]_%COMPUTERNAME%SRV-003.txt 2>nul
echo SRV-003 END                                                                                >> [RESULT]_%COMPUTERNAME%SRV-003.txt 2>nul
echo ######################################################################################     >> [RESULT]_%COMPUTERNAME%SRV-003.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-003.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-003.txt 2>nul
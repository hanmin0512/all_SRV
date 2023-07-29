@echo on
:: 명령 자체가 실행될 ?? 콘솔에 표시되지 않게 해줘요
cls
:: :: 화면 지우기   clear
setlocal
:: 기존 bat파일 영향주지 않게 프로세스 선점하는 환경설정.
PUSHD %~DP0
:: 현재 디렉토리 지정 : PUSHD 이걸 메모리에 올림.     그리고   현재 디렉토리 위치를 배치파일이 실행되는 디렉토리로 변경 설정. 
TITLE SRV-002
:: 콘솔 창 제목

echo. SRV-001 START
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-002.txt 2>nul
echo [SRV-001] "SNMP Community 스트링 설정 미흡"                                      >> [RESULT]_%COMPUTERNAME%SRV-002.txt 2>nul
echo.                                                                                          >> [RESULT]_%COMPUTERNAME%SRV-002.txt 2>nul
echo [_START_]                                                                                 >> [RESULT]_%COMPUTERNAME%SRV-002.txt 2>nul
echo # 기준 : community string 값을 변경하여 사용하고 있고 영문+숫자 10자리 이상 또는 영문+숫자+특수문자 8자리 이상일 경우 양호  >> [RESULT]_%COMPUTERNAME%SRV-002.txt 2>nul
echo # 현황                                                                                      >> [RESULT]_%COMPUTERNAME%SRV-002.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-002.txt 2>nul
echo # 1.서비스 확인                                                                 >> [RESULT]_%COMPUTERNAME%SRV-002.txt 2>nul
net start |find /I "SNMP"                                                                       >> [RESULT]_%COMPUTERNAME%SRV-002.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-002.txt 2>nul
echo # 2-1.ValidCommunities설정 확인                                                              >> [RESULT]_%COMPUTERNAME%SRV-002.txt 2>nul
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities"  >> [RESULT]_%COMPUTERNAME%SRV-002.txt 2>nul 2>&1
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-002.txt 2>nul
echo # 2-2.Trap Commnunities 설정 확인                                                          >> [RESULT]_%COMPUTERNAME%SRV-002.txt 2>nul
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\SNMP\Parameters\TrapConfiguration"   >> [RESULT]_%COMPUTERNAME%SRV-002.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-002.txt 2>nulecho.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-002.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-002.txt 2>nul
echo [_END_]                                                                                    >> [RESULT]_%COMPUTERNAME%SRV-002.txt 2>nul
echo SRV-001 END                                                                                >> [RESULT]_%COMPUTERNAME%SRV-002.txt 2>nul
echo ######################################################################################     >> [RESULT]_%COMPUTERNAME%SRV-002.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-002.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-002.txt 2>nul

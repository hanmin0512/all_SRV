@echo on
:: 명령 자체가 실행될 ?? 콘솔에 표시되지 않게 해줘요
cls
:: :: 화면 지우기   clear
setlocal
:: 기존 bat파일 영향주지 않게 프로세스 선점하는 환경설정.
PUSHD %~DP0
:: 현재 디렉토리 지정 : PUSHD 이걸 메모리에 올림.     그리고   현재 디렉토리 위치를 배치파일이 실행되는 디렉토리로 변경 설정. 
TITLE SRV-023

echo. SRV-023 START
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-023.txt 2>nul
echo [SRV-023] "원격 터미널 서비스의 암호화 수준 설정 미흡"                                                      >> [RESULT]_%COMPUTERNAME%SRV-023.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-023.txt 2>nul
echo [_START_]                                                                                 >> [RESULT]_%COMPUTERNAME%SRV-023.txt 2>nul
echo # 기준 : 터미널 서비스를 사용하지 않는 경우 양호(MinEncryptionLevel   = 2 이상이면 양호)     >> [RESULT]_%COMPUTERNAME%SRV-023.txt 2>nul
echo # 현황                                                                                      >> [RESULT]_%COMPUTERNAME%SRV-023.txt 2>nul
echo # 1.서비스 확인                                                       >> [RESULT]_%COMPUTERNAME%SRV-023.txt 2>nul
net start |find /I "Terminal Services"                                                            >> [RESULT]_%COMPUTERNAME%SRV-023.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-023.txt 2>nul
echo # 2.레지스트리 확인(MinEncryptionLevel)                                                          >> [RESULT]_%COMPUTERNAME%SRV-023.txt 2>nul
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /s |find /I "MinEncryptionLevel"  >> [RESULT]_%COMPUTERNAME%SRV-023.txt 2>nul 2>&1
:: 2>&1는 화면에는 오류메세지를 띄우지 않으며, 로그파일에는 오류메세지를 기록
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-023.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-023.txt 2>nul
echo [_END_]                                                                                    >> [RESULT]_%COMPUTERNAME%SRV-023.txt 2>nul
echo SRV-023 END                                                                                >> [RESULT]_%COMPUTERNAME%SRV-023.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-023.txt 2>nul
echo ######################################################################################     >> [RESULT]_%COMPUTERNAME%SRV-023.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-023.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-023.txt 2>nul
echo [_RSTART_]                                                                                 >> [RESULT]_%COMPUTERNAME%SRV-023.txt 2>nul
echo [_REND_]     
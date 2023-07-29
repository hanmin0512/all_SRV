@echo on
:: 명령 자체가 실행될 ?? 콘솔에 표시되지 않게 해줘요
cls
:: :: 화면 지우기   clear
setlocal
:: 기존 bat파일 영향주지 않게 프로세스 선점하는 환경설정.
PUSHD %~DP0
:: 현재 디렉토리 지정 : PUSHD 이걸 메모리에 올림.     그리고   현재 디렉토리 위치를 배치파일이 실행되는 디렉토리로 변경 설정. 
TITLE SRV-029

echo. SRV-029 START
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-029.txt 2>nul
echo [SRV-029] "SMB세션 중단 관리 설정 미비"                                                             >> [RESULT]_%COMPUTERNAME%SRV-029.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-029.txt 2>nul
echo # 기준 : SMB세션 중단 설정이 15분으로 되어 있는 경우 양호       >> [RESULT]_%COMPUTERNAME%SRV-029.txt 2>nul
echo #    : MS 권고 : 15분                                                                       >> [RESULT]_%COMPUTERNAME%SRV-029.txt 2>nul
echo #    : 클라이언트에서 활동을 시작하면 SMB세션이 자동으로 다시 설정되므로 영향도 거의 없음                                  >> [RESULT]_%COMPUTERNAME%SRV-029.txt 2>nul
echo #    : 독립 실행형 서버의 경우 기본값이 15분이며, 도메인 및 도메인 컨트롤러는 정의되지 않음                               >> [RESULT]_%COMPUTERNAME%SRV-029.txt 2>nul
echo # 현황                                                                                      >> [RESULT]_%COMPUTERNAME%SRV-029.txt 2>nul
echo.                                                                                          >> [RESULT]_%COMPUTERNAME%SRV-029.txt 2>nul
echo # 1.레지스트리 확인(MaxIdleTime)                                                                >> [RESULT]_%COMPUTERNAME%SRV-029.txt 2>nul
reg query "HKLM\System\CurrentControlSet\Services\LanManServer\Parameters" /s |find /I "AutoDisconnect" >> [RESULT]_%COMPUTERNAME%SRV-029.txt 2>nul
:: 10진수 15 = 16진수 f
reg query "System\CurrentControlSet\Services\LanManServer\Parameters" /s |find /I "EnableForcedLogOff" >> [RESULT]_%COMPUTERNAME%SRV-029.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-029.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-029.txt 2>nul
echo SRV-029 END                                                                                >> [RESULT]_%COMPUTERNAME%SRV-029.txt 2>nul
echo ######################################################################################     >> [RESULT]_%COMPUTERNAME%SRV-029.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-029.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-029.txt 2>nul
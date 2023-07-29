@echo on
:: 명령 자체가 실행될 ?? 콘솔에 표시되지 않게 해줘요
cls
:: :: 화면 지우기   clear
setlocal
:: 기존 bat파일 영향주지 않게 프로세스 선점하는 환경설정.
PUSHD %~DP0
:: 현재 디렉토리 지정 : PUSHD 이걸 메모리에 올림.     그리고   현재 디렉토리 위치를 배치파일이 실행되는 디렉토리로 변경 설정. 
TITLE SRV-018

echo. SRV-018 START
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-018.txt 2>nul
echo [SRV-018] "불필요한 하드디스크 기본 공유 활성화"                                                         >> [RESULT]_%COMPUTERNAME%SRV-018.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-018.txt 2>nul
echo [_START_]                                                                                 >> [RESULT]_%COMPUTERNAME%SRV-018.txt 2>nul
echo # 기준 : 기본공유 항목(C$, D$ 등)이 존재하지 않고 AutoShareServer 레지스트리 값이 0일 경우 양호  >> [RESULT]_%COMPUTERNAME%SRV-018.txt 2>nul
echo # 현황                                                                                       >> [RESULT]_%COMPUTERNAME%SRV-018.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-018.txt 2>nul
echo 1. net share 확인 >>                                                                         [RESULT]_%COMPUTERNAME%SRV-018.txt 2>nul
sc query "LanmanServer" | find /i "state" >>                                                     share_temp.txt

FOR /F "tokens=4 delims= " %%S IN (share_temp.txt) DO (set state=%%S)
IF "%state%" == "RUNNING" (
   net share | find /v "IPC$" | find /v "command" >>                                              [RESULT]_%COMPUTERNAME%SRV-018.txt 2>nul
) ELSE (
   echo "Share service is not started." >>                                                        [RESULT]_%COMPUTERNAME%SRV-018.txt 2>nul
)
echo. >>                                                                                          [RESULT]_%COMPUTERNAME%SRV-018.txt 2>nul

echo 2. 레지스트리 확인 >>                                                                         [RESULT]_%COMPUTERNAME%SRV-018.txt 2>nul
reg query "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /s |find /I "AutoShareServer" >> [RESULT]_%COMPUTERNAME%SRV-018.txt 2>nul 2>&1
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-018.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-018.txt 2>nul
echo [_END_]                                                                                    >> [RESULT]_%COMPUTERNAME%SRV-018.txt 2>nul
echo SRV-018 END                                                                                >> [RESULT]_%COMPUTERNAME%SRV-018.txt 2>nul
echo ######################################################################################     >> [RESULT]_%COMPUTERNAME%SRV-018.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-018.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-018.txt 2>nul

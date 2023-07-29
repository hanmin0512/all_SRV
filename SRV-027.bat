@echo on
:: 명령 자체가 실행될 ?? 콘솔에 표시되지 않게 해줘요
cls
:: :: 화면 지우기   clear
setlocal
:: 기존 bat파일 영향주지 않게 프로세스 선점하는 환경설정.
PUSHD %~DP0
:: 현재 디렉토리 지정 : PUSHD 이걸 메모리에 올림.     그리고   현재 디렉토리 위치를 배치파일이 실행되는 디렉토리로 변경 설정. 
TITLE SRV-027

echo. SRV-027 START
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-027.txt 2>nul
echo [SRV-027] "서비스 접근 IP 및 포트 제한 미비"                                                              >> [RESULT]_%COMPUTERNAME%SRV-027.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-027.txt 2>nul
echo [_START_]                                                                                  >> [RESULT]_%COMPUTERNAME%SRV-027.txt 2>nul
echo # 기준 : 방화벽 제품 또는 Windows 방화벽 기능을 사용하고 있을 경우 양호함     >> [RESULT]_%COMPUTERNAME%SRV-027.txt 2>nul
echo # 현황                                                                                      >> [RESULT]_%COMPUTERNAME%SRV-027.txt 2>nul
echo.                                                                                          >> [RESULT]_%COMPUTERNAME%SRV-027.txt 2>nul
echo # 1.레지스트리 확인                                                                              >> [RESULT]_%COMPUTERNAME%SRV-027.txt 2>nul
reg query "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v "EnableFirewall" >> [RESULT]_%COMPUTERNAME%SRV-027.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-027.txt 2>nul
:: 1이 Enable, 0이 Disable
reg query "HKLM\SYSTEM\CurrentControlSet\services\SharedAccess\Parameters\FirewallPolicy\PublicProfile" /v "EnableFirewall" >> [RESULT]_%COMPUTERNAME%SRV-027.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-027.txt 2>nul
echo # 2."Windows (Defender) Firewall 서비스 동작 유무 체크"                                      >> [RESULT]_%COMPUTERNAME%SRV-027.txt 2>nul
net start | find /I "firewall" >> [RESULT]_%COMPUTERNAME%SRV-027.txt 2>nul
:: CMD에서 직접 확인 가능
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-027.txt 2>nul                                                                                      >> [RESULT]_%COMPUTERNAME%SRV-027.txt 2>nul
echo [_END_]                                                                                    >> [RESULT]_%COMPUTERNAME%SRV-027.txt 2>nul
echo SRV-027 END                                                                                >> [RESULT]_%COMPUTERNAME%SRV-027.txt 2>nul
echo ######################################################################################     >> [RESULT]_%COMPUTERNAME%SRV-027.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-027.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-027.txt 2>nul
echo [_RSTART_]                                                                                 >> [RESULT]_%COMPUTERNAME%SRV-027.txt 2>nul
echo [_REND_]                                                                                    >> [RESULT]_%COMPUTERNAME%SRV-027.txt 2>nul
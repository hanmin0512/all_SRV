@echo on
:: 명령 자체가 실행될 ?? 콘솔에 표시되지 않게 해줘요
cls
:: :: 화면 지우기   clear
setlocal
:: 기존 bat파일 영향주지 않게 프로세스 선점하는 환경설정.
PUSHD %~DP0
:: 현재 디렉토리 지정 : PUSHD 이걸 메모리에 올림.     그리고   현재 디렉토리 위치를 배치파일이 실행되는 디렉토리로 변경 설정. 
TITLE SRV-022

echo. SRV-022 START
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-022.txt 2>nul
echo [SRV-022] "계정의 비밀번호 미설정, 빈 암호 사용 관리 미흡"                                                     >> [RESULT]_%COMPUTERNAME%SRV-022.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-022.txt 2>nul
echo [_START_]                                                                                 >> [RESULT]_%COMPUTERNAME%SRV-022.txt 2>nul
echo # 기준 : "로컬 계정에서 빈 암호 사용 제한" 정책이 "사용"으로 되어 있을 경우 양호(LimitBlankPasswordUse = 4,1)   >> [RESULT]_%COMPUTERNAME%SRV-022.txt 2>nul
echo # 결과 값이 존재하지 않으면 Default 설정 적용(Default 설정: LimitBlankPasswordUse 1 양호 0 이면 취약)                    >> [RESULT]_%COMPUTERNAME%SRV-022.txt 2>nul
echo # 현황                                                                                       >> [RESULT]_%COMPUTERNAME%SRV-022.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-022.txt 2>nul
echo # 1.로컬보안정책 확인                                                                             >> [RESULT]_%COMPUTERNAME%SRV-022.txt 2>nul
REG QUERY ^"HKLM\SYSTEM\CurrentControlSet\Control\Lsa^" LimitBlankPasswordUse           >> [RESULT]_%COMPUTERNAME%SRV-022.txt 2>nul
:: "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /s |find /I "AutoShareServer"
:: ^"HKLM\SYSTEM\CurrentControlSet\Control\Lsa^"는 ^ 기호를 사용하여 따옴표 안에 있는 문자열 중간에 있는 큰따옴표(")를 이스케이프하여 에러 없이 명령을 실행할 수 있다. 하지만 명령어 실행에 직접적인 역할은 하지 않는다.
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-022.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-022.txt 2>nul
echo [_END_]                                                                                 >> [RESULT]_%COMPUTERNAME%SRV-022.txt 2>nul
echo SRV-022 END                                                                                >> [RESULT]_%COMPUTERNAME%SRV-022.txt 2>nul
echo ######################################################################################     >> [RESULT]_%COMPUTERNAME%SRV-022.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-022.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-022.txt 2>nul
echo [_RSTART_]                                                                                 >> [RESULT]_%COMPUTERNAME%SRV-022.txt 2>nul
echo [_REND_]                                                                                    >> [RESULT]_%COMPUTERNAME%SRV-022.txt 2>nul
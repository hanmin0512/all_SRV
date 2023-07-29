@echo on
:: 명령 자체가 실행될 ?? 콘솔에 표시되지 않게 해줘요
cls
:: :: 화면 지우기   clear
setlocal
:: 기존 bat파일 영향주지 않게 프로세스 선점하는 환경설정.
PUSHD %~DP0
:: 현재 디렉토리 지정 : PUSHD 이걸 메모리에 올림.     그리고   현재 디렉토리 위치를 배치파일이 실행되는 디렉토리로 변경 설정. 
TITLE SRV-020

echo. SRV-020 START
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-020.txt 2>nul
echo [SRV-020] "공유에 대한 접근 통제 미비"                                                              >> [RESULT]_%COMPUTERNAME%SRV-020.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-020.txt 2>nul
echo [_START_]                                                                                 >> [RESULT]_%COMPUTERNAME%SRV-020.txt 2>nul
echo # 기준 : 일반공유 디렉터리가 없거나 공유 디렉토리 접근 권한에 Everyone이 없을 경우 양호   >> [RESULT]_%COMPUTERNAME%SRV-020.txt 2>nul
echo # 현황                                                                                      >> [RESULT]_%COMPUTERNAME%SRV-020.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-020.txt 2>nul
echo 1. net share 확인 >>                                                                         [RESULT]_%COMPUTERNAME%SRV-020.txt 2>nul
FOR /F "tokens=4 delims= " %%S IN (share_temp.txt) DO (set state=%%S)
:: share_temp.txt 라는 파일에서
:: FOR /F`는 윈도우 CMD에서 사용되는 반복 작업을 수행할 때 사용되는 명령어
:: "tokens=4" 옵션으로 4번째 단어를 가져와서, 
:: `delims`(delimiter)은 `FOR /F` 명령어에서 사용되는 옵션으로, 입력 문자열에서 분리자(delimiter)로 사용할 문자를 지정하므로, 띄어쓰기 까지 구분
:: 그 후에 %%S 변수 = state에 저장한다. DO는 DO 뒤의 괄호 부분을 반복실행될 명령문으로 정의/
IF "%state%" == "RUNNING" (
:: `state` 변수에 저장된 값이 "RUNNING" 이면
   net share | find /v "IPC$" | find /v "command" >>                                              [RESULT]_%COMPUTERNAME%SRV-020.txt 2>nul
:: `net share` 명령어의 출력 결과에서 "IPC$"나 "command"를 제외한 모든 항목을 출력한다. (/v)
:: "|" 기호는 앞의 명령어를 뒤의 명령어로 전달하는 연결자.
   FOR /F "tokens=1 skip=4 " %%j IN ('net share') DO net share %%j >>                             [RESULT]_%COMPUTERNAME%SRV-020.txt 2>nul
::  "net share" 명령어를 실행하여, 실행 결과에서 5번째 줄부터 시작하여 각 줄의 첫 번째 단어(공유 폴더 이름)를 변수로 지정하고, "net share" 명령어를 재실행하여 해당 변수의 값을 출력
) ELSE (
   echo "Share service is not started." >>                                                        [RESULT]_%COMPUTERNAME%SRV-020.txt 2>nul
)
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-020.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-020.txt 2>nul
echo [_END_]                                                                                    >> [RESULT]_%COMPUTERNAME%SRV-020.txt 2>nul
del share_temp.txt
echo SRV-020 END                                                                                >> [RESULT]_%COMPUTERNAME%SRV-020.txt 2>nul
echo ######################################################################################     >> [RESULT]_%COMPUTERNAME%SRV-020.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-020.txt 2>nul
echo.                                                                                           >> [RESULT]_%COMPUTERNAME%SRV-020.txt 2>nul
echo [_RSTART_]                                                                                 >> [RESULT]_%COMPUTERNAME%SRV-020.txt 2>nul
echo [_REND_]                                                                                    >> [RESULT]_%COMPUTERNAME%SRV-020.txt 2>nul
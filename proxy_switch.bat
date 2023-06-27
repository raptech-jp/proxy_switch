@echo off
set regpath="HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings"

for /f "tokens=3" %%A in ('reg query %regpath% /v "ProxyEnable"') do set enable=%%A

if %enable%==0x0 (
  reg add %regpath% /f /v "ProxyEnable" /t reg_dword /d 1
  echo Turn On Proxy Server
) else (
  reg add %regpath% /f /v "ProxyEnable" /t reg_dword /d 0
  echo Turn Off Proxy Server
)
ECHO OFF
ECHO This will disable all internal GPU's and set default GPU to Intel one.
PAUSE
:: Switching to integrated Intel GPU.
setlocal enableextensions
"%~dp0\ext\gpu-switch.exe" -i
CALL %~dp0\ext\gpu-switch\integrated.bat
:: Enabling external Nvidia GPU (Nvidia Geforce 1070)
"%~dp0\ext\devcon.exe" Enable "PCI\VEN_10DE&DEV_1B81*"
:: Disabling AMD GPU (AMD Radeon Pro 450)
"%~dp0\ext\devcon.exe" Disable "PCI\VEN_1002&DEV_67EF*"
PAUSE
:: Disabling Intel GPU (Intel HD Graphics 530) (This will freeze screen, so just calling shutdown after this)
"%~dp0\ext\devcon.exe" Disable "PCI\VEN_8086&DEV_191B*"
shutdown.exe /s /t 00
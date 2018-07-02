ECHO OFF
ECHO This will enable all GPU's and set default GPU to AMD one.
PAUSE
:: Enabling Intel GPU (Intel HD Graphics 530)
"%~dp0\ext\devcon.exe" Enable "PCI\VEN_8086&DEV_191B*"
:: Enabling AMD GPU (AMD Radeon Pro 450)
"%~dp0\ext\devcon.exe" Enable "PCI\VEN_1002&DEV_67EF*"
:: Enabling external Nvidia GPU (Nvidia Geforce 1070)
"%~dp0\ext\devcon.exe" Enable "PCI\VEN_10DE&DEV_1B81*"
:: Switching to dedicated AMD GPU.
setlocal enableextensions
"%~dp0\ext\gpu-switch.exe" -d
shutdown.exe /s /t 00
@echo off

@rem Store all echo in a log file
echo Zabbix Agent 2 Installation Started...
echo Zabbix Agent 2 Installation Started... > E:\Zabbix\zabbix_agent2_install.log

@rem Set the source and destination paths
set "sourcePath=E:\Zabbix\Zabbix Agent 2"
set "destPath=C:\Program Files\Zabbix Agent 2"

@rem Copy Zabbix Agent folder
echo Copying Zabbix Agent folder...
echo Copying Zabbix Agent folder... >> E:\Zabbix\zabbix_agent2_install.log
xcopy /E /I /Y "%sourcePath%" "%destPath%" >> E:\Zabbix\zabbix_agent2_install.log
echo Done.
echo Done. >> E:\Zabbix\zabbix_agent2_install.log

cd "%destPath%"

@rem Install Zabbix Agent
echo Installing Zabbix Agent...
echo Installing Zabbix Agent... >> E:\Zabbix\zabbix_agent2_install.log
.\bin\zabbix_agent2.exe --config .\conf\zabbix_agent2.conf --install >> E:\Zabbix\zabbix_agent2_install.log
echo Done.
echo Done. >> E:\Zabbix\zabbix_agent2_install.log

@rem Start Zabbix Agent
echo Starting Zabbix Agent...
echo Starting Zabbix Agent... >> E:\Zabbix\zabbix_agent2_install.log
.\bin\zabbix_agent2.exe --config .\conf\zabbix_agent2.conf --start >> E:\Zabbix\zabbix_agent2_install.log
echo Done.
echo Done. >> E:\Zabbix\zabbix_agent2_install.log

@rem Set Zabbix Agent service to start automatically
echo Setting Zabbix Agent service to start automatically...
echo Setting Zabbix Agent service to start automatically... >> E:\Zabbix\zabbix_agent2_install.log
sc config "Zabbix Agent 2" start= auto >> E:\Zabbix\zabbix_agent2_install.log
echo Done.
echo Done. >> E:\Zabbix\zabbix_agent2_install.log

@rem Allow Zabbix Agent in Windows Firewall for both private and public networks
echo Allowing Zabbix Agent in Windows Firewall...
echo Allowing Zabbix Agent in Windows Firewall... >> E:\Zabbix\zabbix_agent2_install.log
netsh advfirewall firewall add rule name="Zabbix Agent 2" dir=in action=allow program="%destPath%\bin\zabbix_agent2.exe" enable=yes profile=any >> E:\Zabbix\zabbix_agent2_install.log
echo Done.
echo Done. >> E:\Zabbix\zabbix_agent2_install.log

echo Zabbix Agent installation and configuration completed.
echo Zabbix Agent installation and configuration completed. >> E:\Zabbix\zabbix_agent2_install.log
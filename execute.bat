@echo off

@rem Set the source and destination paths
set "sourcePath=F:\Zabbix Agent 2"
set "destPath=C:\Program Files\Zabbix Agent 2"
set "logPath=F:\zabbix_agent2_install.log"

@rem Store all echo in a log file
echo Zabbix Agent 2 Installation Started...
echo Zabbix Agent 2 Installation Started... > %logPath%


@rem Copy Zabbix Agent folder
echo Copying Zabbix Agent folder...
echo Copying Zabbix Agent folder... >> %logPath%
xcopy /E /I /Y "%sourcePath%" "%destPath%" >> %logPath%
echo Done.
echo Done. >> %logPath%

cd "%destPath%"

@rem Install Zabbix Agent
echo Installing Zabbix Agent...
echo Installing Zabbix Agent... >> %logPath%
.\bin\zabbix_agent2.exe --config .\conf\zabbix_agent2.conf --install >> %logPath%
echo Done.
echo Done. >> %logPath%

@rem Start Zabbix Agent
echo Starting Zabbix Agent...
echo Starting Zabbix Agent... >> %logPath%
.\bin\zabbix_agent2.exe --config .\conf\zabbix_agent2.conf --start >> %logPath%
echo Done.
echo Done. >> %logPath%

@rem Set Zabbix Agent service to start automatically
echo Setting Zabbix Agent service to start automatically...
echo Setting Zabbix Agent service to start automatically... >> %logPath%
sc config "Zabbix Agent 2" start= auto >> %logPath%
echo Done.
echo Done. >> %logPath%

@rem Allow Zabbix Agent in Windows Firewall for both private and public networks
echo Allowing Zabbix Agent in Windows Firewall...
echo Allowing Zabbix Agent in Windows Firewall... >> %logPath%
netsh advfirewall firewall add rule name="Zabbix Agent 2" dir=in action=allow program="%destPath%\bin\zabbix_agent2.exe" enable=yes profile=any >> %logPath%
echo Done.
echo Done. >> %logPath%

echo Zabbix Agent installation and configuration completed.
echo Zabbix Agent installation and configuration completed. >> %logPath%
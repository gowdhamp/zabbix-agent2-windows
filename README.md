# Zabbix Agent 2 Mass Deployment in Windows

## Setup removable disk

- Download the Zabbix Agent 2 Binary files from Github Repository [Download Here](https://github.com/gowtham-surya/zabbix-agent2-windows)
- Load these binaries and batch scrpt into removable disk
- Change your removable disk drive letter to `F:` or Edit the source path of agent2 in `execute.bat` script

## Deployment in Windows

- Insert the removable disk into the destination computer
- Execute the batch script `execute.bat` as administrator
- Check the log in the `zabbix_agent2_install.log` file

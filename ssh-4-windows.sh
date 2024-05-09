@echo off

REM Dummy SSH-sleutelgegevens
set dummy_key_data=-----BEGIN RSA PRIVATE KEY-----
set dummy_key_data=%dummy_key_data%MIIEpAIBAAKCAQEAtI1xCcFCNBF2YgrEaHOBXCHdlyZsDHe3QXfE1j0b8QmbZ/Kg
set dummy_key_data=%dummy_key_data%...
set dummy_key_data=%dummy_key_data%cM1xX8LbMzZ2hTf1wjFY3sSNGRi0XEXJh8FTe9Zlm5ZDYvA5fQQwF4w=
set dummy_key_data=%dummy_key_data%-----END RSA PRIVATE KEY-----

REM Controleer of de juiste parameters zijn opgegeven
if not "%~1"=="" (
    echo Dit script vereist geen argumenten.
    exit /b 1
)

REM Maak de SSH-map aan als deze niet bestaat
set "ssh_dir=%USERPROFILE%\.ssh"
if not exist "%ssh_dir%" mkdir "%ssh_dir%"
attrib +r +s "%ssh_dir%"

REM Maak een dummy SSH-sleutelbestand aan
echo %dummy_key_data% > "%ssh_dir%\id_rsa"
attrib +r +s "%ssh_dir%\id_rsa"

echo Dummy SSH-sleutel is succesvol ingesteld.

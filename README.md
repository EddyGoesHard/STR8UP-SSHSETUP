# SSH-sleutelinstellingscript

Dit script stelt een dummy SSH-sleutel in op zowel Linux- als Windows-systemen. Het kan handig zijn voor testdoeleinden of om een dummy-sleutel in te stellen voor ontwikkelingsomgevingen.

## Gebruik

### Voor Linux:

Voer het volgende uit in de terminal:

```bash
./ssh_4_linux.sh
```

Hier zijn aangepaste versies van het script voor Linux en Windows, met dummygegevens:

### Linux (Bash-script):

```bash
#!/bin/bash

# Dummy SSH-sleutelgegevens
dummy_key_data="-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAtI1xCcFCNBF2YgrEaHOBXCHdlyZsDHe3QXfE1j0b8QmbZ/Kg
...
cM1xX8LbMzZ2hTf1wjFY3sSNGRi0XEXJh8FTe9Zlm5ZDYvA5fQQwF4w=
-----END RSA PRIVATE KEY-----"

# Controleer of de juiste parameters zijn opgegeven
if [ $# -ne 0 ]; then
    echo "Dit script vereist geen argumenten."
    exit 1
fi

# Controleer of de SSH-map bestaat, zo niet, maak deze aan
ssh_dir="$HOME/.ssh"
if [ ! -d "$ssh_dir" ]; then
    mkdir "$ssh_dir"
    chmod 700 "$ssh_dir"
fi

# Maak een dummy SSH-sleutelbestand aan
echo "$dummy_key_data" > "$ssh_dir/id_rsa"
chmod 600 "$ssh_dir/id_rsa"

echo "Dummy SSH-sleutel is succesvol ingesteld."
```

Dit script genereert een dummy SSH-sleutel en plaatst deze in de standaard SSH-map (`~/.ssh/`) op Linux-systemen.

### Windows (Batch-script):

### Voor Windows:

Voer het volgende uit in de terminal:

```bash
./ssh_4_windows.sh
```
### Windows (Bash-script):

```batch
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
```

Dit batch-script genereert een dummy SSH-sleutel en plaatst deze in de standaard SSH-map (`%USERPROFILE%\.ssh`) op Windows-systemen.

## Vereisten
Voor Linux: Bash-shell
Voor Windows: Windows-besturingssysteem met batch-ondersteuning

## Opmerkingen
Dit script maakt een dummy SSH-sleutel aan en plaatst deze in de standaard SSH-map van het gebruikersprofiel.
Voor productiegebruik moeten echte SSH-sleutels worden gegenereerd en correct worden beheerd.
Wees voorzichtig bij het uitvoeren van scripts van onbekende bronnen.

## Bijdragen
Bijdragen zijn welkom! Voel je vrij om bij te dragen door problemen te melden, functieverzoeken in te dienen of pull-aanvragen te maken.

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

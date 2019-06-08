# Instrucciones para desarrollar con Dockers (Junio 2019)


Instalacion de AbadIA para Ubuntu 18.04.02

## Pasos ##

En Chrome descargamos la app de VNC:
https://chrome.google.com/webstore/detail/vnc%C2%AE-viewer-for-google-ch/iabmpiboiopbgfabjmgeedhcmjenhbla/related?utm_source=chrome-app-launcher-info-dialog


Abrimos terminal:

```
git clone https://github.com/LaAbadIAdelCrimen/VigasocoSDL-AI.git
cd VigasocoSDL-AI/extra/Docker/vnc/
docker build -t vigasoco .
docker run -p 4477:4477 -p 5900:5900 vigasoco

```


Abrimos otro nuevo terminal:

```
git clone https://github.com/LaAbadIAdelCrimen/abadia-gym.git
cd abadia-gym/
apt install virtualenv
apt install python3-pip
virtualenv -p python3 python3
source ./python3/bin/activate
pip3 install -r requirements.txt
mkdir -p snapshoots
mkdir -p models
cd models/
wget https://storage.googleapis.com/abadia-data/models/last_model_v6.model
wget https://storage.googleapis.com/abadia-data/models/last_value_v1.model
cd ..
python3 agentv6_ngdqn.py --learning=false --episodes=5 --steps=2000 --initmodel=models/last_model_v6.model
```

 
##  Notas
Para visualizar en el vnc de chrome usar localhost:5900

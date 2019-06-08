## Instalacion Vigasoco+Agente ##

Construir la imagen y lanzar el docker

```
docker build -t abadia-y-agente .
docker run -ti --rm -p 5900:5900 -p 4477:4477 abadia-y-agente
```
Si quieres visualizar el juego, puedes hacerlo desde la vnc de chrome:
https://chrome.google.com/webstore/detail/vnc%C2%AE-viewer-for-google-ch/iabmpiboiopbgfabjmgeedhcmjenhbla/related?utm_source=chrome-app-launcher-info-dialog

Conectando a localhost:5900

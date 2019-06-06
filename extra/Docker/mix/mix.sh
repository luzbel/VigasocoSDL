#!/bin/bash

#TODO: Controlar errores al arrancar X, VNC y Vigasoco
cd /home/abadIA/VigasocoSDL-AI/VigasocoSDL
./loop-abadIA.sh > /tmp/loop-abadIA.log 2>&1 &

#TODO: Esperar a que las X, VNC y Vigasoco hayan arrancado
#TODO: Parametrizar el numero de episodios, pasos, modeo aprendizaje, etc.

cd /home/abadIA/abadia-gym
python3 agentv6_ngdqn.py --episodes=5 --steps=2000 --initmodel=models/last_model_v6.model

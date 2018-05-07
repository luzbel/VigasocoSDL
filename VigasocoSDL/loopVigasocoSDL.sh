#!/bin/bash
while true
do
  nice -15 ./VigasocoSDL abadia -input:libVigasocoFakeInputPlugin.so,FakeInputPlugin  -audio:libVigasocoNULLAudioPlugin.so,NULLAudioPlugin | tee -a /tmp/viga.log
  tail -20 /tmp/viga.log > /tmp/VigasocoSDK.log
done

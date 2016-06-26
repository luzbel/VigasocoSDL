Conversión rápida a PNACL. Funciona en Google Chrome 31
Monta un filesystem por http apuntando a una dirección fija de google drive
Usa un filesystem html5, para así poder guardar y cargar las partidas

TODO
- Cambiar los makefiles que llevan fijada la ruta del SDK 
- Mejorar la pagina html para
-- comprobar bien el soporte de pnacl (ahora sale un alert)
-- sacar los mensajes de salida y poder depurar mejor los errores

INSTRUCCIONES
- Compilar con make -f Makefile.static.PNACL teniendo las siguientes variables de entorno
NACL_SDK_ROOT=/home/vigasocosdl/nacl_sdk/pepper_canary/
#NACL_CFLAGS='-I /home/vigasocosdl/nacl_sdk/pepper_canary/toolchain/linux_pnacl/usr/include/SDL'
#en pepper_38 en adelante es /usr/local/ para SDL 
NACL_CFLAGS='-I /home/vigasocosdl/nacl_sdk/pepper_canary/toolchain/linux_pnacl/usr/local/include/SDL'
PNACL_LDFLAGS='-lSDL -lSDLmain -lnacl_io -lppapi -lnosys -L /home/vigasocosdl/nacl_sdk/pepper_canary/lib/pnacl/Release -lppapi_cpp'
CXX=/home/vigasocosdl/nacl_sdk/pepper_canary/toolchain/linux_pnacl/bin/pnacl-clang++
AR=/home/vigasocosdl/nacl_sdk/pepper_canary/toolchain/linux_pnacl/bin/pnacl-ar
TOOLCHAIN=pnacl
NACL_ARCH=pnacl

- La variable NACL_SDK_ROOT debe coincidir con las rutas fijas puestas en los makefiles


# VigasocoSDL AbadIA version

A branch of VigasocoSDL to allow interaction with the AbadIA project through a REST server.

## Install instructions

### Prerequisites

Create the resources folders

```bash
mkdir VigasocoSDL/audio
mkdir VigasocoSDL/video
mkdir VigasocoSDL/input
```

Make sure your system includes clang, libboost and sdl1.2 . You can install these through

```bash
sudo apt-get install clang libboost-all-dev libsdl1.2-dev
```

or the equivalent package manager for your Linux distribution.

### Compilation

Compile the project with

```bash
CXX=clang LD=clang make
```

## Usage

To launch VigasocoSDL running "La Abadía del Crimen", type

```bash
./VigasocoSDL abadia -audio:libVigasocoNULLAudioPlugin.so,NULLAudioPlugin -input:libVigasocoFakeInputPlugin.so,FakeInputPlugin -input:libVigasocoSDLInputPlugin.so,SDLInputPlugin
```

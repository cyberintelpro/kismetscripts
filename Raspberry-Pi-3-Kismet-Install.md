#Compiling Kismet on a Raspberry Pi 3 Model 3

Kismet runs well on the Raspberry Pi 3.  It is best to use USB Wireless NICs.  The internal wireless chip (BCM43430a1) on the RPI3 requires separately compiled drivers https://github.com/seemoo-lab/nexmon.  

## Install Raspbian

RASPBIAN is an image based on Debian Stretch developed specially for the Raspberry Pi line of devices.

Download latest image (Zip File) https://www.raspberrypi.org/downloads/raspbian/

Image OS to microSD card.  
Etcher is an open source cross platform OS image flasher.  https://etcher.io/

Enable SSH


## Boot

## Add Nexmon Drivers (enables monitor mode for internal chipset)

https://github.com/seemoo-lab/nexmon

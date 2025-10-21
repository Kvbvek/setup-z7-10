## Struktura repozytorium

```text
├── hw                                  - pliki związane z hardware
│   ├── export                          - folder docelowy do umieszczenia plików .xsa
│   │   └── .keep
│   ├── src                             - pliki .v, .sv
│   │   └── axis_counter.v              - licznik axi stream
│   └── vivado                          - folder do pracy z vivado
│       └── .keep 
├── README.md                           - ten plik
├── os                                  - pliki związane z os
│   ├── counter                         - folder projektu petalinux                      
│   └── .keep
├── scripts                             - skrypty
│   └── hw                              - skrypty związane z hw
|       ├── create_project.sh           - skrypt do stworzenia projektu w vivado
|       ├── create_project.tcl
|       ├── generate_bitstream.sh       - skrypt do generowania bitstream - to be fixed...
|       └── generate_bitstream.tcl
├── sw                                  - pliki związane z software
│   ├── host_pc                         - folder z plikami związanymi z PC (host)
│   │   └── counter_udp_receiver.py     - skrypt do odbioru danych
│   └── zynq_ps                         - folder z plikami związanymi z PS/fpga
│       |── ps_sw                       - folder ze skryptami uruchamianymi z poziomu linuxa
|       |   ├── counter_print.py        - skrypt do przetestowania odbioru danych
|       |   └── counter_udp_sender.py   - skrypt do odbioru danych i wysyłu przez UDP
|       └── test                        - folder do testowania układu w vitis
|           └── ...
|── .gitignore
└── env.sh                              - skrypt to konfiguracji środowiska pracy
```

## 1. Projektowanie i implementacja w Vivado

Pierwszym etapem było stworzenie projektu sprzętowego.
Za pomocą kodu generowanego podczas tworzenia custom IP AXI Stream zaimplementowano licznik generujący kolejne wartości powiększone o 1 aż do wyznaczonego limitu (aktualnie ok. 1MB). Dodano do block diagram m.in. Zynq PS, AXI DMA, AXI Stream Data FIFO, i wykonano odpowiednie połączenia.

Block design components:

![Block design screenshot](https://i.imgur.com/knPdo6P.png)

* Generowanie Hardware: Po poprawnym połączeniu wszystkich komponentów, projekt został zwalidowany, a następnie wygenerowano HDL Wrapper i Bitstream. Na koniec wykonano eksport sprzętu w celu uzyskania pliku _.xsa_, który zawiera kompletną definicję układu.

## 2. Weryfikacja IP w Vitis

W celu upewnienia się, że customowy IP działa poprawnie, został stworzony prosty projekt Vitis
* Application Project: Zbudowano projekt aplikacyjny dla procesora Zynq.

* Testowanie: Napisano kod w języku C, który odczytuje kolejne wartości licznika. Pozwoliło to na zweryfikowanie, czy licznik działa zgodnie z oczekiwaniami przed przejściem do konfiguracji petalinux'a.

## 3. Konfiguracja i budowanie projektu Yocto/poky (PetaLinux - deprecated)

Miejsce do tworzenia obrazu - _os/src_

Używane branche - scarthgap

Przebieg tworzenia obrazu:
 
```
source oe-init-build-env
```

Dodanie layerów komendą: 
```
 bitbake-layers add-layer <ścieżka_do_layera>
 ``` 
Plik _build/conf/bblayers.conf_ po dodaniu layerów:

```
# POKY_BBLAYERS_CONF_VERSION is increased each time build/conf/bblayers.conf
# changes incompatibly
POKY_BBLAYERS_CONF_VERSION = "2"

BBPATH = "${TOPDIR}"
BBFILES ?= ""

BBLAYERS ?= " \
  /home/jakub/zybo-os/src/poky/meta \
  /home/jakub/zybo-os/src/poky/meta-poky \
  /home/jakub/zybo-os/src/poky/meta-yocto-bsp \
  /home/jakub/zybo-os/src/meta-arm/meta-arm-toolchain \
  /home/jakub/zybo-os/src/meta-arm/meta-arm \
  /home/jakub/zybo-os/src/meta-openembedded/meta-oe \
  /home/jakub/zybo-os/src/meta-xilinx/meta-xilinx-core \
  /home/jakub/zybo-os/src/meta-xilinx/meta-xilinx-bsp \
  /home/jakub/zybo-os/src/meta-xilinx/meta-xilinx-standalone \
  /home/jakub/zybo-os/src/meta-xilinx-tools \
  "
```

W pliku _build/conf/local.conf_ dodanie linii:
```
MACHINE = "zynq-generic"
```
Więc używamy maszyny defaultowej dla urządzeń z zynq-7000, konfiguracja znajduje się w _meta-xilinx/meta-xilinx-core/conf/machine/zynq-generic.conf_

Tworzenie minimalnego obrazu, narazie nie uwzględniając pliku _.xsa_ wygenerowanego w vivado:

```
bitbake core-image-minimal
```

<!-- Konfiguracja projektu

```
petalinux-create --type project --template zynq --name <NAZWA_PROJEKTU>
cd <NAZWA_PROJEKTU>
petalinux-config --get-hw-description <SCIEZKA_DO_PLIKU_XSA>
```

Konfiguracja jądra Linux.
W ``` petalinux-config -c kernel``` włączono obsługę sterowników UIO (Userspace I/O), co pozwala na bezpieczny dostęp do rejestrów customowego IP z poziomu aplikacji w przestrzeni użytkownika.

Modyfikacja Device Tree Source.
W pliku ``` project-spec/meta-user/recipes-bsp/device-tree/files/system-user.dtsi ``` dodano odpowiedni węzeł, który mapuje IP na sterownik UIO.

```
/include/ "system-conf.dtsi"
/ {
    chosen {
        bootargs = "console=ttyPS0,115200 uio_pdrv_genirq.of_id=generic-uio";
    };
};

&amba_pl {
    axis_0: axis@40400000 {
        compatible = "generic-uio";
        reg = <0x40400000 0x00010000>;
        interrupts = <0 59 4>;   
    };
};
```

Konfiguracja RootFS.
W ``` petalinux-config -c rootfs ``` zainstalowano niezbędne pakiety, w tym Python 3.

Kompilacja i pakowanie
```
petalinux-build
petalinux-package --boot --fsbl images/linux/zynq_fsbl.elf --fpga images/linux/system.bit --u-boot --kernel
``` -->


## 4. Przygotowanie karty SD i uruchomienie
```
sudo umount /dev/sdd1
sudo umount /dev/sdd2
```

Skopiowałem na kartę SD plik _/home/jakub/zybo-os/src/build/tmp/deploy/images/zynq-generic/core-image-minimal-zynq-generic.rootfs.wic.qemu-sd_

```
sudo dd if=core-image-minimal-zynq-generic.rootfs.wic.qemu-sd of=/dev/sdd bs=4M status=progress
```

Niestety w folderze _build/tmp/deploy/images_ brakowało pliku BOOT.bin, więc początkowo podczas bootowania, po połączeniu przez UART nic się nie wyświetlało. Skopiowałem wcześniej używany plik BOOT.bin na kartę SD, który był wygenerowany przy użyciu Petalinux i system ruszył, natomiast jest to chwilowe rozwiązanie, bo nie byłem stanie w prosty sposób na szybko naprawić tak żeby również BOOT.bin został wygenerowany używając yocto.

![Yocto linux](https://i.imgur.com/OsvhZDm.png)

## 5. Komunikacja i testowanie
Ostatecznym celem było przesłanie danych z licznika do komputera PC.
* Skrypt na Zybo (_counter_udp_sender.py_): Po uruchomieniu Linuksa na płytce, skrypt w Pythonie odczytuje wartość licznika i wysyła ją przez sieć UDP do komputera PC.
* Skrypt na PC (_counter_udp_receiver.py_): Na komputerze PC działa skrypt w Pythonie, który nasłuchuje na porcie UDP i odbiera dane, wyświetlając aktualną wartość licznika.

## Działanie aplikacji:
Aktualnie dostosowane skrypty do 1MB transferu to _counter_print.py_ oraz kod napisany w C do testowania w Vitis. Aplikacje działają w trybie pollingu. Pozostałe skrypty to starsze wersje do mniejszego transferu. Proszę je ignorować w obecnym stanie.

Aktualny problem:
Początkowe wartości generowane w PL są ucinane i odbierane dane są "przesunięte" tzn. zamiast 0,1,2,3... jest 12,13,14... Końcowa wartość jest poprawna i zgodna z kodem licznika. Innymi słowy brakuje początkowych wartości. 

Podobny problem występuje na etapie testowania układu w vitis, gdzie początkowe dane również są ucięte, natomiast zaczynają się od 4,5,6... 

### Wynik działania skryptu _counter_print.py_ uruchomionego z poziomu linuxa
![screenshot](https://i.imgur.com/sdvcgZI.png)

### Konfiguracja AXI DMA i FIFO
![screenshot](https://i.imgur.com/yMFJVPl.png)
![screenshot](https://i.imgur.com/tXEeP6l.png)


W celu przeprowadzenia większych transferów niż 1MB, np. 100MB czy 1GB prawdopodobnie potrzebne będą modyfikację ponieważ length buffer w axi dma jest ustawiany na 2^26 czyli około 64MB, co jest maksymalną wartością. Transfer w jednym "rzucie" będzie niemożliwy i trzeba będzie nanieść lekkie poprawki, natomiast priorytetem aktualnie jest identyfikacja wyżej opisanego błędu.
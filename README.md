## Praca z repozytorium
```
git clone --recursive git@github.com:Kvbvek/setup-z7-10.git
```

## Inicjalizacja środowiska
Aby rozpocząć pracę z projektem, należy uruchomić terminal w folderze projektu i zainicjalizować środowisko:
```bash
source env.sh
```

W folderze tools znajdują się skrypty przydatne do pracy z projektem:
* `gen_xsa.sh` - generuje plik z konfiguracją sprzętową (_.xsa_)
* `gen_machine.sh` - generuje na podstawie pliku _.xsa_ customową maszynę używaną potem do budowania obrazu linuxa
* `flash_wic_to_sd.sh` - kopiuje plik _.wic_ na kartę sd

Skrypty należy wywoływać z folderu _tools_

***Wszelkie ścieżki, nazwy partycji i inne zmienne zostały przystosowane do mojej maszyny i mogą się różnić w razie potrzeby pracy na innych PC.***



## 1. Projektowanie i implementacja w Vivado

Pierwszym etapem było stworzenie projektu sprzętowego.

## 2. Konfiguracja i budowanie obrazu systemu z użyciem Yocto/poky

Miejsce do tworzenia obrazu - _sw/arm_

Używane branche - **scarthgap**

https://github.com/Xilinx/meta-xilinx/blob/master/README.building.md

Przebieg tworzenia obrazu:

Następnie aby uwzględnić konfiguracje sprzętową z pliku _.xsa_:

https://github.com/Xilinx/meta-xilinx-tools/blob/master/README.xsct.bsp.md

Generowanie maszyny z użyciem skryptu _tools/gen_machine.sh_
w pliku _build/conf/local.conf_ pojawiły się m.in.
* MACHINE = "<nazwa maszyny, np. zybo-agh>" 

Następnie:

```
bitbake zybo-agh-image-minimal
```

lub 

```
bitbake zybo-agh-image-base
```

## 3. Przygotowanie karty SD i uruchomienie
```
sudo umount /dev/sdd1
sudo umount /dev/sdd2
```

Ewentualnie _sdd*_ odpowiednio zastąpić

Skopiowanie na kartę SD plik _/home/jakub/zybo-os/src/build/tmp/deploy/images/<nazwa używanej maszyny>/<nazwa budowanego obrazu>-<nazwa używanej maszyny>.rootfs.wic_ 

```
sudo dd if=<nazwa budowanego obrazu>-<nazwa używanej maszyny>.rootfs.wic of=/dev/sdd bs=1M status=progress
```

Przykładowa ścieżka do pliku .wic - _/home/jakub/zybo-os/src/build/tmp/deploy/images/zybo-agh/zybo-agh-image-minimal-zybo-agh.rootfs.wic_

Skrypt do kopiowania _.wic_ na kartę SD - _tools/flash_wic_to_sd.sh_

## 4. Komunikacja i testowanie
* Skrypt na Zybo (_data_udp_tx.py_)
* Skrypt na PC (_data_udp_rx.py_) 

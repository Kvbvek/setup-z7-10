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

## 3. Konfiguracja i budowanie obrazu systemu z użyciem Yocto/poky

Miejsce do tworzenia obrazu - _sw/arm_

Używane branche - **scarthgap**

https://github.com/Xilinx/meta-xilinx/blob/master/README.building.md

Przebieg tworzenia obrazu:

Następnie aby uwzględnić konfiguracje sprzętową z pliku _.xsa_:

https://github.com/Xilinx/meta-xilinx-tools/blob/master/README.xsct.bsp.md

<!-- Po użyciu komendy _**gen-machineconf**_ w pliku _build/conf/local.conf_ pojawiły się m.in.
* MACHINE = "<nazwa maszyny podana przy wywołaniu gen-machineconf>" -->

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


## 4. Przygotowanie karty SD i uruchomienie
```
sudo umount /dev/sdd1
sudo umount /dev/sdd2
```

Ewentualnie _sdd*_ odpowiednio zastąpić

Skopiowanie na kartę SD plik _/home/jakub/zybo-os/src/build/tmp/deploy/images/<nazwa używanej maszyny>/<nazwa budowanego obrazu>-<nazwa używanej maszyny>.rootfs.wic_ 

```
sudo dd if=<nazwa budowanego obrazu>-<nazwa używanej maszyny>.rootfs.wic of=/dev/sdd bs=1M status=progress
```

Przykładowa ścieżka do pliku .wic -  _/home/jakub/zybo-os/src/build/tmp/deploy/images/zybo-agh/zybo-agh-image-minimal-zybo-agh.rootfs.wic_

Skrypt do kopiowania _.wic_ na kartę SD - _tools/flash_wic_to_sd.sh_

<!-- ![Yocto linux](https://i.imgur.com/OsvhZDm.png) -->

<!-- ![Yocto linux](https://i.imgur.com/MFwtr8m.png) -->

## 5. Komunikacja i testowanie
Ostatecznym celem było przesłanie danych z licznika do komputera PC.
* Skrypt na Zybo (_data_udp_tx.py_): Po uruchomieniu Linuxa na płytce, skrypt w Pythonie odczytuje wartość licznika i wysyła ją przez sieć UDP do komputera PC.
* Skrypt na PC (_counter_udp_receiver.py_): Na komputerze PC działa skrypt w Pythonie, który nasłuchuje na porcie UDP i odbiera dane, wyświetlając aktualną wartość licznika.

## Działanie aplikacji:
Aktualnie dostosowane skrypty do 1MB transferu to _data_print.py_ oraz kod napisany w C do testowania w Vitis. Aplikacje działają w trybie pollingu. Pozostałe skrypty to starsze wersje do mniejszego transferu. Proszę je ignorować w obecnym stanie.

Aktualny problem:
Początkowe wartości generowane w PL są ucinane i odbierane dane są "przesunięte" tzn. zamiast 0,1,2,3... jest 12,13,14... Końcowa wartość jest poprawna i zgodna z kodem licznika. Innymi słowy brakuje początkowych wartości. 

Podobny problem występuje na etapie testowania układu w vitis, gdzie początkowe dane również są ucięte, natomiast zaczynają się od 4,5,6... 

### Wynik działania skryptu _counter_print.py_ uruchomionego z poziomu linuxa
![screenshot](https://i.imgur.com/sdvcgZI.png)

### Konfiguracja AXI DMA i FIFO
![screenshot](https://i.imgur.com/yMFJVPl.png)
![screenshot](https://i.imgur.com/tXEeP6l.png)


W celu przeprowadzenia większych transferów niż 1MB, np. 100MB czy 1GB prawdopodobnie potrzebne będą modyfikację ponieważ length buffer w axi dma jest ustawiany na 2^26 czyli około 64MB, co jest maksymalną wartością. Transfer w jednym "rzucie" będzie niemożliwy i trzeba będzie nanieść lekkie poprawki, natomiast priorytetem aktualnie jest identyfikacja wyżej opisanego błędu.

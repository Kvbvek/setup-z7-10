## 1. Projektowanie i implementacja w Vivado

Pierwszym etapem było stworzenie projektu sprzętowego.
* Custom IP: Został zaimplementowany prosty licznik w języku Verilog, który został spakowany jako własny moduł AXI4-Lite Peripheral.

* Block Design: W projekcie Vivado stworzono diagram blokowy, zawierający standardowy ZYNQ7 Processing System (PS) oraz customowy IP. Połączenia zostały zrealizowane za pomocą magistrali AXI.

* Generowanie Hardware: Po poprawnym połączeniu wszystkich komponentów, projekt został zwalidowany, a następnie wygenerowano HDL Wrapper i Bitstream. Na koniec wykonano eksport sprzętu w celu uzyskania pliku _.xsa_, który zawiera kompletną definicję układu.

## 2. Weryfikacja IP w Vitis

W celu upewnienia się, że customowy IP działa poprawnie, został stworzony prosty projekt Vitis
* Application Project: Zbudowano projekt aplikacyjny dla procesora Zynq.

* Testowanie: Napisano kod w języku C, który komunikuje się z licznikiem za pomocą magistrali AXI4-Lite, odczytując jego wartość. Pozwoliło to na zweryfikowanie, czy licznik działa zgodnie z oczekiwaniami przed przejściem do konfiguracji petalinux'a.

## 3. Konfiguracja i budowanie projektu PetaLinux

Konfiguracja projektu

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
    my_counter@43C00000 {
        compatible = "generic-uio";
        reg = <0x43C00000 0x1000>;
    };

    chosen {
        bootargs = "console=ttyPS0,115200 earlyprintk uio_pdrv_genirq.of_id=generic-uio";
    };
};
```

``` my_counter@43C00000 ``` : Nazwa i adres IP, który został przypisany w Vivado.

``` compatible = "generic-uio" ``` : Powiązanie z ogólnym sterownikiem UIO.

``` reg = <0x43C00000 0x1000> ``` : Adres bazowy i rozmiar przestrzeni pamięci IP.

Konfiguracja RootFS
W ``` petalinux-config -c rootfs ``` zainstalowano niezbędne pakiety, w tym Python 3.

Kompilacja i pakowanie
```
petalinux-build
petalinux-package --boot --fsbl images/linux/zynq_fsbl.elf --fpga images/linux/system.bit --u-boot --kernel
```

## 4. Przygotowanie karty SD i uruchomienie

## 5. Komunikacja i testowanie
Ostatecznym celem było przesłanie danych z licznika do komputera PC.
* Skrypt na Zybo (_counter_udp_sender.py_): Po uruchomieniu Linuksa na płytce, skrypt w Pythonie odczytuje wartość licznika z przestrzeni UIO i wysyła ją przez sieć UDP do komputera PC.
* Skrypt na PC (_counter_udp_receiver.py_): Na komputerze PC działa skrypt w Pythonie, który nasłuchuje na porcie UDP i odbiera dane, wyświetlając aktualną wartość licznika.
#include "xparameters.h"
#include "xil_io.h"
#include "xuartps.h"
#include "xil_printf.h"

#define COUNTER_BASE_ADDR 0x43C00000

int main() {
    XUartPs uart;
    XUartPs_Config *uart_cfg;

    // Inicjalizacja UART PS (UART0)
    uart_cfg = XUartPs_LookupConfig(XPAR_XUARTPS_0_DEVICE_ID);
    if (!uart_cfg) return -1;

    if (XUartPs_CfgInitialize(&uart, uart_cfg, uart_cfg->BaseAddress) != XST_SUCCESS)
        return -1;

    // UART - ustawienia (opcjonalnie)
    XUartPs_SetBaudRate(&uart, 115200);

    while (1) {
        u32 value = Xil_In32(COUNTER_BASE_ADDR);

        // Wypisanie wartości przez UART w formacie heksadecymalnym
        xil_printf("Counter value: 0x%08X\r\n", value);

        // Małe opóźnienie (~1s)
        for (volatile int i = 0; i < 10000000; i++);
    }

    return 0;
}

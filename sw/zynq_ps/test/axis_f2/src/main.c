#include "xparameters.h"
#include "xaxidma.h"
#include "xil_printf.h"
#include "xil_io.h"
#include "sleep.h"

#define DMA_DEV_ID       XPAR_AXIDMA_0_DEVICE_ID
#define MEM_BASE_ADDR    0x01000000  // DDR memory address for buffer
#define MAX_PKT_LEN      150          // number of counter values to read

XAxiDma AxiDma;

int main()
{
    int Status;
    u32 *RxBufferPtr = (u32 *)MEM_BASE_ADDR;
    int i;

    xil_printf("Starting DMA AXI Stream test\r\n");

    // Initialize the DMA
    XAxiDma_Config *CfgPtr = XAxiDma_LookupConfig(DMA_DEV_ID);
    if (!CfgPtr) {
        xil_printf("No config found for DMA\r\n");
        return XST_FAILURE;
    }

    Status = XAxiDma_CfgInitialize(&AxiDma, CfgPtr);
    if (Status != XST_SUCCESS) {
        xil_printf("DMA Initialization failed\r\n");
        return XST_FAILURE;
    }

    if(XAxiDma_HasSg(&AxiDma)){
        xil_printf("DMA configured in SG mode, but simple mode expected\r\n");
        return XST_FAILURE;
    }

    xil_printf("DMA Initialized successfully\r\n");

    // Start RX transfer
    xil_printf("Starting DMA RX transfer\r\n");
    Status = XAxiDma_SimpleTransfer(&AxiDma, (u32)RxBufferPtr, MAX_PKT_LEN * sizeof(u32), XAXIDMA_DEVICE_TO_DMA);
    if(Status != XST_SUCCESS){
        xil_printf("DMA RX transfer failed\r\n");
        return XST_FAILURE;
    }

    // Wait until the DMA transfer is done
    while(XAxiDma_Busy(&AxiDma, XAXIDMA_DEVICE_TO_DMA));

    xil_printf("DMA transfer complete. Received data:\r\n");

    // Print received counter values
    for(i = 0; i < MAX_PKT_LEN; i++){
        xil_printf("Data[%d] = %d\r\n", i, RxBufferPtr[i]);
    }

    xil_printf("Test complete\r\n");

    while(1); // Loop forever
    return 0;
}

/**********************************************************************************************************************
 *  FILE DESCRIPTION
 *  -------------------------------------------------------------------------------------------------------------------
 *  File:         apb_defines.sv
 *
 *  Description:  
 * 
 *********************************************************************************************************************/

  `ifndef APB_DEFINES
    `define APB_DEFINES

    `ifndef APB_DATA_WIDTH
      `define APB_DATA_WIDTH 32
    `endif

    `ifndef APB_ADDR_WIDTH
      `define APB_ADDR_WIDTH 32
    `endif 

    `ifndef APB_MEM_SIZE
      `define APB_MEM_SIZE 64
    `endif

    `ifndef APB_MEM_BLOCK_SIZE
      `define APB_MEM_BLOCK_SIZE 8
    `endif    

    `ifndef APB_CLK_FREQ_MHZ
      `define APB_CLK_FREQ_MHZ 50
    `endif 

    `ifndef MIN_CYCLES_DELAY
      `define MIN_CYCLES_DELAY 10
    `endif 

    `ifndef MAX_CYCLES_DELAY
      `define MAX_CYCLES_DELAY 30
    `endif 
  `endif

/**********************************************************************************************************************
*  END OF FILE: apb_defines.sv
*********************************************************************************************************************/
/**********************************************************************************************************************
 *  FILE DESCRIPTION
 *  -------------------------------------------------------------------------------------------------------------------
 *  File:         apb_tb_top.sv
 *
 *  Description:  
 * 
 *********************************************************************************************************************/
 
  `include "uvm_macros.svh"
  `include "apb_pkg.sv"

  `timescale 1ns/1ps

  module tb_top;
    // required packages
    import uvm_pkg::*;
    import apb_pkg::*;

    // clock signal
    bit CLK;

    // interface instance
    apb_if apb_if0 (CLK);

    // DUT instance 
    apb_v3_sram #(
      .ADDR_BUS_WIDTH     (`APB_ADDR_WIDTH), 
      .DATA_BUS_WIDTH     (`APB_ADDR_WIDTH), 
      .MEMSIZE            (`APB_MEM_SIZE), 
      .MEM_BLOCK_SIZE     (`APB_MEM_BLOCK_SIZE), 
      .RESET_VAL          (0), 
      .EN_WAIT_DELAY_FUNC (0), 
      .MIN_RAND_WAIT_CYC  (0), 
      .MAX_RAND_WAIT_CYC  (8)
    ) dut (
      .PCLK    (apb_if0.PCLK), 
      .PRESETn (apb_if0.PRESETn), 
      .PSEL    (apb_if0.PSEL), 
      .PENABLE (apb_if0.PENABLE), 
      .PWRITE  (apb_if0.PWRITE), 
      .PADDR   (apb_if0.PADDR), 
      .PWDATA  (apb_if0.PWDATA), 
      .PRDATA  (apb_if0.PRDATA), 
      .PREADY  (apb_if0.PREADY), 
      .PSLVERR (apb_if0.PSLVERR) 
    );

    // clock generation
    initial begin
      CLK = 1;
      forever #10 CLK = ~ CLK;
    end

    // passing virtual interace and starting test
    initial begin 
      uvm_config_db #(virtual apb_if)::set(null,"uvm_test_top","apb_vif",apb_if0);
      run_test();
    end 
  endmodule 

/**********************************************************************************************************************
*  END OF FILE: apb_tb_top.sv
*********************************************************************************************************************/
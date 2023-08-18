/**********************************************************************************************************************
 *  FILE DESCRIPTION
 *  -------------------------------------------------------------------------------------------------------------------
 *  File:         apb_if.sv
 *
 *  Description:  
 * 
 *********************************************************************************************************************/

  `ifndef APB_IF
    `define APB_IF

    interface apb_if (input PCLK);
      logic                       PRESETn; // active low reset
      logic                       PSEL;    // select signal
      logic                       PENABLE; // enable signal
      logic                       PWRITE;  // write strobe
      logic [`APB_ADDR_WIDTH-1:0] PADDR;   // address
      logic [`APB_DATA_WIDTH-1:0] PWDATA;  // write data
      logic [`APB_DATA_WIDTH-1:0] PRDATA;  // read data 
      logic                       PREADY;  // slave ready signal
      logic                       PSLVERR; // slave error responce

      // to match the reset signal used in the reset driver
      logic rst;
      assign rst = PRESETn;

      // clocking block to prevent racing conditions
      clocking cb @ (posedge PCLK);
        default input #1step output #0;
        input PRDATA, PREADY, PSLVERR;
        output PSEL, PENABLE, PWRITE, PADDR, PWDATA;
      endclocking

      // value of signals at different states
      sequence idle_phase;
        !PSEL;
      endsequence

      sequence setup_phase;
        PSEL && !PENABLE;
      endsequence

      sequence access_phase_wait;
        PSEL && PENABLE && !PREADY;
      endsequence

      sequence access_phase_last;
        PSEL && PENABLE && PREADY;
      endsequence

      // possible state transitions
      property p_idle_state;
        @(posedge PCLK) disable iff (!PRESETn)
        idle_phase |=> idle_phase or setup_phase;
      endproperty
      a_idle_state: assert property (p_idle_state);

      property p_setup_phase;
        @(posedge PCLK) disable iff (!PRESETn)
        setup_phase |=> access_phase_wait or access_phase_last;
      endproperty
      a_setup_phase: assert property (p_setup_phase);

      property p_access_wait_state;
        @(posedge PCLK) disable iff (!PRESETn)
        access_phase_wait |=> access_phase_wait or access_phase_last;
      endproperty
      a_access_wait_state: assert property (p_access_wait_state);

      property p_access_phase_last;
        @(posedge PCLK) disable iff (!PRESETn)
        access_phase_last |=> idle_phase or setup_phase;
      endproperty
      a_access_phase_last: assert property (p_access_phase_last);
    endinterface 
  `endif

/**********************************************************************************************************************
*  END OF FILE: apb_if.sv
*********************************************************************************************************************/
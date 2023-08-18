/**********************************************************************************************************************
 *  FILE DESCRIPTION
 *  -------------------------------------------------------------------------------------------------------------------
 *  File:         apb_sequencer.sv
 *
 *  Description:  
 * 
 *********************************************************************************************************************/

  `ifndef APB_SEQUENCER
    `define APB_SEQUENCER

    class apb_sequencer extends uvm_sequencer #(apb_seq_item);
      `uvm_component_utils(apb_sequencer)

      function new(string name = "apb_sequencer", uvm_component parent = null);
        super.new(name,parent);
      endfunction
      
      function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("BUILD_PHASE", "apb_sequencer.", UVM_HIGH)
      endfunction

      function void connect_phase (uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("CONNECT_PHASE", "apb_sequencer.", UVM_HIGH)
      endfunction

      task run_phase (uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("RUN_PHASE", "apb_sequencer.", UVM_HIGH)
      endtask
    endclass 
  `endif

/**********************************************************************************************************************
*  END OF FILE: apb_sequencer.sv
*********************************************************************************************************************/
/**********************************************************************************************************************
 *  FILE DESCRIPTION
 *  -------------------------------------------------------------------------------------------------------------------
 *  File:         apb_subscriber.sv
 *
 *  Description:  
 * 
 *********************************************************************************************************************/

  `ifndef APB_SUBSCRIBER
    `define APB_SUBSCRIBER

    class apb_subscriber extends uvm_subscriber #(apb_seq_item);
      `uvm_component_utils(apb_subscriber)

      apb_seq_item m_item;

      covergroup apb_cov_grp;
      endgroup 

      function new(string name = "apb_subscriber", uvm_component parent = null);
        super.new(name,parent);
        apb_cov_grp = new();
      endfunction

      function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("BUILD_PHASE", "apb_subscriber.", UVM_HIGH)
      endfunction

      function void write (apb_seq_item t);
        m_item = t; 
        apb_cov_grp.sample();
      endfunction
    endclass 
  `endif

/**********************************************************************************************************************
*  END OF FILE: apb_subscriber.sv
*********************************************************************************************************************/
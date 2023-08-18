/**********************************************************************************************************************
 *  FILE DESCRIPTION
 *  -------------------------------------------------------------------------------------------------------------------
 *  File:         apb_monitor.sv
 *
 *  Description:  
 * 
 *********************************************************************************************************************/

  `ifndef APB_MONITOR
    `define APB_MONITOR
    
    class apb_monitor extends uvm_monitor;
      `uvm_component_utils(apb_monitor)

      apb_seq_item m_in_item, m_out_item;
      apb_seq_item m_in_cloned_item, m_out_cloned_item;

      apb_agent_config m_cfg;

      virtual apb_if m_vif;

      uvm_analysis_port #(apb_seq_item) m_in_port; 
      uvm_analysis_port #(apb_seq_item) m_out_port; 
      
      function new(string name = "apb_monitor", uvm_component parent = null);
        super.new(name,parent);
      endfunction

      function void build_phase (uvm_phase phase);
        super.build_phase(phase);

        if(!(uvm_config_db#(apb_agent_config)::get(this,"","apb_agent_cfg",m_cfg)))
          `uvm_fatal(get_full_name(),"Error! apb_monitor failed to receive m_cfg.")

        m_in_port  = new("m_in_port",this);
        m_out_port = new("m_out_port",this);

        `uvm_info("BUILD_PHASE", "apb_monitor.", UVM_HIGH)
      endfunction
      
      function void connect_phase (uvm_phase phase);
        super.connect_phase(phase);

        m_vif = m_cfg.m_vif;

        `uvm_info("CONNECT_PHASE", "apb_monitor.", UVM_HIGH)
      endfunction

      task run_phase (uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("RUN_PHASE", "apb_monitor.", UVM_HIGH)

  /*
        forever begin
          fork 
            collect_transaction ();
          join
        end
  */
      endtask

  /*
      task collect_transaction ();
        @ (m_vif.cb)
        while ()
      endtask
  */
    endclass 
  `endif

/**********************************************************************************************************************
*  END OF FILE: apb_monitor.sv
*********************************************************************************************************************/
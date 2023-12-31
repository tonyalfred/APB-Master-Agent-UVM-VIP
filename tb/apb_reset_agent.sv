/**********************************************************************************************************************
 *  FILE DESCRIPTION
 *  -------------------------------------------------------------------------------------------------------------------
 *  File:         apb_reset_agent.sv
 *
 *  Description:  
 * 
 *********************************************************************************************************************/

  `ifndef APB_RESET_AGENT
    `define APB_RESET_AGENT

    class apb_reset_agent extends uvm_agent;
      `uvm_component_utils (apb_reset_agent)
      
      apb_reset_sequencer m_sequencer;
      apb_reset_driver    m_driver;
      
      apb_agent_config m_cfg;
      
      function new(string name = "apb_reset_agent", uvm_component parent = null);
        super.new(name, parent);
      endfunction
      
      function void build_phase (uvm_phase phase);
        super.build_phase (phase);

        if(!(uvm_config_db#(apb_agent_config)::get(this,"","apb_agent_cfg",m_cfg)))
          `uvm_fatal(get_full_name(),"Error! apb_reset_agent failed to receive m_cfg.")

        m_sequencer = apb_reset_sequencer::type_id::create("m_sequencer",this);
        m_driver = apb_reset_driver::type_id::create("m_driver",this);

        `uvm_info("BUILD_PHASE", "apb_reset_agent.", UVM_HIGH)
      endfunction
        
      function void connect_phase (uvm_phase phase);
        super.connect_phase(phase);

        m_driver.seq_item_port.connect(m_sequencer.seq_item_export);

        `uvm_info("CONNECT_PHASE", "apb_reset_agent.", UVM_HIGH)
      endfunction

      task run_phase (uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("RUN_PHASE", "apb_reset_agent.", UVM_HIGH)
      endtask
    endclass 
  `endif

/**********************************************************************************************************************
*  END OF FILE: apb_reset_agent.sv
*********************************************************************************************************************/
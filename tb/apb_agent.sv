/**********************************************************************************************************************
 *  FILE DESCRIPTION
 *  -------------------------------------------------------------------------------------------------------------------
 *  File:         apb_agent.sv
 *
 *  Description:  
 * 
 *********************************************************************************************************************/

  `ifndef APB_AGENT
    `define APB_AGENT

    class apb_agent extends uvm_agent;
      `uvm_component_utils (apb_agent)
      
      apb_sequencer  m_sequencer;
      apb_driver     m_driver;
      apb_monitor    m_monitor;
      apb_subscriber m_subscriber;         

      apb_agent_config m_cfg;

      uvm_analysis_port #(apb_seq_item) m_in_port;
      uvm_analysis_port #(apb_seq_item) m_out_port; 
      
      function new(string name = "apb_agent", uvm_component parent = null);
        super.new(name, parent);
      endfunction
      
      function void build_phase (uvm_phase phase);
        super.build_phase (phase);

        if(!(uvm_config_db#(apb_agent_config)::get(this,"","apb_agent_cfg",m_cfg)))
          `uvm_fatal(get_full_name(),"Error! apb_agent failed to receive m_cfg.")

        m_monitor = apb_monitor::type_id::create("m_monitor",this);
    
        if (m_cfg.get_is_active() == UVM_ACTIVE) begin
          m_sequencer = apb_sequencer::type_id::create("m_sequencer",this);
          m_driver = apb_driver::type_id::create("m_driver",this);
        end

        if (m_cfg.get_has_coverage() == 1) begin
          m_subscriber = apb_subscriber::type_id::create("subscriber",this);
        end
            
        m_in_port = new ("m_in_port",this);
        m_out_port = new ("m_out_port",this);

        `uvm_info("BUILD_PHASE", "apb_agent.", UVM_HIGH)
      endfunction
        
      function void connect_phase (uvm_phase phase);
        super.connect_phase(phase);
    
        m_monitor.m_in_port.connect(m_in_port);
        m_monitor.m_out_port.connect(m_out_port);
      
        if (m_cfg.get_is_active() == UVM_ACTIVE) begin
          m_driver.seq_item_port.connect(m_sequencer.seq_item_export);
        end

        if (m_cfg.get_has_coverage() == 1) begin
          m_monitor.m_in_port.connect(m_subscriber.analysis_export);
        end

        `uvm_info("CONNECT_PHASE", "apb_agent.", UVM_HIGH)
      endfunction

      task run_phase (uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("RUN_PHASE", "apb_agent.", UVM_HIGH)
      endtask
    endclass 
  `endif

/**********************************************************************************************************************
*  END OF FILE: apb_agent.sv
*********************************************************************************************************************/
/**********************************************************************************************************************
 *  FILE DESCRIPTION
 *  -------------------------------------------------------------------------------------------------------------------
 *  File:         apb_test.sv
 *
 *  Description:  
 * 
 *********************************************************************************************************************/

  `ifndef APB_TEST
    `define APB_TEST

    class apb_base_test extends uvm_test;
      `uvm_component_utils(apb_base_test)

      apb_env m_env;
      apb_agent_config m_agt0_cfg;

      function new(string name = "apb_base_test", uvm_component parent = null);
        super.new(name,parent);
      endfunction

      function void build_phase (uvm_phase phase);
        super.build_phase(phase);

        m_env = apb_env::type_id::create("m_env",this);
        m_agt0_cfg = apb_agent_config::type_id::create("m_agt0_cfg");

        if(!(uvm_config_db #(virtual apb_if)::get(this,"","apb_vif",m_agt0_cfg.m_vif)))
          `uvm_fatal(get_full_name(),"Error! apb_base_test failed to receive apb_vif.")

        m_agt0_cfg.set_is_active(UVM_ACTIVE);
        m_agt0_cfg.set_has_coverage(1);

        uvm_config_db #(apb_agent_config)::set(this, "m_env.m_agent0*", "apb_agent_cfg", m_agt0_cfg);
        uvm_config_db #(apb_agent_config)::set(this, "m_env.m_reset_agent0*", "apb_agent_cfg", m_agt0_cfg);

        `uvm_info("BUILD_PHASE", "apb_base_test.", UVM_HIGH)
      endfunction

      function void connect_phase (uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("CONNECT_PHASE", "apb_base_test.", UVM_HIGH)
      endfunction

      function void init_vseq (apb_base_vseq vseq);
        vseq.m_apb_reset_seqr = m_env.m_reset_agent0.m_sequencer;
        vseq.m_apb_data_seqr  = m_env.m_agent0.m_sequencer;
      endfunction
    endclass
      
    class apb_test extends apb_base_test;
      `uvm_component_utils(apb_test)

      apb_vseq m_vseq;

      function new(string name = "apb_test", uvm_component parent = null);
        super.new(name,parent);
      endfunction

      function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("BUILD_PHASE", "apb_test.", UVM_HIGH)
      endfunction

      function void connect_phase (uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("CONNECT_PHASE", "apb_test.", UVM_HIGH)
      endfunction    

      task run_phase (uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("RUN_PHASE", "apb_test.", UVM_HIGH)

        m_vseq = apb_vseq::type_id::create("m_vseq");
      
        phase.raise_objection(this);
        init_vseq(m_vseq);
        m_vseq.start(null);
        phase.drop_objection(this);
      endtask
    endclass 
  `endif

/**********************************************************************************************************************
*  END OF FILE: apb_test.sv
*********************************************************************************************************************/
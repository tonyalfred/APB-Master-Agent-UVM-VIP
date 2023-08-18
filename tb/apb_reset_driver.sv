/**********************************************************************************************************************
 *  FILE DESCRIPTION
 *  -------------------------------------------------------------------------------------------------------------------
 *  File:         apb_reset_driver.sv
 *
 *  Description:  
 * 
 *********************************************************************************************************************/

  `ifndef APB_RESET_DRIVER
    `define APB_RESET_DRIVER

    class apb_reset_driver extends uvm_driver #(apb_reset_item);
      `uvm_component_utils(apb_reset_driver)

      apb_reset_item m_item;

      apb_agent_config m_cfg;
      virtual apb_if m_vif;

      function new(string name = "apb_reset_driver", uvm_component parent = null);
        super.new(name,parent);
      endfunction

      function void build_phase (uvm_phase phase);
        super.build_phase(phase);

        if(!(uvm_config_db#(apb_agent_config)::get(this,"","apb_agent_cfg",m_cfg)))
          `uvm_fatal(get_full_name(),"Error! apb_reset_driver failed to receive m_cfg.")
        
        `uvm_info("BUILD_PHASE", "apb_reset_driver.", UVM_HIGH)
      endfunction

      function void connect_phase (uvm_phase phase);
        super.connect_phase(phase);

        m_vif = m_cfg.m_vif;

        `uvm_info("CONNECT_PHASE", "apb_reset_driver.", UVM_HIGH)
      endfunction

      task run_phase (uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("RUN_PHASE", "apb_reset_driver.", UVM_HIGH)

        forever begin
          seq_item_port.get_next_item(m_item);
          reset(m_item);
          seq_item_port.item_done();
        end
      endtask

      task reset(apb_reset_item item);   
        m_vif.rst <= 1'b0;
        #(item.reset_time_ps * 1ps);
        m_vif.rst <= 1'b1;
      endtask
    endclass 
  `endif

/**********************************************************************************************************************
*  END OF FILE: apb_reset_driver.sv
*********************************************************************************************************************/
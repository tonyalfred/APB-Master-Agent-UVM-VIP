/**********************************************************************************************************************
 *  FILE DESCRIPTION
 *  -------------------------------------------------------------------------------------------------------------------
 *  File:         apb_env.sv
 *
 *  Description:  
 * 
 *********************************************************************************************************************/

  `ifndef APB_ENV
    `define APB_ENV

    class apb_env extends uvm_env;
      `uvm_component_utils(apb_env)

      apb_agent       m_agent0;
      apb_reset_agent m_reset_agent0;

      virtual apb_if m_vif;

      function new(string name = "apb_env", uvm_component parent = null);
        super.new(name,parent);
      endfunction

      function void build_phase (uvm_phase phase);
        super.build_phase(phase);

        m_agent0 = apb_agent::type_id::create("m_agent0",this);
        m_reset_agent0 = apb_reset_agent::type_id::create("m_reset_agent0",this);

        `uvm_info("BUILD_PHASE", "apb_env.", UVM_HIGH)
      endfunction
      
      function void connect_phase (uvm_phase phase);
        super.connect_phase(phase);

        `uvm_info("CONNECT_PHASE", "apb_env.", UVM_HIGH)
      endfunction
    endclass 
  `endif

/**********************************************************************************************************************
*  END OF FILE: apb_env.sv
*********************************************************************************************************************/
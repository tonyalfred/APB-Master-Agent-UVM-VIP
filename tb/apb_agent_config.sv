/**********************************************************************************************************************
 *  FILE DESCRIPTION
 *  -------------------------------------------------------------------------------------------------------------------
 *  File:         apb_agent_config.sv
 *
 *  Description:  
 * 
 *********************************************************************************************************************/

  `ifndef APB_AGENT_CONFIG
    `define APB_AGENT_CONFIG

    class apb_agent_config extends uvm_object;
      `uvm_object_utils(apb_agent_config)
      
      virtual apb_if m_vif;
    
      uvm_active_passive_enum is_active;

      bit has_coverage;

      function new(string name = "apb_agent_config");
        super.new(name);
      endfunction

      virtual function uvm_active_passive_enum get_is_active();
        return is_active;
      endfunction

      virtual function void set_is_active(uvm_active_passive_enum is_active);
        this.is_active = is_active;
      endfunction

		  virtual function bit get_has_coverage();
			  return has_coverage;
		  endfunction

    	virtual function void set_has_coverage(bit has_coverage);
			  this.has_coverage = has_coverage;
		  endfunction
    endclass 
  `endif

/**********************************************************************************************************************
*  END OF FILE: apb_agent_config.sv
*********************************************************************************************************************/
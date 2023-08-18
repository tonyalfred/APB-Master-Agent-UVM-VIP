/**********************************************************************************************************************
 *  FILE DESCRIPTION
 *  -------------------------------------------------------------------------------------------------------------------
 *  File:         apb_seq_lib.sv
 *
 *  Description:  
 * 
 *********************************************************************************************************************/

  `ifndef APB_SEQUENCE_LIB
    `define APB_SEQUENCE_LIB

    ///////////////////////////////////////////////////////////////
    ////////////////// RESET AGENT SEQUENCES //////////////////////
    ///////////////////////////////////////////////////////////////

    class apb_reset_seq extends uvm_sequence;
      `uvm_object_utils(apb_reset_seq)

      apb_reset_item m_item;

      function new (string name = "apb_reset_seq");
        super.new(name);
      endfunction

      task body;
        m_item = apb_reset_item::type_id::create("m_item");
        start_item(m_item);

        assert (m_item.randomize())
        else `uvm_fatal("RESET SEQUENCE", "randomization failed.");

        finish_item(m_item);
      endtask

      task post_body;
        `uvm_info("RESET SEQUENCE", "sequence finished.", UVM_HIGH)
      endtask
    endclass     

    ///////////////////////////////////////////////////////////////
    /////////////////// DATA AGENT SEQUENCES //////////////////////
    ///////////////////////////////////////////////////////////////
    
    class apb_base_seq extends uvm_sequence;
      `uvm_object_utils(apb_base_seq)

      apb_seq_item m_item;

      function new (string name = "");
        super.new(name);
      endfunction

      task post_body;
        `uvm_info("SEQUENCE", "sequence finished.", UVM_HIGH)
      endtask
    endclass

    class apb_rand_seq extends apb_base_seq;
      `uvm_object_utils(apb_rand_seq)

      function new (string name = "");
        super.new(name);
      endfunction

      task body; 
        m_item = apb_seq_item::type_id::create("m_item");
        start_item(m_item);

        assert (m_item.randomize())
        else `uvm_fatal("RAND SEQUENCE", "randomization failed.");

        finish_item(m_item);
      endtask
    endclass
  `endif

/**********************************************************************************************************************
*  END OF FILE: apb_seq_lib.sv
*********************************************************************************************************************/
/**********************************************************************************************************************
 *  FILE DESCRIPTION
 *  -------------------------------------------------------------------------------------------------------------------
 *  File:         apb_virtual_seq.sv
 *
 *  Description:  
 * 
 *********************************************************************************************************************/

  `ifndef APB_VIRTUAL_SEQ
    `define APB_VIRTUAL_SEQ

    class apb_base_vseq extends uvm_sequence #(uvm_sequence_item);
      `uvm_object_utils(apb_base_vseq)

      uvm_sequencer #(apb_seq_item)   m_apb_data_seqr;
      uvm_sequencer #(apb_reset_item) m_apb_reset_seqr;

      function new (string name = "");
        super.new(name);
      endfunction
    endclass

    class apb_vseq extends apb_base_vseq;
      `uvm_object_utils(apb_vseq)

      function new (string name = "");
        super.new(name);
      endfunction
      
      task body ();
        apb_reset_seq m_reset_seq = apb_reset_seq::type_id::create("m_reset_seq");
        apb_rand_seq m_rand_seq = apb_rand_seq::type_id::create("m_rand_seq");

        m_reset_seq.start(m_apb_reset_seqr); 
        m_rand_seq.start(m_apb_data_seqr);
      endtask
    endclass
  `endif

/**********************************************************************************************************************
*  END OF FILE: apb_virtual_seq.sv
*********************************************************************************************************************/
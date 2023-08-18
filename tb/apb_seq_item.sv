/**********************************************************************************************************************
 *  FILE DESCRIPTION
 *  -------------------------------------------------------------------------------------------------------------------
 *  File:         apb_seq_item.sv
 *
 *  Description:  
 * 
 *********************************************************************************************************************/

  `ifndef APB_SEQ_ITEM
    `define APB_SEQ_ITEM

    class apb_seq_item extends uvm_sequence_item;
      `uvm_object_utils(apb_seq_item)

      rand apb_transaction_type_t m_txn;
      rand apb_data_t m_data;
      rand apb_addr_t m_addr;
      rand int unsigned m_cycles_delay;

      constraint c_cycles_delay {m_cycles_delay inside {[`MIN_CYCLES_DELAY:`MAX_CYCLES_DELAY]};}

      function new(string name = "");
        super.new(name);
      endfunction

      function void do_copy(uvm_object rhs);
        apb_seq_item lhs;
        $cast(lhs, rhs);
        super.do_copy(rhs);
        m_txn = lhs.m_txn;
        m_data = lhs.m_data;
        m_addr = lhs.m_addr;
      endfunction
    endclass 
  `endif

/**********************************************************************************************************************
*  END OF FILE: apb_seq_item.sv
*********************************************************************************************************************/
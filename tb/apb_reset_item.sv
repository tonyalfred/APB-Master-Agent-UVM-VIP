/**********************************************************************************************************************
 *  FILE DESCRIPTION
 *  -------------------------------------------------------------------------------------------------------------------
 *  File:         apb_reset_item.sv
 *
 *  Description:  
 * 
 *********************************************************************************************************************/

  `ifndef APB_RESET_ITEM
    `define APB_RESET_ITEM

    class apb_reset_item extends uvm_sequence_item;
      `uvm_object_utils(apb_reset_item)

      rand int reset_time_ps;
      constraint c_reset_time_ps {reset_time_ps inside {[1:20]};}

      function new(string name = "");
        super.new(name);
      endfunction
    endclass 
  `endif

/**********************************************************************************************************************
*  END OF FILE: apb_reset_item.sv
*********************************************************************************************************************/
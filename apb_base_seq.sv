/* ================================ This is the APB Base Sequence ==============================*/
class apb_base_seq extends uvm_sequence#(apb_seq_item_new);
`uvm_object_utils(apb_base_seq)

function new(string name = "apb_base_seq");
super.new(name);
endfunction

virtual task body;

endtask
endclass

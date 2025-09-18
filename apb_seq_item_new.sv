
class apb_seq_item_new extends apb_seq_item ;
    `uvm_object_utils(apb_seq_item_new)
    function new(string name =" apb_seq_item ");
        super.new(name);
    endfunction

    function void pre_randomize();
        `uvm_info("Randomization","In pre randomize",UVM_NONE)
    endfunction

    function void post_randomize();
        `uvm_info("Randomization","In post randomize",UVM_NONE)
        //req.addr_size.constraint_mode(1);
    endfunction
endclass

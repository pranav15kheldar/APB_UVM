
class apb_seq_item extends uvm_sequence_item;

    rand bit [31:0] PADDR[];
    rand bit        PWRITE;
    rand bit [31:0] PWDATA[];
    //rand bit        PENABLE;

    `uvm_object_utils_begin( apb_seq_item )
    `uvm_field_array_int(PADDR,UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(PWRITE,UVM_ALL_ON | UVM_DEC)
    `uvm_field_array_int(PWDATA,UVM_ALL_ON | UVM_DEC)
    `uvm_object_utils_end

    constraint addr_size
    {
        PADDR.size()<50;
        PADDR.size()>20;
    }

    constraint data_size
    {
        PWDATA.size()==PADDR.size();
    }

    function new(string name =" apb_seq_item ");
        super.new(name);
    endfunction

endclass

class apb_seq_read extends apb_base_seq;
    apb_seq_item_new req1; 
    int fd;
    `uvm_object_utils( apb_seq_read )
    function new(string name =" apb_seq");
    super.new(name);
    endfunction

    task body;
    //repeat(15) begin
        req1=apb_seq_item_new::type_id::create("req");
        req1.addr_size.constraint_mode(0);
        `uvm_info("Five","Before start seq",UVM_NONE)
        start_item(req1);
        `uvm_info("Five","In the Start seq",UVM_NONE)
        if(!req1.randomize() with {PWRITE == 0;PADDR.size()==10; }) begin
            `uvm_fatal("Randomization","failed....")
        end
        else begin
            `uvm_info("Randomization","Successful....",UVM_NONE)
            req1.print();
            //end
            finish_item(req1);
            `uvm_info("Five","2 In the Start seq",UVM_NONE)
            //finish_item(req);
            `uvm_info("Five","Out of the Start seq",UVM_NONE)
            end
    endtask
endclass


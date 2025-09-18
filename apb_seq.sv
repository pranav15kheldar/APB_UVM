class apb_seq extends apb_base_seq;
    apb_seq_item_new req1; 
    int fd;
    `uvm_object_utils( apb_seq )
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
        if(!req1.randomize() with {PWRITE == 1;PADDR.size()==10; }) begin
            `uvm_fatal("Randomization","failed....")
        end
        else begin
            `uvm_info("Randomization","Successful....",UVM_NONE)
            req1.print();
        //end
        finish_item(req1);

        //req=apb_seq_item::type_id::create("req");
        //start_item(req);
        //`uvm_info("Five","In the Start seq",UVM_NONE)
        //if(!req.randomize() with {PWRITE == 0; }) begin
        //`uvm_fatal("Randomization","failed....")
        //end
        //else begin
        //`uvm_info("Randomization","Successful....",UVM_NONE)
        //req.print();
        //end
        //finish_item(req);
        `uvm_info("Five","2 In the Start seq",UVM_NONE)
        //finish_item(req);
        `uvm_info("Five","Out of the Start seq",UVM_NONE)
        end
    endtask

endclass


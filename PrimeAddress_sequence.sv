// ================= Test To Write at Prime Address ===================//
// This is the sequence of the Prime Address Test Case Which is extended from base sequence 
// Here I randomize the prime address seq item.
class prime_sequence extends apb_base_seq;
    `uvm_object_utils(prime_sequence)
    function  new(string name = "Prime Sequence");
        super.new(name);
    endfunction
    prime_seq_item primeSeqItem_obj; // Declear the object of Prime address sequence item
    task body();
        primeSeqItem_obj = prime_seq_item::type_id::create("PrimeSeqItem"); // Object Creation 
        `uvm_info("Prime Sequrnce " , "Before Start Sequnece", UVM_NONE)
        start_item(primeSeqItem_obj); 
        // Randomize 
        if (!primeSeqItem_obj.randomize()) begin
            `uvm_fatal("Prime Address Randamization" , "!!!!!!!!!!!!!Fail!!!!!!!" )
        end
        else begin
            `uvm_info("Prime Address Randamization " ,"############ Sucess ###########" , UVM_NONE )
            finish_item(primeSeqItem_obj);
        end
    endtask
endclass
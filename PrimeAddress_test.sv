// This is the Prime Address Test which is extended from base apb test. Here Object of Prime Address Sequence object is created.
class PrimeAddress_test extends apb_test;
    prime_sequence primeSeq_obj; // Object Declearation of Prime Address sequence 
    `uvm_component_utils(PrimeAddress_test)
    function  new(string name = "Prime Address Test" , uvm_component parent = null);
        super.new(name,parent);
    endfunction

    // Here in Run Phase object is created and it is started and drop after some delay
    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        primeSeq_obj = prime_sequence::type_id::create("Prime Address Sequence" , this); // Object Creation 
        primeSeq_obj.start(env.agent.seqr); //Object Start 
        #100;
        phase.drop_objection(this);
    endtask
endclass
/* Note :- After Doing this run the test in Module (tb_top)*/
class apb_test extends uvm_test;
    `uvm_component_utils(apb_test)
    apb_env env;
    apb_seq seq;
    apb_base_seq seq_b;
    apb_seq_read seq_r;
    function new(string name="apb_test",uvm_component parent=null);
    super.new(name,parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env=apb_env::type_id::create("env",this);//object craetion in uvm
        uvm_config_db #(int)::set(this,"env","a",10);
        //env=new();
        `uvm_info("One","Build",UVM_NONE)
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("two","connect",UVM_NONE)
    endfunction

    virtual function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        uvm_top.print_topology();
        `uvm_info("Three","End of elaboration",UVM_NONE)
    endfunction

    virtual function void start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);
        `uvm_info("Four","Start of Simulation",UVM_NONE)
    endfunction

    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);//raise an objection
        seq_b=apb_seq::type_id::create("seq_b",this);//object craetion in uvm
        `uvm_info("Five","RUN",UVM_NONE)
        seq_b.start(env.agent.seqr);
        //read op
        seq_b=apb_seq_read::type_id::create("seq_b",this);//object craetion in uvm
        `uvm_info("Five","RUN",UVM_NONE)
        seq_b.start(env.agent.seqr);

        //seq_r=apb_seq_read::type_id::create("seq_r",this);//object craetion in uvm
        `uvm_info("Five","RUN",UVM_NONE)
        //seq_r.start(env.agent.seqr);
        #100;
        phase.drop_objection(this);//drop and objection
        endtask
        //when code reaches inactive region factory will try to kill task to avoid this-> raise_objection
        virtual function void extract_phase(uvm_phase phase);
        super.extract_phase(phase);
        `uvm_info("Six","Extract",UVM_NONE)
    endfunction

    virtual function void check_phase(uvm_phase phase);
        super.check_phase(phase);
        `uvm_info("Seven","Check",UVM_NONE)
    endfunction

    virtual function void report_phase(uvm_phase phase);
        super.report_phase(phase);
        `uvm_info("Eight","Report",UVM_NONE)
    endfunction

    virtual function void final_phase(uvm_phase phase);
        super.final_phase(phase);
        `uvm_info("Nine","Final",UVM_NONE)
    endfunction

endclass

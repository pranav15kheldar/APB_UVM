class apb_env extends uvm_env;
`uvm_component_utils(apb_env)
apb_agent agent;
function new(string name="apb_env",uvm_component parent=null);
 super.new(name,parent);
endfunction

//function void build_phase(uvm_phase phase);
//super.build_phase(phase);
//`uvm_info("One","Build",UVM_NONE)
//`uvm_fatal("O","fatal")
 //endfunction

int b;
function void build_phase(uvm_phase phase);
super.build_phase(phase);
agent=apb_agent::type_id::create("agent",this);//object craetion in uvm
//uvm_config_db #(int)::get(this,"","a",b);
//$display("b=%d",b);
`uvm_info("One","Build",UVM_NONE);
endfunction

virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
`uvm_info("two","connect",UVM_NONE)
 endfunction

virtual function void end_of_elaboration_phase(uvm_phase phase);
super.end_of_elaboration_phase(phase);
`uvm_info("Three","End of elaboration",UVM_NONE)
 endfunction

virtual function void start_of_simulation_phase(uvm_phase phase);
super.start_of_simulation_phase(phase);
`uvm_info("Four","Start of Simulation",UVM_NONE)
 endfunction

virtual task run_phase(uvm_phase phase);
super.run_phase(phase);
`uvm_info("Five","RUN",UVM_NONE)
 endtask

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



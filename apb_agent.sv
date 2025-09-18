class apb_agent extends uvm_agent;
  
`uvm_component_utils( apb_agent )

apb_driver driver;
apb_sequencer seqr;

function new(string name =" apb_agent ",uvm_component parent=null);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
driver=apb_driver::type_id::create("driver",this);//object creation in uvm
seqr=apb_sequencer::type_id::create("seqr",this);//object creation in uvm
//uvm_config_db #(int)::get(this,"","a",b);
//$display("b=%d",b);
`uvm_info("One","Build",UVM_NONE);
endfunction

//Connect phase to make connection between driver and seqr
virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
`uvm_info("two","connect",UVM_NONE)
driver.seq_item_port.connect(seqr.seq_item_export);
 endfunction

virtual function void end_of_elaboration_phase(uvm_phase phase);
super.end_of_elaboration_phase(phase);
`uvm_info("Three","End of elaboration",UVM_NONE)
 endfunction
endclass

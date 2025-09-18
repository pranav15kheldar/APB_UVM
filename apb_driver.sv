class apb_driver extends uvm_driver#(apb_seq_item);
 logic [31:0]temp; 
int fd;
`uvm_component_utils( apb_driver )
virtual apb_if vif;
function new(string name =" apb_driver ",uvm_component parent=null);
super.new(name,parent);
endfunction


function void build_phase(uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db #(virtual apb_if)::get(this,"","vif",vif)) begin
`uvm_fatal("index","Did not get value")
end
else begin
`uvm_info("index","Get is Successful...",UVM_NONE)
end
`uvm_info("One","Build",UVM_NONE);
endfunction

virtual task run_phase(uvm_phase phase);
//phase.raise_objection(this);
`uvm_info("Five","Inside run task",UVM_NONE)
//$fdisplay(fd,"Hii");
fd= $fopen("./note.log","w");

$fdisplay(fd,"     Sr.no        ADDRESS       DATA");
forever begin
seq_item_port.get_next_item(req);
req.print();
check_rst();

for(int i=0; i<=req.PADDR.size();i++) begin
$fdisplay(fd,"%d     %h    %h",i,req.PADDR[i],req.PWDATA[i]);

perform_txn(req.PADDR[i],req.PWDATA[i],req.PWRITE);
end
seq_item_port.item_done(req);
end
`uvm_info("Five","RUN",UVM_NONE)
//phase.drop_objection(this);

 endtask

task check_rst();
if(!vif.rst) begin
vif.PADDR <= 32'b0;
vif.PWDATA <= 32'b0;
vif.PWRITE  <= 1'b0;
vif.PENABLE <= 1'b0;
vif.PSEL<= 1'b0;


`uvm_info("driver","WAITing for rst 1",UVM_NONE)
wait(vif.rst);
end
endtask

task perform_txn(bit [31:0] ADDR, DATA,bit WRITE);
@(posedge vif.clk);
vif.PSEL<=1'b1;
vif.PADDR<=ADDR;
vif.PWRITE<=WRITE;
vif.PENABLE<=1'b0;

if(WRITE) begin
write_txn(DATA);
end
else begin
read_txn();
end
endtask

task write_txn(bit [31:0]DATA);
vif.PWDATA<=DATA;
@(posedge vif.clk);
vif.PENABLE<=1'b1;
@(posedge vif.clk);
`uvm_info("driver","WAITing for pready",UVM_NONE)
wait(vif.PREADY);
`uvm_info("driver","pready is high transfer is done",UVM_NONE)
vif.PENABLE<=1'b0;
vif.PSEL<=1'b0;

endtask

task read_txn();
    @(posedge vif.clk);
vif.PENABLE<=1'b1;
    @(posedge vif.clk);
`uvm_info("driver","Waitinf for PREADY in read txn",UVM_NONE)
wait(vif.PREADY);
`uvm_info("driver","pready is high transfer is done",UVM_NONE)
vif.PENABLE<=1'b0;
vif.PSEL<=1'b0;


endtask
endclass

`timescale 1ns/1ns
module APB;
import apb_pkg::*;
import uvm_pkg::*;
//parameter FREQ=100000000;
//parameter delay=1/FREQ*2;
reg clk=0;
reg rst=0;
time t1, t2;
real feq;
  int count=0;

apb_if inf(clk,rst);
apb_ram apb_design(.presetn(inf.rst),
                   .pclk(inf.clk),
                   .psel(inf.PSEL),
                   .penable(inf.PENABLE),
                   .pwrite(inf.PWRITE),
                   .paddr(inf.PADDR) ,
                   .pwdata(inf.PWDATA),
                   .prdata(inf.PRDATA),
                   .pready(inf.PREADY),
                   .pslverr(inf.PSLVERR)
);

initial 
begin
 forever begin
   #0.999 clk=~clk;
 end
end

initial  begin
     rst=0;
repeat(4) @(posedge clk);
rst=1;

end
initial begin

 $dumpfile("dump.vcd");
 $dumpvars();
// run_test("apb_test");
run_test("PrimeAddress_test"); // Here Prime Address test is Run 
end
//  Calculate the frequency 
always @(posedge clk) begin
  // T1 store the value of time at 1st posedge and t2 store the value of time at 2nd posedge. then difference between t2 and t1 gives Time period whose inverse is frequency
  t2 <= $time;
  t1 <= t2;
  feq = (1.0 / (t2 - t1))* 1000;
  $display("Frequency is :%0p MHz" , feq);
end

initial begin
//inf.PREADY=1'b1;
uvm_config_db#(virtual apb_if)::set(null,"*driver","vif",inf);
end
endmodule

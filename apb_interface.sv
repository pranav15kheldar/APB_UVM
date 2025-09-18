`timescale 1ns/1ns
interface apb_if(clk,rst);
  input clk,rst;
   logic [31:0]PADDR;
   logic [31:0]PWDATA;
   logic [31:0]PRDATA;
   logic PWRITE;
   logic PREADY;
   logic PSEL;
   logic PENABLE;
   logic PSLVERR;


endinterface

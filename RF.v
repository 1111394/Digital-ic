module  RF(
           input [4:0] A1,
           input [4:0] A2,
           input [4:0] A3,
           input [31:0] WD,
           input wr,
           input clk,
           output [31:0] RD1,
           output [31:0] RD2,
           output [31:0] s0,
           output [31:0] s1,
           output [31:0] s2,
           output [31:0] s3,
           output [31:0] s4,
           output [31:0] s5
           );
 reg [31:0] mem[31:0];
 assign RD1=(A1==0)?32'd0:mem[A1];
 assign RD2=(A2==0)?32'd0:mem[A2];
 always @(posedge clk)
        begin  
        if(wr)
          mem[A3]<=WD; 
        end
           
  assign s0=mem[16];
  assign s1=mem[17];
  assign s2=mem[18];
  assign s3=mem[19];
  assign s4=mem[20];
  assign s5=mem[21];        
endmodule


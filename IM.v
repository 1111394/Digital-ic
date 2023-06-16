module IM(
         input rst,
         input clk,
         input [31:0] A,
         output  [31:0] D
        ); //Ö¸Áî´æ´¢Æ÷
reg [31:0] mem[64-1:0];
assign D=mem[A];

always @(negedge rst)
       begin
      mem[0]<=32'h00008821;
      mem[1]<=32'h0000A821;
      mem[2]<=32'h24130000;
      mem[3]<=32'h24140009;
      mem[4]<=32'h02939021;
      mem[5]<=32'h00008021;
      mem[6]<=32'h0260B821;
      mem[7]<=32'h8E700000;
      mem[8]<=32'h02308821;
      mem[9]<=32'h26730001;
      mem[10]<=32'h12720005;
      mem[11]<=32'h0234A81A;
      mem[12]<=32'h0234A81A;
      mem[13]<=32'hAE550001;
      mem[14]<=32'h00000000;
      mem[15]<=32'hzzzzzzzz;
      mem[16]<=32'h00000000;

          
       end
endmodule


module DM(
          input [31:0] A,
          input [31:0] WD,
          input wr,
          input clk,
          input rst,
          output  reg [31:0] RD
          );
reg [31:0] mem[128-1:0];
always@(negedge rst,posedge clk)
      begin
      if(!rst) begin
     mem[0]<=32'h02000003;
     mem[1]<=32'h02000002;
     mem[2]<=32'h03000002;
     mem[3]<=32'h04000002;
     mem[4]<=32'h05000002;
     mem[5]<=32'h06000002;
     mem[6]<=32'h07900002;
     mem[7]<=32'h08000002;
     mem[8]<=32'h09000002;
     mem[9]<=32'h10000002;
     mem[10]<=32'h11001102;
     mem[11]<=32'h12110002;
     mem[12]<=32'h00001102;
     mem[13]<=32'h00110000;
     mem[14]<=32'h01100000;
     mem[15]<=32'h10000000;
     mem[16]<=32'h10000000;
     mem[17]<=32'hzzzzzzzz;
     mem[18]<=32'hzzzzzzzz;
           end
       else
         begin
          if(wr)
              mem[A]<=WD;
          else RD<=mem[A];
         end
    end
endmodule

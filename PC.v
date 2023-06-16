module PC(
          input clk,
          input reset,
          input [31:0] di,   //
          output reg [31:0] do   //
          );
        always @(posedge clk,negedge reset)
              begin
              	if(!reset)
              	   do<=32'b0;
              	 else
              	   do<=di;
              	end
endmodule



module EXT(
           input [15:0] in16,
           output [31:0] out32
           );
assign out32={16'b0,in16};      
endmodule



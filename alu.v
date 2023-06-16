//AUL
module  ALU(
		       input [31:0] A,         //输入A
		       input [31:0] B,         //输入B
		       input [2:0] F,          //选择信号
		       output reg [31:0] Y,    //输出Y
		       output   zero          //判0信号
		       );

always @(*)
      begin
        case(F)
            3'b000: Y<=A&B;
            3'b001: Y<=A|B;
            3'b010: Y<=A+B;
            3'b011: Y<=A/B;
            3'b100: Y<=A&(~B);
            3'b101: Y<=A|(~B);
            3'b110: Y<=A-B;
            3'b111: begin
                        if(A<B)
                          Y<=1;
                        else
                          Y<=0;
                   end
        endcase
      end
assign zero=(A==B)?1'b1:1'b0;
endmodule

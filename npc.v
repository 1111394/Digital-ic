module NPC(
            input [31:0] pc,
            input [25:0] imm,
            input [31:0] ra,
            input [2:0] cs,
            input zero,
            output reg [31:0] npc
            );
  wire [31:0] imm26,imm16;
  assign imm26={6'b0,imm[25:0]};
  assign imm16={16'b0,imm[15:0]};
  always @(*)
         begin
         	if(cs==3'b000)
         	   npc<=pc+1;
         	else if(cs==3'b001)
         	     begin
         	     	if(!zero)
         	     	 npc<=imm16;
         	     	else
         	     	 npc<=pc+1;
         	     end
         	else if(cs==3'b101)
         	     begin
         	     	if(zero)
         	     	 npc<=imm16;
         	     	else
         	     	 npc<=pc+1;
         	     end
         	else if(cs==3'b010)
         	     begin
         	     	npc<=imm26;
         	     end
         else if(cs==3'b011)
               begin
                npc<=	ra;
               end
         end
            
endmodule



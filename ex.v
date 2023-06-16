module ID_EX(
              input clk,
              input s,
              input rf_wr,
              input dm_wr,
              input m1sel,
              input m2sel,
              input m3sel,
              input [31:0] ext,
              input [2:0] ALUop,
              input [31:0] rsD,
              input [31:0] rtD,
              input [31:0] rdD,
              output reg rf_wre,
              output reg dm_wre,
              output reg m1sele,
              output reg m2sele,
              output reg m3sele,
              output reg [2:0] ALUope,
              output reg [31:0] exte,
              output reg [31:0] rsE,
              output reg [31:0] rtE,
              output reg [31:0] rdE
              );
 always @(posedge clk,negedge s )             
         begin
         	if(!s)
         	  begin
         	  	rf_wre<=1'b0;
         	  	dm_wre<=1'b0;
         	  	m1sele<=1'b0;
         	  	m2sele<=1'b0;
         	  	m3sele<=1'b0;
         	  	ALUope<=3'b0;
         	  	exte<=32'b0;
         	  	rsE<=32'b0;
         	  	rtE<=32'b0;
         	  	rdE<=32'b0;
         	  end
         	else
         	 begin
         	 	rf_wre<=rf_wr;
         	  	dm_wre<=dm_wr;
         	  	m1sele<=m1sel;
         	  	m2sele<=m2sel;
         	  	m3sele<=m3sel;
         	  	ALUope<=ALUop;
         	  	exte<=ext;
         	  	rsE<=rsD;
         	  	rtE<=rtD;
         	  	rdE<=rdD;
         	 end
         	
         end

endmodule



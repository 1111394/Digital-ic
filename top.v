module cpu_top(
               input clk,
               input reset,
               output [31:0] y0,
               output [31:0] y1,
//               output [31:0] y2,
               output [31:0] y3,
               output [31:0] y4,
               output [31:0] y5,
               output [31:0] y
              );
    
wire [31:0] pc,npc,im_d;
wire [31:0] RD1,RD2,ext,Y,RD;   
wire m1sel,m2sel,m3sel,zero;  
    
PC    PC_inst(
              .clk(clk),
              .reset(reset),
              .di(npc),
              .do(pc)
              );
wire [2:0] cs;
NPC  NPC_inst(
              .pc(pc),
              .imm(im_d[25:0]),
              .ra(RD1),
              .cs(cs),
              .zero(zero),
              .npc(npc)
              
              );
IM   IM_inst(
             .A(pc),
	     .clk(clk),
	     .rst(reset),
             .D(im_d)
             );
  wire [4:0] A3=(m1sel==1)?im_d[15:11]:im_d[20:16];   
  wire [31:0] wd=(m2sel)?RD:Y;
  
  wire rf_wr;     
RF  RF_inst(
            .A1(im_d[25:21]),
            .A2(im_d[20:16]),
            .A3(A3),
            .WD(wd),
            .wr(rf_wr),
            .clk(clk),
            .RD1(RD1),
            .RD2(RD2),
            .s0(y0),
            .s1(y1),
            .s2(),
            .s3(y3),
            .s4(y4),
            .s5(y5)
            );
EXT  EXT_inst(
              .in16(im_d[15:0]),
              .out32(ext)
              );
wire dm_wr;
DM   DM_inst(
             .A(Y),
             .WD(RD2),
             .wr(dm_wr),
             .clk(clk),
	     .rst(reset),
             .RD(RD)
             );
wire [31:0]  B;
assign B=(m3sel==1'b0)?RD2:ext; 
wire [2:0] f;          
ALU  ALU_inst(
              .A(RD1),
              .B(B),
              .F(f),
              .Y(Y),
              .zero(zero)
              );
CU   CU_inst(
             .op(im_d[31:26]),
             .fun(im_d[5:0]),
             .m1sel(m1sel),
             .m2sel(m2sel),
             .m3sel(m3sel),
             .cs(cs),
             .f(f),
             .rf_wr(rf_wr),
             .dm_wr(dm_wr)
             );
            assign y=pc;
endmodule


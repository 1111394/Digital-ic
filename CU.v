module CU(
          input [5:0] op,
          input [5:0] fun,
          output reg [2:0] cs,
          output reg m1sel,
          output reg m2sel,
          output reg m3sel,
          output reg rf_wr,
          output reg dm_wr,
          output reg [2:0] f
          );
  wire [5:0] func;//控制信号    
  assign func=(op==6'b000000)?fun:op;//判断控制信号来源
  always @(*)                        //组合逻辑，译码电路
        begin
         case(func)
             6'b100001: begin          //add
                         cs<=3'b000;
                         m1sel<=1'b1;
                         m2sel<=1'b0;
                         m3sel<=1'b0;
                         rf_wr<=1'b1;
                         dm_wr<=1'b0;
                         f<=3'b010;
                        end
            6'b100010: begin          //sub
                         cs<=3'b000;
                         m1sel<=1'b1;
                         m2sel<=1'b0;
                         m3sel<=1'b0;
                         rf_wr<=1'b1;
                         dm_wr<=1'b0;
                         f<=3'b110;
                        end
             6'b110110: begin          //and
                         cs<=3'b000;
                         m1sel<=1'b1;
                         m2sel<=1'b0;
                         m3sel<=1'b0;
                         rf_wr<=1'b1;
                         dm_wr<=1'b0;
                         f<=3'b000;
                        end
              6'b100101: begin          //or
                         cs<=3'b000;
                         m1sel<=1'b1;
                         m2sel<=1'b0;
                         m3sel<=1'b0;
                         rf_wr<=1'b1;
                         dm_wr<=1'b0;
                         f<=3'b001;
                        end
            6'b011010: begin           //div
                       cs<=3'b000;
                       m1sel<=1'b1;
                       m2sel<=1'b0;
                       m3sel<=1'b0;
                       rf_wr<=1'b1;
                       dm_wr<=1'b0;
                       f<=3'b011;
                       end
            6'b001001: begin          //addi
                       cs<=3'b000;
                       m1sel<=1'b0;
                       m2sel<=1'b0;
                       m3sel<=1'b1;
                       rf_wr<=1'b1;
                       dm_wr<=1'b0;
                       f<=3'b010;
                       end
           6'b000010: begin          //j
                      cs<=3'b010;
                      m1sel<=1'bz;
                      m2sel<=1'bz;
                      m3sel<=1'bz;
                      rf_wr<=1'b0;
                      dm_wr<=1'b0;
                      f<=3'bzzz;
                     end
           6'b000100: begin        //ben
                      cs<=3'b001;
                      m1sel<=1'bz;
                      m2sel<=1'bz;
                      m3sel<=1'b0;
                      rf_wr<=1'b0;
                      dm_wr<=1'b0;
                      f<=3'b000;
                      end
          6'b000101: begin        //beq
                      cs<=3'b101;
                      m1sel<=1'bz;
                      m2sel<=1'bz;
                      m3sel<=1'b0;
                      rf_wr<=1'b0;
                      dm_wr<=1'b0;
                      f<=3'b000;
                      end
                      
                      
           6'b100011: begin       //lw
                      cs<=2'b00;
                      m1sel<=1'b0;
                      m2sel<=1'b1;
                      m3sel<=1'b1;
                      rf_wr<=1'b1;
                      dm_wr<=1'b0;
                      f<=3'b010;
                      end
           6'b101011: begin     //sw
                      cs<=2'b00;
                      m1sel<=1'bz;
                      m2sel<=1'bz;
                      m3sel<=1'b1;
                      rf_wr<=1'b0;
                      dm_wr<=1'b1;
                      f<=3'b010;
                      end
            default: begin           //xxx      //没有指令时为高阻态
                     cs<=2'bz;
                     m1sel<=1'bz;
                     m2sel<=1'bz;
                     m3sel<=1'bz;
                     rf_wr<=1'bz;
                     dm_wr<=1'bz;
                     f<=3'bz;
                     end
         endcase
        
        end    
endmodule



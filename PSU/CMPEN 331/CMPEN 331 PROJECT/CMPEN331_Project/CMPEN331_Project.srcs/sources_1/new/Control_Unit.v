`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2025 10:36:53
// Design Name: 
// Module Name: Control_Unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Control_Unit(
input [5:0] op,
input [5:0] func,
input [4:0] rs, rt, ern, mrn,
input mm2reg, mwreg, em2reg, ewreg,
output reg [1:0] fwda, fwdb,
output reg wreg, m2reg, wmem, aluimm, regrt,
output reg [3:0] aluc
);
always @(*) begin
  case (op)
    6'b000000: //R-Type
    begin
      case (func)
        6'b100000: //ADD
          begin
          wreg = 1'b1;
          m2reg = 1'b0;
          wmem = 1'b0;
          aluc = 4'b0010;
          aluimm = 1'b0;
          regrt = 1'b0;
          end
        6'b100010: //SUB
          begin
          wreg = 1'b1;
          m2reg = 1'b0;
          wmem = 1'b0;
          aluc = 4'b0110;
          aluimm = 1'b0;
          regrt = 1'b0;
          end
        6'b100101: //OR
          begin
          wreg = 1'b1;
          m2reg = 1'b0;
          wmem = 1'b0;
          aluc = 4'b0001;
          aluimm = 1'b0;
          regrt = 1'b0;
          end
        6'b100110: //XOR
          begin
          wreg = 1'b1;
          m2reg = 1'b0;
          wmem = 1'b0;
          aluc = 4'b0011;
          aluimm = 1'b0;
          regrt = 1'b0;
          end
        6'b100100: //AND
          begin
          wreg = 1'b1;
          m2reg = 1'b0;
          wmem = 1'b0;
          aluc = 4'b0000;
          aluimm = 1'b0;
          regrt = 1'b0;
          end
        endcase
    end
    6'b100011: // lw
    begin
    wreg = 1'b1;
    m2reg = 1'b1;
    wmem = 1'b0;
    aluc = 4'b0010;
    aluimm = 1'b1;
    regrt = 1'b1;
    end
  endcase
  
  if ((ewreg != 1'b0) && (ern != 5'b0) && (ern == rs)) begin
    fwda = 2'b01;
  end
  else if ((mwreg != 1'b0) && (mm2reg == 1'b0) && (mrn != 5'b0) && (mrn == rs)) begin
    fwda = 2'b10;
  end
  else if ((mwreg != 1'b1) && (mm2reg == 1'b1) && (mrn != 5'b0) && (mrn == rs)) begin
    fwda = 2'b11;
  end
  else begin
    fwda = 2'b00;
  end 
  
  if ((ewreg != 1'b0) && (ern != 5'b0) && (ern == rt)) begin
    fwdb = 2'b01;
  end
  else if ((mwreg == 1'b1) && (mm2reg == 1'b0) && (mrn != 5'b0) && (mrn == rt)) begin
    fwdb = 2'b10;
  end
  else if ((mwreg != 1'b1) && (mm2reg == 1'b1) && (mrn != 5'b0) && (mrn == rt)) begin
    fwdb = 2'b11;
  end
  else begin
    fwdb = 2'b00;
  end
end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2025 16:59:14
// Design Name: 
// Module Name: Datapath
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


module Datapath(
input clock,
output wire [31:0] pc,
output wire [31:0] dinstOut,
output wire ewreg, em2reg, ewmem, ealuimm,
output wire [3:0] ealuc,
output wire [4:0] ern,
output wire [31:0] eqa,
output wire [31:0] eqb,
output wire [31:0] eimm32,
output wire mwreg, mm2reg, mwmem,
output wire [4:0] mrn,
output wire [31:0] mr,
output wire [31:0] mqb,
output wire wwreg, wm2reg,
output wire [4:0] wrn,
output wire [31:0] wr,
output wire [31:0] wdo,
output wire [31:0] wbData,
output wire [1:0] fwda,
output wire [1:0] fwdb,
output wire [31:0] qa_wire,
output wire [31:0] qb_wire,
output wire [31:0] fwva,
output wire [31:0] fwvb
);
wire [31:0] pc_address;
wire [31:0] instmem_out;
wire [5:0] op_wire;
wire [5:0] func_wire;
wire regrt_wire;
wire [4:0] rs_wire;
wire [4:0] rt_wire;
wire [4:0] rd_wire;
wire [15:0] imm_wire;
wire [31:0] imm32_wire;
wire wreg_wire, m2reg_wire, wmem_wire, aluimm_wire;
wire [3:0] aluc_wire;
wire [4:0] destReg;
wire [31:0] b;
wire [31:0] r;
wire [31:0] mdo;

PC PC(clock, pc_address, pc);
PC_Adder PC_Adder(pc, pc_address);
Inst_mem Inst_mem(pc, instmem_out);
IFID_Pipeline IFID_Pipeline(instmem_out, clock, dinstOut);
assign op_wire = dinstOut[31:26];
assign rs_wire = dinstOut[25:21];
assign rt_wire = dinstOut[20:16];
assign rd_wire = dinstOut[15:11];
assign func_wire = dinstOut[5:0];
assign imm_wire = dinstOut[15:0];
Control_Unit Control_Unit(op_wire, func_wire, rs_wire, rt_wire, ern, mrn, mm2reg, mwreg, em2reg, ewreg, fwda, fwdb, wreg_wire, m2reg_wire, wmem_wire, aluimm_wire, regrt_wire, aluc_wire); 
Regrt_Multiplexer Regrt_Multiplexer(rt_wire, rd_wire, regrt_wire, destReg);
Regfile Regfile(rs_wire, rt_wire, wrn, wbData, wwreg, clock, qa_wire, qb_wire);
FwdA_Mux FwdA_Mux(fwda, qa_wire, r, mr, mdo, fwva);
FwdB_Mux FwdB_Mux(fwdb, qb_wire, r, mr, mdo, fwvb);
Immediate_Extender Immediate_Extender(imm_wire, imm32_wire); 
IDEXE_Pipeline_Reg IDEXE_Pipeline_Reg(wreg_wire, m2reg_wire, wmem_wire, aluimm_wire, clock, aluc_wire, destReg, fwva, fwvb, imm32_wire, ewreg, em2reg, ewmem, ealuimm, ealuc, ern, eqa, eqb, eimm32);
Alu_Mux Alu_Mux(eqb, eimm32, ealuimm, b);
Alu Alu(eqa, b, ealuc, r);
EXEMEM_Pipeline_Register EXEMEM_Pipeline_Register(ewreg, em2reg, ewmem, ern, r, eqb, clock, mwreg, mm2reg, mwmem, mrn, mr, mqb);
Data_Memory Data_Memory(mr, mqb, mwmem, clock, mdo);
MEMWB_Pipeline_Register MEMWB_Pipeline_Register(mwreg, mm2reg, mrn, mr, mdo, clock, wwreg, wm2reg, wrn, wr, wdo);
WbMux WbMux(wr, wdo, wm2reg, wbData);
 
endmodule

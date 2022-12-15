`timescale 1ns / 1ps

/*------------------- ?????? -------------------*/
`define RST_ENABLE      1'b0                // ??��?????��  RST_ENABLE
`define RST_DISABLE     1'b1                // ??��?????��
`define ZERO_WORD       32'h00000000        // 32��?????0
`define ZERO_DWORD      64'b0               // 64��?????0
`define WRITE_ENABLE    1'b1                // ???��
`define WRITE_DISABLE   1'b0                // ???��
`define READ_ENABLE     1'b1                // ????
`define READ_DISABLE    1'b0                // ?????
`define ALUOP_BUS       7 : 0               // ?????��????aluop_o?????
`define SHIFT_ENABLE    1'b1                // ??��?????? 
`define ALUTYPE_BUS     2 : 0               // ?????��????alutype_o?????  
`define TRUE_V          1'b1                // ???"??"  
`define FALSE_V         1'b0                // ???"??"  
`define CHIP_ENABLE     1'b1                // ��????  
`define CHIP_DISABLE    1'b0                // ��????  
`define WORD_BUS        31: 0               // 32��??
`define DOUBLE_REG_BUS  63: 0               // ????????��???????????????
`define RT_ENABLE       1'b1                // rt??????
`define SIGNED_EXT      1'b1                // ??????????
`define IMM_ENABLE      1'b1                // ????????????
`define UPPER_ENABLE    1'b1                // ????????��???
`define MREG_ENABLE     1'b1                // ��???�ě�???????????
`define BSEL_BUS        3 : 0               // ????��??????????????
`define PC_INIT         32'hBFC00000        // PC????

`define RTSEL_ENABLE    1'b1                // ??????????

`define STALL_BUS       3:0                 //?????????
`define STOP            1'b1                //??????
`define NOSTOP          1'b0                //????????

/*------------------- ???????? -------------------*/
`define INST_ADDR_BUS   31: 0               // ??????????
`define INST_BUS        31: 0               // ???????????

// ????????alutype
`define NOP             3'b000
`define ARITH           3'b001
`define LOGIC           3'b010
`define MOVE            3'b011
`define SHIFT           3'b100
`define RET             3'b101
`define PRIVILEGE       3'b110
`define MULDIV          3'b111


// ?????????aluop
/*
`define MINIMIPS32_LUI             8'h05
`define MINIMIPS32_MFHI            8'h0C
`define MINIMIPS32_MFLO            8'h0D
`define MINIMIPS32_SLL             8'h11
`define MINIMIPS32_MULT            8'h14
`define MINIMIPS32_ADD             8'b00011000
`define MINIMIPS32_ADDIU           8'h19
`define MINIMIPS32_SUBU            8'h1B
`define MINIMIPS32_AND             8'h1C
`define MINIMIPS32_ORI             8'h1D
`define MINIMIPS32_SLT             8'h26
`define MINIMIPS32_SLTIU           8'h27
`define MINIMIPS32_LB              8'h90
`define MINIMIPS32_LW              8'h92
`define MINIMIPS32_SB              8'h98
`define MINIMIPS32_SW              8'h9A
*/

`define MINIMIPS32_ADD 			   8'b00011000
`define MINIMIPS32_ADDI 		   8'b00011001
`define MINIMIPS32_ADDU			   8'b00011010
`define MINIMIPS32_ADDIU		   8'b00011011
`define MINIMIPS32_SUB 			   8'b00110000
`define MINIMIPS32_SUBU			   8'b00110001
`define MINIMIPS32_SLT			   8'b00100100
`define MINIMIPS32_SLTI		   	   8'b00100101
`define MINIMIPS32_SLTU 		   8'b00100110
`define MINIMIPS32_SLTIU		   8'b00100111
`define MINIMIPS32_MULT 		   8'b00010100
`define MINIMIPS32_MULTU		   8'b00010101

`define MINIMIPS32_AND		   	   8'b00011100
`define MINIMIPS32_ANDI 	   	   8'b00011101
`define MINIMIPS32_LUI             8'b00000101
`define MINIMIPS32_NOR             8'b00011110
`define MINIMIPS32_OR              8'b00011111
`define MINIMIPS32_ORI             8'b00100000
`define MINIMIPS32_XOR             8'b00100001
`define MINIMIPS32_XORI            8'b00100010
`define MINIMIPS32_SLL             8'b01000000
`define MINIMIPS32_SLLV            8'b01000001
`define MINIMIPS32_SRA             8'b01000010
`define MINIMIPS32_SRAV            8'b01000011
`define MINIMIPS32_SRL             8'b01000100
`define MINIMIPS32_SRLV            8'b01000101

`define MINIMIPS32_MFHI            8'b00001100
`define MINIMIPS32_MFLO            8'b00001101
`define MINIMIPS32_MTHI            8'b00001110
`define MINIMIPS32_MTLO            8'b00001111

`define MINIMIPS32_LB              8'b10010000
`define MINIMIPS32_LW              8'b10010010
`define MINIMIPS32_LBU             8'b10010001
`define MINIMIPS32_LH              8'b10010011
`define MINIMIPS32_LHU             8'b10010100
`define MINIMIPS32_SB              8'b10011000
`define MINIMIPS32_SW              8'b10011010
`define MINIMIPS32_SH              8'b10011001

`define MINIMIPS32_BEQ             8'b01111000
`define MINIMIPS32_BNE             8'b01111001
`define MINIMIPS32_BGEZ            8'b01111010
`define MINIMIPS32_BGTZ            8'b01111011
`define MINIMIPS32_BLEZ            8'b01111100
`define MINIMIPS32_BLTZ            8'b01111101
`define MINIMIPS32_BGEZAL          8'b01111110
`define MINIMIPS32_BLTZAL          8'b01111111
`define MINIMIPS32_J               8'b10000001
`define MINIMIPS32_JAL             8'b10000010
`define MINIMIPS32_JR              8'b10000011
`define MINIMIPS32_JALR            8'b10000100

`define MINIMIPS32_DIV             8'b00110100
`define MINIMIPS32_DIVU            8'b00110101
`define MINIMIPS32_MFC0            8'b11000001
`define MINIMIPS32_MTC0            8'b11000010
`define MINIMIPS32_SYSCALL         8'b11000100
`define MINIMIPS32_BREAK           8'b11000101
`define MINIMIPS32_ERET            8'b11001000


/*------------------- ??��????????? -------------------*/
`define REG_BUS         31: 0               // ????????????
`define REG_ADDR_BUS    4 : 0               // ?????????????
`define REG_NUM         32                  // ?????????32??
`define REG_NOP         5'b00000            // ???????

/*??????????*/
`define DIV_FREE        2'b00
`define DIV_BY_ZERO     2'b01
`define DIV_ON          2'b10
`define DIV_END         2'b11
`define DIV_READY       1'b1
`define DIV_NOT_READY   1'b0
`define DIV_START       1'b1
`define DIV_STOP        1'b0 

/*------------------- ��??????cp0????? -------------------*/
`define CP0_INT_BUS     5:0                  //?��????????
`define CP0_BADVADDR    8                    //BadVAddr??????????????
`define CP0_STATUS      12                   //Status??????????????
`define CP0_CAUSE       13                   //Cause??????????????
`define CP0_EPC         14                   //EPC??????????????

`define FLUSH           1'b1                 //????????
`define NOFLUSH         1'b0                 //??????????

`define EXC_CODE_BUS    4:0              //?��????????
`define EXC_INT         5'b00000         //?��???
`define EXC_ADEL        5'b00100         //????????????��??????????
`define EXC_ADES        5'b00101         //?��?????��??????????
`define EXC_SYS         5'b01000         //?????????syscall
`define EXC_BP          5'b01001         //?????
`define EXC_RI          5'b01010         //?????????
`define EXC_OV          5'b01100         //?????????
`define EXC_ERET        5'b10001         //??????????
`define EXC_NONE        5'b10000         //????
`define EXC_ADDR        32'hbfc00380          //?????????????
`define EXC_INT_ADDR    32'hbfc00380          //?????????????
`define EXC_DIV_ZERO    5'b01101         //?0??
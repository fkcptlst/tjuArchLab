本目录提供功能点测试环境。

         
目录结构：
   +--cpu132_gettrace/   : gs132生成golden_trace的环境，架构为SoC_SRAM_Lite，默认已生成golden_trace.txt
   |        
   |--soc_axi_func/      : AXI接口的CPU运行环境，架构为SoC_AXI_Lite
   |        
   |--soc_sram_func/     : SRAM接口的CPU运行环境，架构为SoC_SRAM_Lite
   |        
   |--soft_func/         : 89个功能点测试程序，默认已包含编译好的结果
   |
   |--soft_c/		 : 5个C测试程序，默认已包含编译好的结果
   |        
   |--Readme_First.txt   : 本文档

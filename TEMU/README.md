1. TEMU工程目录介绍

目录结构：
   +--mips_sc/        		: 测试程序目录
   |        
   |--temu/			: temu源程序目录
   |
   |--Makefile			: make脚本

目录"mips_sc"用于保存测试程序，并对其进行编译，包含build和src文件夹，convert.c，default.ld， Makefile文件。
目前测试程序仅支持汇编形式。

2. TEMU的使用步骤

(1). 在终端进入目录”mips_sc“，输入“make”，在TEMU工程根目录下生成两个可加载的二进制文件“inst.bin”和“data.bin”，分别对应指令段和数据段。
(2). 在终端退回TEMU工程根目录，输入“make run”，编译temu指令集仿真器并启动。
(3). 如果需要重新编译和运行temu仿真器源代码，请在TEMU工程根目录下输入“make clean”，然后重复前两步。

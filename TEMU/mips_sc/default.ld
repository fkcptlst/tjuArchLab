OUTPUT_ARCH(mips)
ENTRY(main)
SECTIONS
{
        . = 0xbfc00000;
        .text : 
        {
            *(.text)
            _etext = .;
        }

        . = 0x80000000;
        .data : 
        {
            *(.data)              
        }

	.bss :
        {
            *(.bss)
        }

} 

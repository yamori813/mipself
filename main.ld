SECTIONS
{
  . = 0x80051000;
  .text : {
    start.o(.text)
    *(.text)
  }
  .rdata : { *(.rdata) }
  .data : { *(.data) }
  _gp = ALIGN(16);
  .sdata : { *(.sdata) }
  .sbss : { *(.sbss) }
  .bss : { *(.bss) }
}

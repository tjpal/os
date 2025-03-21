ENTRY(0x80000)

PHDRS {
    segment_code PT_LOAD FLAGS(5); /* read + execute */
    segment_data PT_LOAD FLAGS(6); /* read + write   */
}

SECTIONS {
    . =  0x80000;

    .text : {
        KEEP(*(.text._start))
    } :segment_code

/*    .rodata : ALIGN(8) { *(.rodata*) } :segment_code
    .data : { *(.data*) } :segment_data */

    .bss (NOLOAD) : ALIGN(16) {
        __bss_start = .;
        *(.bss*);
        . = ALIGN(16);
        __bss_end = .;
    } :segment_data
}
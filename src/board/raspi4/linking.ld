ENTRY(0x80000)

PHDRS {
    segment_code PT_LOAD FLAGS(5);
}

SECTIONS {
    . =  0x80000;

    .text : {
        KEEP(*(.text._start))
    } :segment_code
}
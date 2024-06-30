.section .text._start

_start:
.spin:
    b .spin

.size   _start, . - _start
.type   _start, function
.global _start
.section .text._start

_start:
    // Code execution starts on all cores in parallel. For now, we identify core0 which is supposed to run
    // the kernel code. All other codes are put into an IDLE loop. The used register is described here
    // https://developer.arm.com/documentation/100095/0002/system-control/aarch64-register-descriptions/multiprocessor-affinity-register--el1
    // We are looking for the first two bits which contain the CPU ID. The kernel will only run on core 0.

    mrs x0, MPIDR_EL1   // Read the Multiprocessor Affinity Register for the ARM Cortex A-72
    and x0, x0, #3      // Mask the first two bits (3 -> 0b11)
    cbz x0, primary_core

// For any non-primary core continue spinning in a low-energy idle mode.
other_core:
    wfe
    b       other_core

primary_core:
    // To continue with Rust code, we need a stack pointer which does not overwrite anything important
    // So set it to _start. As the stack grows downwards, we are fine.
    ldr x1, =_start
    mov sp, x1

    // Zero out the .bss section to avoid uninitialized static variables.
    adr x0, __bss_start
    adr x1, __bss_end

bss_zero:
    cmp x0, x1
    b.eq _enter_kernel
    // Stores the zero register two times at the address [x0] and jump 16 bytes
    stp xzr, xzr, [x0], #16
    b bss_zero

.size   _start, . - _start
.type   _start, function
.global _start
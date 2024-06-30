SCRIPT_DIR=$(dirname $(readlink -f $0))
KERNEL_PATH=$SCRIPT_DIR/../target/aarch64-unknown-none-softfloat/debug/os

# Show headers (-x) and dissasembly (-d) of the kernel
aarch64-linux-gnu-objdump -dx $KERNEL_PATH | less
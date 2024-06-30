#![no_main]
#![no_std]

use core::panic::PanicInfo;

mod architecture {
    pub mod aarch64 {
        pub mod boot;
    }
}

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}
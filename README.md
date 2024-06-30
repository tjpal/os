# What is 'Operating System'?
This repository contains an operating system which is implemented in Rust and runs on a Raspberry PI 4 and 5. It is developed for educational purpose and the software design follows a novel approach which is called 'interest-driven-design'. All design and architecture decisions are driven by my interests.

* The operating system is implemented in Rust, because I want to spent more time using this language.
* Initially it runs on an ARMv8 because I am interested in its architecture.
* It uses a Raspberry PI because its hardware interfaces are well documented and accessible.

# Initial goals
* Process management (Initially on one core, later on all available cores)
* Memory management
* Driver model and device management
* Security
* User management and access control
* Filesystem
* GPU access and driver
* Simple Bluetooth stack
* UI

# Initially out of scope**:
* Network

Basically, this project serves for me as a playground to learn new things.
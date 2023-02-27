6502 Assembly Programming
=========================

Architecture
------------
64KB of System memory.

2KB of System RAM (on NES motherboard); Main place data is store while
a game is running.

ROM (on game cartridge)

PPU - Picture Processing Unit

### CPU Registers
The 6502 processor has three registers for general programming use.

* x register
* y register
* a (accumulator) register


### Memory Map
The NES memory map is split between the **System Space** - chips
on-board the NES, and the **Cartridge Space** - chips on the console's
game cartridges.

```ascii
+-----+-----+--------------------------+
| RAM | I/O |     Cartridge Space      |
| 2KB |     |                          |
+-----+-----+--------------------------+
```

#### System Space
`$0000 - $07FF` - System RAM
`$0800 - $0FFF` - RAM Mirror 1
`$1000 - $17FF` - RAM Mirror 2
`$1800 - $1FFF` - RAM Mirror 3
`$2000 - $401F` - COMS

#### Cartridge Space


Addressing Modes
----------------
### Immediate Addressing
### ZeroPage Addressing
### Absolute Addressing


Instructions
------------
### Prefixes
`#` - The value is a constant or immediate value.

#### Base Prefixes
`$` - The value is a hex number.
`%` - The value is a binary number.
` ` - No prefix, the number is decimal.


ld{x,y} = load a value into the x or y cpu registers.
  e.g. `ldx #5`
  load the constant (`#`) 5 into the x register.

st{x,y} = store a value into system RAM.
  e.g. `stx $00`
  store the value in the x register into system RAM at address
  (`$` - prefix for hex numbers) 00.

in{x,y} = increment the value at the x or y cpu registers.

dec <address> = decrement the value at the given memory location.
inc <address> = increment the value at the given memory location.

lda - load a value into the accumulator register.
clc - clear the carry flag
adc - add with carry; adds the accumulator to a given memory location
sta - store value in the accumulator register in a given memory location

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

* X register
* Y register
* A (accumulator) register

Additional registers on the processor include:

#### Program Counter
The **program counter** is a 16-bit register that holds the next
instruction for the program.

```ascii
+------+------+
|  LO  |  HI  |
| byte | byte |
+------+------+
```

The range for the LO byte is `$00` - `$FF`.
The range for the HI byte is `$08` - `$FF`.

#### Processor Status
The **processor status** register is an 8-bit register. Each bit is a flag.

```ascii
+---+---+---+---+---+---+---+---+
| N | V | - | - | D | I | Z | C |
+---+---+---+---+---+---+---+---+
```

* **N** - Negative
          If the value of the x register is decremented from
          zero, the new value will be $FF (255) and the negative flag
          will be set to true.

* **V** - 
* **D** - 
* **I** - 
* **Z** - Zero, when and operation is performed, the zero flag will be
          set if the value placed in the accumulator is zero.

          If the comparison with the X register is equal, the zero flag
          will be set.

* **C** - Carry, set to true when a bit is carried during bitwise
          arithmetic. Also used set to true when making comparisons and
          the value in the A register is >= the value at the mem
          location being compared.


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
* `$0000 - $07FF` - System RAM
* `$0800 - $0FFF` - RAM Mirror 1
* `$1000 - $17FF` - RAM Mirror 2
* `$1800 - $1FFF` - RAM Mirror 3
* `$2000 - $401F` - COMS

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


`ld{x,y}` - load a value into the x or y cpu registers.
  e.g. `ldx #5`
  load the constant (`#`) 5 into the x register.

`st{x,y}` - store a value into system RAM.
  e.g. `stx $00`
  store the value in the x register into system RAM at address
  (`$` - prefix for hex numbers) 00.

`de{x,y}` - decrement the value at the x or y cpu registers.
`in{x,y}` - increment the value at the x or y cpu registers.

`dec` - decrement the value at the given memory location.
`inc` - increment the value at the given memory location.

`lda` - load a value into the accumulator register.
`sta` - store value in the accumulator register in a given memory location

`adc` - add with carry; adds the accumulator to a given memory location
`sbc` - subtract with carry; subtracts the accumulator to a given
        memory location

`clc` - clear the carry flag
`sec` - set the carry flag

`cmp` - compare what's in the A register to the given memory location.
        If A >= the memory location, set the carry flag to true,
        otherwise clear the carry flag.

`cmx` - compare what's in the X register to the given memory location.
        If X >= the memory location, set the carry flag to true,
        otherwise clear the carry flag.

`bcc` - branch if carry clear; goto given label if carry flag is false.
`bcq` - branch if equal; goto given label if zero flag is set.
`bpl` - branch on positive result; goto the given label if the negative
        flag is clear.
`bne` - branch if not equal; goto the given label if the zero flag is
        not set.

`and` - bitwise and; compare the accumulator with the given value
        stores the result in the accumulator
        sets the zero flag if the result of the comparison is zero
`ora` - bitwise or; compare the accumulator with the given value
`eor` - bitwise xor; compare the accumulator with the given value

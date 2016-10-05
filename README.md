# Elcrc16

An Erlang NIF for generating CRC-16 (polynomial 0x8005).

This NIF requires the very fine CRC code (in C) written by Michael Barr.
See http://www.barrgroup.com/Embedded-Systems/How-To/CRC-Calculation-C-Code
for more information. The code can be downloaded from
[here](http://www.netrino.com/code/crc.zip).


Note: You can change the CRC standard used by changing the macro near the 
top of the crc.h file - this NIF wants CRC16 (polynomial 0x8005), and the
crc.h file included here has been changed accordingly. The original code
uses the CRC_CCITT standard.

## Installation

1. Add crc to your list of dependencies in `mix.exs`:

        def deps do
          [{:elcrc16, "~> 0.1.0"}]
        end


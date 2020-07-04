This is a personal project where I'm building an 8-bit console using the book Designing Video Game Hardware in Verilog by Steven Hugg
http://8bitworkshop.com/ using open source tools through apio https://github.com/FPGAwars/apio for the UPduino 3.0 which can be found here:
https://www.tindie.com/products/tinyvision_ai/upduino-v30-low-cost-lattice-ice40-fpga-board/
 
I used apio to init upduino21 and to verify and build binaries to make life easier: 
"apio init --board upduino21", "apio verify" & "apio build"

To program the UPduino 3.0, I use Zadig that comes with apio:
use the command "apio drivers --ftdi-enable" to run Zadig ot install appropriate USB driver then
use command "iceprog -p hardware.bin" to program board
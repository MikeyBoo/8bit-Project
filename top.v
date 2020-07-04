
/*
following book by Steven Hugg called Designing Video Game Hardware in Verilog
http://8bitworkshop.com/ using open source tools through apio https://github.com/FPGAwars/apio for UPduino 3.0
https://www.tindie.com/products/tinyvision_ai/upduino-v30-low-cost-lattice-ice40-fpga-board/
steps taken: 
use apio to init upduino21 and to verify and build binaries: 
"apio init --board upduino21", "apio verify" & "apio build"
use "apio drivers --ftdi-enable"
use "tinyprog -p hardware.bin" to program board
*/

module test_hvsync_top(reset, hsync, vsync, rgb);

  input reset;
  output hsync, vsync;
  output [2:0] rgb;
  wire display_on;
  wire [9:0] hpos;
  wire [9:0] vpos; 


  SB_HFOSC
  #(
    .CLKHF_DIV ("0b00")
  ) my_osc (
    .CLKHFPU (1'b1),
    .CLKHFEN (1'b1),
    .CLKHF   (clk) 
  );


  pll my_pll(.clock_in(clk), .clock_out(my_clk)); //radiant pll generator works a lot better - when it decides to work, that is

  hvsync_generator hvsync_gen(
    .clk(my_clk),
    .reset(1'b0),
    .hsync(hsync),
    .vsync(vsync),
    .display_on(display_on),
    .hpos(hpos),
    .vpos(vpos)
  );

  wire r = display_on && (((hpos&7)==0) || ((vpos&7)==0));
  wire g = display_on && vpos[4];
  wire b = display_on && hpos[4];
  assign rgb = {b,g,r};

endmodule
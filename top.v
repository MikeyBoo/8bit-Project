
module test_hvsync_top(CLK, reset, hsync, vsync, rgb);

  input CLK;
  input reset;
  output hsync, vsync;
  output [2:0] rgb;
  wire display_on;
  wire [9:0] hpos;
  wire [9:0] vpos; 

/*
  UP_HSOSC #(
    .CLKHF_DIV ("0b00")
  ) my_osc (
    .CLKHFPU (1'b1),
    .CLKHFEN (1'b1),
    .CLKHF   (clk) 
  );
*/
// SB_HFOSC doesn't generate clean enough signal for PLL to drive VGA

  cpu6502 cpu(CLK, reset, AB, DI, DO, WE, IRQ, NMI, RDY);

  pll my_pll(.clock_in(CLK), .clock_out(my_clk));

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
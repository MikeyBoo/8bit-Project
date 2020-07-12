module test_hvsync_top_tb
    (

    );

    // inputs
    reg             CLK;
    reg             reset;

    //outputs
    wire            hsync, vsync;
    wire    [2:0]   rgb;

    //testbench signals
    integer i;
    integer j;

    // clock periods
    parameter CLK_PERIOD = 1.2;  // 1.2 ns = 12MHz

    // module under test
    test_hvsync_top mut
        (
            .CLK        (CLK),
            .reset      (reset),
            .hsync      (hsync),
            .vsync      (vsync),
            .rgb        (rgb)
        );

    // generate clock and reset
    initial CLK = 1'b0;

    always #(CLK_PERIOD/2.0)
        CLK = ~CLK;

    initial reset   = 1'b1;
    initial i       = 0;

    // reset inactive after 5 clocks
    always @(posedge CLK)
        begin
            i = i+1;
            if (i == 5)
                #1 reset <= 1'b0;     
        end

    // feed stimulus vectors to module under test
    initial
    begin
        for (j = 0; j < 20; j = j+1)
            begin
                @(posedge CLK);
            end 
    end
endmodule
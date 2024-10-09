// ---------------------------
// clock_custom.v
// ---------------------------
module clock_custom (output reg clk);
    initial begin
        clk = 1'b0;
    end

    always begin
        #12 clk = ~clk; // Toggling the clock every 12 time units
    end
endmodule // clock_custom

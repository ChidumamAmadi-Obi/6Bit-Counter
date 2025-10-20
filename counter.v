module top ( input clk, output [5:0] led );

localparam WAIT_TIME = 3500000;
reg [5:0] LED_Display = 0;                  // 6 bit array of on board LEDs
reg [23:0] clockCounter = 0;                // counter to keep track of time, 24 bits to fit 3.5M

always @(posedge clk) begin                 // " on the posetive edge of the clock cycle..."
    clockCounter <= clockCounter + 1;       // increment the clock counter by 1
    if (clockCounter == WAIT_TIME) begin    // if it has been half a second...
        clockCounter <= 0;                  // reset the clock counter
        LED_Display <= LED_Display + 1;     // increment LED Display
    end
end

assign led = ~LED_Display;                  // defines the value of the LED wire " the output goes to pins... "
endmodule                                   // "~" is used to invert the counter, as the onboard LED are common anode


// reg [5:0] (this is an array)
// name [MSB:LSB] 

// since th tang nano clock freq is 27Mhz
// to see the LEDs light up we are going to
// change the LED Display state every half second
// ( waiting 3,500,000 click cycles  between incrimenting , this will be half a aecond)
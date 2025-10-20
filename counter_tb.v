`timescale 1ns/1ps
`include "counter.v"

module tb_top;
    reg clk;
    wire [5:0] led;
    
    // Instantiate the design under test
    top dut (
        .clk(clk),
        .led(led)
    );
    
    // Clock generation
    always #5 clk = ~clk;  // 100MHz clock (10ns period)
    
    // Monitor the LED values
    reg [5:0] last_led_value = 6'b0;
    
    always @(posedge clk) begin
        if (led !== last_led_value) begin
            $display("Time: %0t ns | LED value (inverted): %6b | Raw counter value: %6b", 
                     $time, led, ~led);
            last_led_value <= led;
        end
    end
    
    // Alternative: Print at regular intervals
    reg [31:0] print_counter = 0;
    localparam PRINT_INTERVAL = 1000000; // Print every 1 million cycles
    
    always @(posedge clk) begin
        print_counter <= print_counter + 1;
        if (print_counter >= PRINT_INTERVAL) begin
            $display("[Periodic] Time: %0t ns | LED: %6b | Counter: %6b", 
                     $time, led, ~led);
            print_counter <= 0;
        end
    end
    
    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        last_led_value = 6'b0;
        print_counter = 0;
        
        $display("Starting LED display monitor test bench");
        $display("======================================");
        $display("Time Format | LED (inverted) | Raw Counter");
        $display("--------------------------------------");
        
        // Run simulation for a while to see multiple LED changes
        #70000000; // 70 million time units - should see several LED increments
        
        $display("======================================");
        $display("Simulation completed");
        $finish;
    end
endmodule
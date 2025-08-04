`timescale 1ns/1ps
`include "life.v"  

module life_fsm_tb;

    reg clk, reset, advance;
    wire [2:0] state_out;

    life_fsm dut (
        .clk(clk),
        .reset(reset),
        .advance(advance),
        .state_out(state_out)
    );

    // Clock generation: 10ns period (100 MHz)
    initial clk = 0;
    always #5 clk = ~clk;

    // Task to print ASCII messages for states
    task print_message(input [2:0] state);
        begin
            case (state)
                3'd0: $display("Step 0: [Start] Undergrad in Electrical Engineering (2015)");
                3'd1: $display("Step 1: Senior Design Engineer - Oil & Gas (2019)");
                3'd2: $display("Step 2: Electrical Manager - Marine Industry (2021)");
                3'd3: $display("Step 3: Moved to US for Masters at Purdue (2023)");
                3'd4: $display("Step 4: Graduated from Purdue University (2025)");
                3'd5: $display("Step 5: Onward: Embracing VLSI & Engineering Innovation");
                default: $display("Unknown State");
            endcase
        end
    endtask

    initial begin
        $display("=== Life FSM Simulation Begins ===\n");

        reset = 1; advance = 0; #20;  // Hold reset for 20 ns
        reset = 0; #20;

        print_message(state_out);
        #10_000_000;  // 2 ms pause 

        repeat (5) begin

            @(negedge clk);
            advance = 1;
            @(posedge clk);  
            @(negedge clk);
            advance = 0;

            print_message(state_out);
            #10_000_000;  // 5 ms pause between steps
        end

        $display("\n=== The journey continues towards a better part... ===");
        $finish;
    end

endmodule

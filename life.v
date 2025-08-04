
// This is a very fun project showcasing my life 
module life_fsm (
    input clk,
    input reset,
    input advance,
    output reg [2:0] state_out
);

    // State encoding
    parameter S0 = 3'd0,  // Undergrad
              S1 = 3'd1,  // Oil & Gas Engineer
              S2 = 3'd2,  // Marine Electrical Manager
              S3 = 3'd3,  // Moved to US
              S4 = 3'd4,  // Graduated Purdue
              S5 = 3'd5;  // Future Goals

    reg [2:0] state, next_state;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    // Output logic
    always @(*) begin
        state_out = state;
    end

    // Next-state logic
    always @(*) begin
        case (state)
            S0: next_state = advance ? S1 : S0;
            S1: next_state = advance ? S2 : S1;
            S2: next_state = advance ? S3 : S2;
            S3: next_state = advance ? S4 : S3;
            S4: next_state = advance ? S5 : S4;
            S5: next_state = S5; // Stay here — Future is open
            default: next_state = S0;
        endcase
    end

endmodule

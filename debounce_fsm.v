module debounce_fsm (
input clk, reset_n, timer_done, noisy,
output debounce, timer_reset
);
reg [1:0] state_reg, state_next;
localparam s0 = 0;
localparam s1 = 1;
localparam s2 = 2;
localparam s3 = 3;
//sequential
always @(posedge clk or negedge reset_n)
begin
    if(!reset_n)
        state_reg <= s0;
    else
        state_reg <= state_next;
end
//combinational
always @(*)
begin
    case(state_reg)
        s0: if(noisy)
                state_next = s1;
            else
                state_next = s0;
        s1: if(noisy&~timer_done)
                state_next = s1;
            else if(noisy&timer_done)
                state_next = s2;
            else
                state_next = s0;
        s2: if(noisy)
                state_next = s2;
            else
                state_next = s3;
        s3: if(~noisy&~timer_done)
                state_next = s3;
            else if(~noisy&timer_done)
                state_next = s0;
            else
                state_next = s2;
        default: state_next = s0;     
    endcase
end
//output
assign debounce = (state_reg == s2)|(state_reg == s3);
assign timer_reset = (state_reg == s2)|(state_reg == s0);
endmodule
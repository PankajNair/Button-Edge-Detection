module edge_detector (
input clk, reset_n, level,
output edges
);
reg state_reg, state_next;
localparam s0 = 0;
localparam s1 = 1;
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
        s0: if(level)
                state_next = s1;
            else
                state_next = s0;
        s1: if(level)
                state_next = s1;
            else
                state_next = s0;
        default: state_next = s0;
    endcase
end
//output
assign edges = (state_reg==s0&level)|(state_reg==s1&~level);
endmodule
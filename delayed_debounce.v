module delayed_debounce (
input clk, reset_n, noisy,
output debounce
);
wire timer_done, timer_reset;
debounce_fsm FSM0 (clk, reset_n, timer_done, noisy, debounce, timer_reset);
timer #(1_99_999) T0 (clk, ~timer_reset, ~timer_reset, timer_done);
endmodule
module top(
input clk, reset_n, noisy,
output debounce, edges
);

edge_detector ED0 (clk, reset_n, debounce, edges);
delayed_debounce DB0 (clk, reset_n, noisy, debounce);

endmodule
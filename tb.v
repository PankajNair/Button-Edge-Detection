module tb();

reg clk, reset_n, noisy;
wire debounce, edges;

top uut (clk, reset_n, noisy, debounce, edges);

localparam T = 10;
always
begin
    clk = 0;
    #(T/2);
    clk = 1;
    #(T/2);
end

localparam DELAY = 50_00_000;
initial
begin
    reset_n = 0;
    noisy = 0;
    #2
    reset_n = 1;
    
    noisy = 1'b1;
    #(DELAY); 
    noisy = 1'b0;   
    #(DELAY);
    
    noisy = 1'b1;
    #(DELAY/5);
    noisy = 1'b0;
    #(DELAY/5);
    noisy = 1'b1;
    #(DELAY/5);
    noisy = 1'b0;
    #(DELAY/5);
    noisy = 1'b1;
    #(DELAY); 
    noisy = 1'b0;
    #(DELAY/5);   
    noisy = 1'b1;
    #(DELAY/5);
    noisy = 1'b0;
    #(DELAY/5);
    noisy = 1'b1;
    #(DELAY/5);
    noisy = 1'b0;
    
end
endmodule
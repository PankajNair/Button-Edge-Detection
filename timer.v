module timer #(parameter final_value = 4) (
input clk, reset_n, enable,
output done
);
reg [$clog2(final_value)-1:0]Qreg, Qnext;
//sequential
always @(posedge clk or negedge reset_n)
begin
    if(!reset_n)
        Qreg <= 0;
    else if(enable)
        Qreg <= Qnext;
    else
        Qreg <= Qreg;
end
//combinational
always @(*)
begin
    Qnext = (done)?'b0:Qreg + 1;
end
//output
assign done = (Qreg==final_value);
endmodule
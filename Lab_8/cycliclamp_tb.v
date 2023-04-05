`include "cycliclamp.v"
module cycliclamp_tb;
reg clk;
wire[0:2] light;
wire[0:1] state;
cyclic_lamp LAMP (clk, light, state);
always #5 clk = ~ clk;
initial
begin
clk = 1'b0;
#100 $finish;
end
initial
begin
    $dumpfile("cycliclamp.vcd");
    $dumpvars ( 0,cycliclamp_tb);
    $monitor($time, "\tRGY: %b \tState: %b", light, state);
end
endmodule
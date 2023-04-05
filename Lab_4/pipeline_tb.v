`include "pipeline.v"
module pipeline_tb;
reg[n-1:0] a,b,c,d;
reg clk;
wire [n-1:0]f;
pipeline out(f,a,b,c,d,clk);
parameter n=10;

initial begin
a=0;
b=0;
c=0;
d=0;
clk=0;
end
always #5 clk = ~clk;
//initial begin
//#10 a=1;b=2;c=3;d=4;clk=1;
//forever #10 clk = -clk;
//end

initial begin

a=a+1;
b=b+2;
c=c+3;
d=d+4;

end

initial begin
$dumpfile("pipeline.vcd");
$dumpvars(0, pipeline_tb);
#500 $finish;

end 
endmodule


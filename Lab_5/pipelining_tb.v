`include "pipelining.v"

module pipelining_tb;

wire [15:0] z;
reg [3:0] rs1, rs2, rd, func;
reg [7:0] addr;
reg clk1, clk2;
integer k;

pipelining MYPIPE(z, rs1, rs2, rd, func, addr, clk1, clk2);

initial
begin
    clk1=0;
    clk2=0;
    repeat(20)
    begin
        #5 clk1=1;
        #5 clk1=0;
        #5 clk2=1;
        #5 clk2=0;
    end
end

initial
for (k = 0; k < 16 ; k=k+1) begin
    MYPIPE.regbank[k]=k;
end
    initial 
    begin
        #5  rs1 = 3; rs2 =5; rd = 2; func = 0; addr = 125;
        #20 rs1 = 3; rs2 =5; rd = 2; func = 1; addr = 126;
        #20 rs1 = 3; rs2 =5; rd = 2; func = 2; addr = 127;
        #20 rs1 = 3; rs2 =5; rd = 2; func = 3; addr = 128;
        #20 rs1 = 3; rs2 =5; rd = 4; func = 4; addr = 129;
        #20 rs1 = 3; rs2 =5; rd = 4; func = 5; addr = 130;
        #20 rs1 = 3; rs2 =5; rd = 4; func = 6; addr = 129;
        #20 rs1 = 3; rs2 =5; rd = 4; func = 7; addr = 128;
        #20 rs1 = 3; rs2 =7; rd = 8; func = 8; addr = 127;
        #20 rs1 = 3; rs2 =7; rd = 8; func = 9; addr = 126;
        #20 rs1 = 3; rs2 =7; rd = 8; func = 10; addr = 125;
        #20 rs1 = 3; rs2 =7; rd = 8; func = 11; addr = 126;
        #20 rs1 = 3; rs2 =7; rd = 14; func = 10; addr = 127;
        #20 rs1 = 3; rs2 =7; rd = 14; func = 9; addr = 128;
        #20 rs1 = 3; rs2 =7; rd = 14; func = 8; addr = 129;
        #20 rs1 = 3; rs2 =7; rd = 14; func = 7; addr = 130;

        #60 for(k=125;k<131;k=k+1)
        $display("Mem[%3d]=%3d", k, MYPIPE.membank[k]);
    end

    initial
    begin
        $dumpfile("pipelining.vcd");
        $dumpvars(0,pipelining_tb);
        $monitor("time: %3d, f=%3d", $time, z);
        #300 $finish;
    end
endmodule
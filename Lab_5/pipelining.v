module pipelining(Zout, rs1, rs2, rd, func, addr, clk1, clk2);
input [3:0] rs1, rs2, rd;
input clk1, clk2;
input [3:0] func;
input [7:0] addr;
output [15:0] Zout;
reg [15:0] l12a, l12b, l23z, l34z;
reg [7:0] l12addr, l23addr, l34addr;
reg [3:0] l12func, l12rd, l23rd;
reg [15:0] regbank [15:0];
reg [15:0] membank [255:0];
assign Zout=l34z;
always @ (posedge clk1)
begin
    l12a<=#2 regbank[rs1];
    l12b<=#2 regbank[rs2];
    l12func<=#2 func;
    l12rd<=#2 rd;
    l12addr<=#2 addr;
end
always @ (posedge clk2)
begin
    case (func)
        0:l23z<=#2 l12a + l12b;
        1:l23z<=#2 l12a - l12b;
        2:l23z<=#2 l12a * l12b;
        3:l23z<=#2 l12a;
        4:l23z<=#2 l12b;
        5:l23z<=#2 l12a & l12b;
        6:l23z<=#2 l12a | l12b;
        7:l23z<=#2 l12a ^ l12b;
        8:l23z<=#2 ~l12a;
        9:l23z<=#2 ~l12b;
        10:l23z<=#2 l12a>>1;
        11:l23z<=#2 l12b<<1;
        default: l23z<=16'hxxxx;
    endcase
    l23rd<=#2 l12rd;
    l23addr<=#2 l12addr;
end
always @ (posedge clk1)
begin
    regbank[l23rd] <= #2 l23z;
    l34z<= #2 l23z;
    l34addr = #2 l23addr;
end
always @ (posedge clk2)
begin
    membank[l34addr] = #2 l34z;
end
endmodule

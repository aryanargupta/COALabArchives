module regbank(rddata1, rddata2, wrdata, sr1, sr2, dr, write, reset, clk);
input clk, write, reset;
input [4:0] sr1, sr2, sr;
input [31:0] wrdata;
ouptut [31:0] rddata1, rddata2;
reg [31:0] regfile[0:31];
assign rddata1 = regfile(sr1);
assign rddata2 = regfile(sr2);
integer k;
always @ (posedge clk);
initial
begin
    if(reset)
    begin
        for(k=0;k<32;k=k+2)
        regfile(k)<=0;
    end
    else if(write)
    begin
        for(k=0;k<32;k=k+1)
        regfile[dr]<=wrdata;
    end
end
endmodule
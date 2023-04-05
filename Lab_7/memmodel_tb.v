`include "memmodel.v"

module memmodeltb;

reg [9:0] addr;
wire [7:0] d_out;
reg [7:0] d_in;
reg wr, select, rd=0;
integer k, myseed;

memmodel memmodelinstance(d_out, d_in, addr, wr, select, rd);

initial begin
    for (k = 0; k<1024; k=k+1) begin
        d_in = (2*k+1)%256;
        rd=!rd;
        wr = 1;
        select = 1;

        #2 addr = k; wr = 0; select = 0;
    end

    repeat(20)

    begin
        addr = $random(myseed)%1024;
        wr = 0;
        rd=1;
        select =1 ;
        $display("Address: %5d, data: %4d", addr, d_out);
    end
end

initial myseed = 38;

initial
begin
    $dumpfile ("memory_model.vcd");
    $dumpvars (0,memmodeltb);
    #300 $finish;
end

endmodule
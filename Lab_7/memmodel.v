module memmodel(d_out, d_in, addr, wr, cs, rd);

parameter addr_size = 10, word_size = 8, memory_size = 1024;

input[addr_size-1:0] addr;
input[word_size-1:0] d_in;
input wr, cs, rd;
reg [word_size-1:0] mem[memory_size-1:0];
output[word_size-1:0] d_out;

assign d_out = mem[addr];

always @(wr or cs)
if(!rd) mem[addr] = d_in;

endmodule

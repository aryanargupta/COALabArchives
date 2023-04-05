module cyclic_lamp(clock,light,state);
input clock;
output reg [0:2] light;
parameter s0 = 0, s1=1, s2=2, s3=3;
parameter red= 3'b100, green = 3'b010, yellow=3'b001, black=3'b111;
output reg[0:1] state;
always @(posedge clock)
case (state)
s0:begin
light <= green ; state <=s1;
end
s1:begin
light <=yellow ; state <= s2;
end
s2 : begin
light <= red ; state<=s0;
end
s3: begin
light <= black ; state<=s0;
end

default : begin 
light <= black;
state <= s3;
end
endcase
endmodule
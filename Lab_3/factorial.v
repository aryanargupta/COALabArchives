module fact();

reg[30:0] a, i;
initial begin
    a=1;
    for(i = 1; i <= 12; i = i + 1)
    begin
        a = a*i;
        $display("factorial(%0d) = %0d", i, a);
    end
end


endmodule
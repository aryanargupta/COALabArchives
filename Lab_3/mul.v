module mul();

reg[10:0] a,b,prod,i;
initial begin
    a=17;
    b=5;
    prod=0;
    for(i = 1; i <= b; i = i + 1)
    begin
        prod = prod + a;
    end
    $display("product = %0d", prod);
end

endmodule
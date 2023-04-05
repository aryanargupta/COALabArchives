module gcd();

reg[31:0] a, b, temp_b, t, gcd;
initial begin
    a=14;
    gcd = a;
    b=70;
    temp_b=b;
    while(temp_b) begin
        t=temp_b;
        temp_b=gcd%temp_b;
        gcd=t;
    end
    $display("gcd of %0d and %0d is: %0d",a,b,gcd);
end


endmodule
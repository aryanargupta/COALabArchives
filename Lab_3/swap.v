module swap();

reg[3:0] a,b;
initial begin
    a=4'b0101;
    b=4'b0110;
    $display("value of a before swap: %d",a);
    $display("value of b before swap: %d\n",b);
    a=a+b;
    b=a-b;
    a=a-b;
    $display("value of a after swap: %d", a);
    $display("value of b after swap: %d", b);
end

endmodule
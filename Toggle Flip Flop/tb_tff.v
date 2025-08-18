module tb_tff;

reg clk,reset;
reg T;
wire Q;

TFF dut(.clk(clk),.reset(reset),.T(T),.Q(Q));

always
begin
    clk=1'b0;
    #10;
    clk=1'b1;
    #10;
end 

initial 
begin
    reset=1'b1;
    #40;
    reset=1'b0;
    #40;
    T=0;
    #40;
    T=1;
    #40;
    $finish;
end

endmodule
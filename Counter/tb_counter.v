module tb_counter;

reg clk,reset;
wire [2:0] Q;

R_Counter dut(.clk(clk),.reset(reset),.Q(Q));

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
    #400;
    reset=1'b1;
    #20;
    reset=1'b0;
    #200;
    $finish;
end

endmodule
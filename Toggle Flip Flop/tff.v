module TFF
(
clk,reset,
T,
Q
);

input wire clk,reset;
input wire T;
output wire Q;

reg q_next,q_reg;

always@(posedge clk)
begin
    if(reset==1'b1)
    begin
        q_reg<=1'b0;    
    end
    else
    begin
        q_reg<=q_next;
   end
end

always@(*)
begin
    if(T==1'b1)
    begin
        q_next=~q_reg;
    end
    else
    begin
        q_next=q_reg;
    end
end

assign Q = q_reg;

endmodule

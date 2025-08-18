module R_Counter
(
clk,reset,Q
);

input wire clk,reset;
output wire [2:0] Q;

/*
//Using TFFs
wire t0,t1,t2,t3,t4;

not n1(t3,Q[0]);
not n2(t4,Q[2]);

or o1(t0,Q[0],Q[2]);
or o3(t2,Q[1],Q[2]);

and a1(t1,t3,t4);

TFF tff0(clk,reset,t0,Q[0]);
TFF tff1(clk,reset,t1,Q[1]);
TFF tff2(clk,reset,t2,Q[2]);
*/

//Using State Transition Diagram
parameter [2:0] S0 =3'b000;
parameter [2:0] S2 =3'b010;
parameter [2:0] S4 =3'b100;
parameter [2:0] S1 =3'b001;

reg [2:0] current_state,next_state;

always@(posedge clk)
begin
    if(reset==1'b1)
    begin
        current_state<=S0;
    end
    else
    begin
        current_state<=next_state;
    end
end

always@(*)
begin
    case(current_state)
        S0:next_state=S2;
        S2:next_state=S4;
        S4:next_state=S1;
        S1:next_state=S0;
        default:next_state=S0;
        endcase
end

assign Q = current_state;

endmodule

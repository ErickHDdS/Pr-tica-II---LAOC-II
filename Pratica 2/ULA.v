module ULA(sinal, A, G, Barramento);
	input[3:0] sinal;
	input [15:0] A, Barramento;
	output reg [15:0] G;
	
	always@(*)
		begin
			case(sinal)begin
				4'b0101:	G = A + Barramento						//add
				4'b0110:	G = A - Barramento						//sub
				4'b0111:	G = A | Barramento						//or
				4'b1000:													//slt
							if(A < Barramento)
								G = 16'b1;
							else
								G = 16'b0;
				4'b1001:	G = A << Barramento						//sll
				4'b1010:	G = A >> Barramento						//srl
			endcase
		end
	endmodule
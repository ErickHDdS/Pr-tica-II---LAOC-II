module ULA(sinal, A, G, Bus);
	input[3:0] sinal;
	input [15:0] A, Bus;
	output reg [15:0] G;
	
	always@(*)
		begin
			case(sinal)begin
				4'b0101:	G = A + Bus						//add
				4'b0110:	G = A - Bus						//sub
				4'b0111:	G = A | Bus						//or
				4'b1000:										//slt
							if(A < Bus)
								G = 16'b1;
							else
								G = 16'b0;
				4'b1001:	G = A << Bus					//sll
				4'b1010:	G = A >> Bus					//srl
			endcase
		end
	endmodule
module MUX(R0, R1, R2, R3, R4, R5, R6, R7, Bus, DIN, G, control );
	input[15:0] R0, R1, R2, R3, R4, R5, R6, R7, G, DIN;
	input [9:0] control;
	output reg[15:0] Bus;
	
	always@(*) begin
		case(control)
			10’b1000000000:	Bus = DIN;
			10’b0100000000:	Bus = R0;
			10’b0010000000:	Bus = R1;
			10’b0001000000:	Bus = R2;
			10’b0000100000:	Bus = R3;
			10’b0000010000:	Bus = R4;
			10’b0000001000:	Bus = R5;
			10’b0000000100:	Bus = R6;
			10’b0000000010:	Bus = R7;
			10’b0000000001:	Bus = G;
			
		endcase
	end
endmodule
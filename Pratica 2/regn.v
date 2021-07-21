//(BusWires, regIn[0], Clock, R0, Resetn);
module regn(R, Rin, Clock, Q, set0);
	parameter n = 16;
	input [n-1:0] R;
	input Rin, Clock, set0;
	output [n-1:0] Q;
	reg [n-1:0] Q;
	
	always @(posedge Clock)
		if (Rin)
			Q <= R;
		else
			if(set0)
				Q <=16'b0;
endmodule
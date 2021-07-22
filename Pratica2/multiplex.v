//module multiplex (din, r0, r1, r2, r3, pc, g, mem, control, out);
//module multiplex (din, r0, r1, r2, r3, r4, r5, r6, pc, g, mem, control, out);
module multiplex (din, r0, r1, r2, r3, r4, r5, r6, pc, g, control, out);
//input en;
input [0:9]  control;
//input [0:7]  control;
input [15:0] din, r0, r1, r2, r3, r4, r5, r6, g;
//input [15:0] din, r0, r1, r2, r3, g, mem;
input [5:0] pc;

output reg [15:0] out; //Bus


always@(control) 
	begin
		
			case (control)
				10'b1000000000: out = din;
				10'b0100000000: out = r0;
				10'b0010000000: out = r1;
				10'b0001000000: out = r2;
				10'b0000100000: out = r3;
				10'b0000010000: out = r4;
				10'b0000001000: out = r5;
				10'b0000000100: out = r6;
				10'b0000000010: out = {5'b0,pc};
				10'b0000000001: out = g;
				//10'b00000000001: out = mem;
				//12'b000000000001: out = mem;
			/*
				12'b100000000000: out = din;
				12'b010000000000: out = r0;
				12'b001000000000: out = r1;
				12'b000100000000: out = r2;
				12'b000010000000: out = r3;
				12'b000001000000: out = r4;
				12'b000000100000: out = r5;
				12'b000000010000: out = r6;
				12'b000000001000: out = ;
				12'b000000000100: out = {11'b0,pc};
				12'b000000000010: out = g;
				12'b000000000001: out = mem;
				*/
				/*
				8'b10000000: out = din;
				8'b01000000: out = r0;
				8'b00100000: out = r1;
				8'b00010000: out = r2;
				8'b00001000: out = r3;
				8'b00000100: out = {11'b0, pc};
				8'b00000010: out = g;			
				8'b00000001: out = mem;				*/
			endcase
		
	end

endmodule

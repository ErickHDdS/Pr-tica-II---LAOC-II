module TLB(addr, Clock, out);

	input [5:0] addr;
	input Clock;
 	output reg [15:0] out;

	reg [5:0] vP [0:45];
	reg [15:0] fP [0:45]; 
	
	integer hitAddr, hitIndex, i, break, addressSize;
	
	initial begin
		
			//paginas virtuais
			vP[0] = 6'b000000;  vP[11]= 6'b001011;  vP[22]= 6'b010110;  vP[33]= 6'b100001;
			vP[1] = 6'b000001;  vP[12]= 6'b001100;  vP[23]= 6'b010111;  vP[34]= 6'b100010;
			vP[2] = 6'b000010;  vP[13]= 6'b001101;  vP[24]= 6'b011000;  vP[35]= 6'b100011;
			vP[3] = 6'b000011;  vP[14]= 6'b001110;  vP[25]= 6'b011001;  vP[36]= 6'b100100;
			vP[4] = 6'b000100;  vP[15]= 6'b001111;  vP[26]= 6'b011010;  vP[37]= 6'b100101;
			vP[5] = 6'b000101;  vP[16]= 6'b010000;  vP[27]= 6'b011011;  //vP[38]= 6'b100110;
			vP[6] = 6'b000110;  vP[17]= 6'b010001;  vP[28]= 6'b011100;  //vP[39]= 6'b100111;
			vP[7] = 6'b000111;  vP[18]= 6'b010010;  vP[29]= 6'b011101;  //vP[40]= 6'b101000;
			vP[8] = 6'b001000;  vP[19]= 6'b010011;  vP[30]= 6'b011110;  //vP[41]= 6'b101001;
			vP[9] = 6'b001001;  vP[20]= 6'b010100;	 vP[31]= 6'b011111;  //vP[42]= 6'b101010;
			vP[10]= 6'b001010;  vP[21]= 6'b010101;  vP[32]= 6'b100000;  //vP[43]= 6'b101011;
			 
			
			//paginas fisicas
			fP[0] = 16'b0100000000000000; // MVI R0, #2
			fP[1] = 16'b0000000000000010; // #2
			fP[2] = 16'b0100001000000000; // MVI R1, #3
			fP[3] = 16'b0000000000000011; // #3
			fP[4] = 16'b0101001000000000; // ADD R1,R0
			fP[5] = 16'b0100010000000000; // MVI R2, #6
			fP[6] = 16'b0000000000000110; // #6
			fP[7] = 16'b0110010001000000; // SUB R2, R1
			fP[8] = 16'b0000011010000000; // MV R3, R2
			fP[9] = 16'b0101000011000000; // ADD R0, R3
			fP[10]= 16'b0111001000000000; // OR R1, R0
			fP[11]= 16'b0110001000000000; // SUB R1, R0
			fP[12]= 16'b0101001011000000; // ADD R1, R3
			fP[13]= 16'b1001001011000000; // SLL R1, R3
			fP[14]= 16'b1010001011000000; // SRL R1, R3
			fP[15]= 16'b0100000000000000; // MVI R0, #0
			fP[16]= 16'b0000000000000000; // #0
			fP[17]= 16'b1000000001000000; // SLT R0, R1
			fP[18]= 16'b1000001001000000; // SLT R1, R1
			fP[19]= 16'b0100011000000000; // MVI R3, #3
			fP[20]= 16'b0000000000000011; // #3
			fP[21]= 16'b0100001000000000; // MVI R1, #5
			fP[22]= 16'b0000000000000101; // #5
			fP[23]= 16'b0101000011000000; // ADD R0, R3
			fP[24]= 16'b0100000000000000; // MVI R0, #0
			fP[25]= 16'b0000000000000000; // #0
			fP[26]= 16'b0011010011000000; // LD R2, R3
			fP[27]= 16'b0101010011000000; // ADD R2, R3
			fP[28]= 16'b0001010000000000; // SD R2, R0
			fP[29]= 16'b0011000000000000; // LD R0, R0
			fP[30]= 16'b0110000011000000; // SUB R0, R3
			fP[31]= 16'b0100000000000000; // MVI R0, #0
			fP[32]= 16'b0000000000000000; // #0
			fP[33]= 16'b0101000000000000; // ADD R0, R0
			fP[34]= 16'b0010000010000000; // MVNZ R0, R2
			fP[35]= 16'b0110001011000000; // SUB R1, R3
			fP[36]= 16'b0010000010000000; // MVNZ R0, R2
			fP[37]= 16'b0101000001000000; // ADD R0, R1
			
			/*
			// Loop
			fP[0] = 16'b0100010000000000;
			fP[1] = 16'b0000000000000001;
			fP[2] = 16'b0100100000000000;
			fP[3] = 16'b0000000000001010;
			fP[4] = 16'b0000101111000000;
			fP[5] = 16'b0110100010000000;
			fP[6] = 16'b0010111101000000;	
			*/
	end
	
	always @(*) begin
		addressSize = 40;
		out = 16'b0;
		hitAddr = 0; 
		hitIndex = 0; 
		i = 0; 
		break = 0;
		
		for (i=0;i<addressSize;i=i+1) begin
			if (break == 0) begin
				if (addr == vP[i]) begin
					break = 1;
					hitAddr = 1;
					hitIndex = i;
				end
				else begin
					hitAddr = 0;
				end
			end
		end
		
		if (hitAddr == 1) begin
			out = fP[hitIndex];
		end
		else begin
			out = 16'b0;
		end
				
	end

endmodule

module proc (DIN, Resetn, Clock, Run, Done, BusWires);
	input [15:0] DIN;
	input Resetn, Clock, Run;
	output reg Done;
	output [15:0] BusWires;
	
	// registers
	wire[15:0] R0, R1, R2, R3, R4, R5, R6, R7, A, G;
	wire[15:0] saidaULA;
	wire [0:7] Xreg, Yreg;
 	reg [0:7] regIn, regOut; //o que entra e sai do multiplexador
	
	// instructions
	wire [9:0] IR;
	wire [3:0] I; //bits das instrucoes
	wire [1:0] Tstep_Q; //ciclo de instrucao
	
	// signals
	reg Clear, aIn, gIn, gOut, dinOut, irIn, addIn, doutIn, wIn;
	reg [2:0] signalUla;
	
	upcount Tstep (Clear, Clock, Tstep_Q);
	
	assign I = IR[8:6];						//NAO SEI OQ TA ACONTECENDO AQUI =)
	
	dec3to8 decX (IR[5:3], 1'b1, Xreg); //NAO SEI OQ TA ACONTECENDO AQUI =')
	dec3to8 decY (IR[2:0], 1'b1, Yreg); //NAO SEI OQ TA ACONTECENDO AQUI ='(
	
	always @(Tstep_Q or I or Xreg or Yreg)
	begin
		//... specify initial values
		aIn = 1'b0;
		gIn = 1'b0;
		gOut = 1'b0;
		dinOut = 1'b0;	
		irIn = 1'b0;
		//signalUla = 3'b000;
		regOut = 8'b0;
		regIn = 8'b0;	
		//Done = 1'b0;
		
		if (Run) begin
		
			case (Tstep_Q)
				2'b00: // store DIN in IR in time step 0
				begin
					irIn = 1'b1;
					Done = 1'b0;
					Clear = 1'b0;
				end
			
				2'b01: //define signals in time step 1
				begin 
					case (I)
					4'b0000: //ld
						begin
							regOut = Yreg;
							addIn = 1;							
						end
						
					4'b0001:	//st
						begin
							regOut = Xreg;
							doutIn = 1;							
						end
						
					4'b0010:	//mvnz
						begin
							if(G!=0)
								begin
									regOut = Yreg;
									regIn = Xreg;		
								end
							Done = 1;
						end
						
					4'b0011:	//mv
						begin
							regOut = Yreg;
							regIn = Xreg;
							Done = 1;							
						end
						
					4'b0100:	//mvi	
						begin
							regIn = Xreg;
							dinOut = 1;							
						end
						
					4'b0101:	//add
						begin
							regOut = Xreg;
							aIn = 1;							
						end
						
					4'b0110: //sub
						begin
							regOut = Xreg;
							aIn = 1;							
						end
						
					4'b0111:	//or
						begin
							regOut = Xreg;
							aIn = 1;							
						end
						
					4'b1000: //slt
						begin
							regOut = Xreg;
							aIn = 1;							
						end
						
					4'b1001: //sll
						begin
							regOut = Xreg;
							aIn = 1;							
						end
											
					4'b1010: //srl
						begin
							regOut = Xreg;
							aIn = 1;							
						end
					endcase
				end
				
				2'b10: //define signals in time step 2
					begin 
					   case (I)
							4'b0101:	signalUla = 3'b000;
							4'b0110:	signalUla = 3'b001;
							4'b0111:	signalUla = 3'b010;
							4'b1000: signalUla = 3'b011;
							4'b1001: signalUla = 3'b100;
							4'b1010: signalUla = 3'b101;
						endcase
					end
				
				2'b11: //define signals in time step 3
					begin
						if(I > 3'b001) begin
							gOut = 1'b1;
							regIn = Xreg;
							Done = 1'b1;
						end
						Clear = 1'b1;
					end
			endcase
		end
	end
	regn reg_0 (BusWires, regIn[0], Clock, R0);
	//... instantiate other registers and the adder/subtracter unit
	//... define the bus
endmodule
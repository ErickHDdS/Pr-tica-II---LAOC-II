module instructionFetch(addr, MClock, DIN);

	input [5:0] addr;
	input MClock;
	output [15:0] DIN;
	
	wire [5:0] memOut;
		
	romlpm address(addr, MClock, memOut);  	// Gera uma pagina virtual, tera que passar uma TLB	
	TLB tlb(memOut, MClock, DIN);					// Endereco pagina fisica = tlbOut
	
endmodule
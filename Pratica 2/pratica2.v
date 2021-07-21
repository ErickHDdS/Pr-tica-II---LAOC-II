module pratica2(clock, pcClock, resetN, run, bus, done);
	input clock, pcClock, resetN, run;
	output [15:0] bus;
	output done;
	
	wire [4:0] n;
	wire [15:0] memoryOut;
	
	upcount_5 count(resetN, clock, n);
	
	memory2 mem(n, clock, memoryOut);
	// memory (n, clock, , data, wren, memoryOut);
	//memory ( 	address, clock, data, wren, q);
	
	proc processor(memoryOut, resetN, pcClock, run, done, bus);
	
endmodule
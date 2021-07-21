module pratica2(clock, pcClock, resetN, run, bus, done, n);
	input clock, pcClock, resetN, run, n;
	output [15:0] bus;
	output done;
	
	wire [4:0] n;
	wire [15:0] memoryOut;
	
	//upcount_5 count(resetN, clock, n);
	memory mem(n, clock, memoryOut);
	proc processor(memoryOut, resetN, pcClock, run, done, bus);
endmodule
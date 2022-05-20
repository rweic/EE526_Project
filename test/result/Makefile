# FILES
SRC = ../../src/*.v #gaussian_core.v
TESTBENCH = ../gaussian_core_tb.v
COUTPUT = compiler.out
TBOUTPUT = gaussian_core_tb.vcd
			
#TOOLS
COMPILER = iverilog
SIMULATOR = vvp
VIEWER = gtkwave

#MAKE DIRECTIVES
compile : $(TESTBENCH) $(SRC)
	$(COMPILER) $(SRC) $(TESTBENCH) -o $(COUTPUT)

simulate: $(COUTPUT)
	$(SIMULATOR) $(COUTPUT)

display: $(TBOUTPUT)
	$(VIEWER) $(TBOUTPUT) &

clean:
	rm $(TBOUTPUT)
	rm $(COUTPUT)

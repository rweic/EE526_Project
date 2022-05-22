# FILES
SRC = ../../src/gaussian_core.v ../../src/binary_test.v
TESTBENCH = ../binary_test_tb.v
COUTPUT = compiler.out
TBOUTPUT = *.vcd
			
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

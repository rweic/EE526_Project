# FILES
SRC = ../../src/gaussian_core.v ../../src/dram_ori.v ../../src/dram.v ../../src/gaussian_ctrl.v ../../src/brief_ctrl.v ../../src/binary_test.v ../../src/brief.v
TESTBENCH = ../brief_tb.v
COUTPUT = compiler.out
TBOUTPUT = brief_tb.vcd
			
#TOOLS
COMPILER = iverilog
SIMULATOR = vvp
VIEWER = gtkwave

#MAKE DIRECTIVES
compile : $(TESTBENCH) $(SRC)
	$(COMPILER) $(SRC) $(TESTBENCH) -o $(COUTPUT)

simulate: $(TESTBENCH) $(SRC)
	$(COMPILER) $(SRC) $(TESTBENCH) -o $(COUTPUT)
	$(SIMULATOR) $(COUTPUT)

display: $(TBOUTPUT)
	$(VIEWER) $(TBOUTPUT) &

clean:
	rm $(TBOUTPUT)
	rm $(COUTPUT)

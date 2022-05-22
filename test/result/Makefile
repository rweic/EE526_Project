# FILES
SRC = ../../src/gaussian_core.v ../../src/binary_test.v ../../src/dram_ori.v
TESTBENCH = ../dram_ori_tb.v
COUTPUT = compiler.out
TBOUTPUT = dram_ori_tb.vcd
			
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

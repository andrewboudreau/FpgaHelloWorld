
// Include common routines
#include <verilated.h>
#include <iostream>

// Include model header, generated from Verilating "top.v"
#include "Vtop.h"
using namespace std;

int main(int argc, char** argv, char** env) {
    // Construct the Verilated model, from Vtop.h generated from Verilating "top.v"
    Vtop top;

	top.rst = top.clk = 0;
	top.eval();
	top.rst = 1;
	
	for (int time = 0; time < 10 && !Verilated::gotFinish(); time++)
	{
		cout << "out: " << top.out << endl;
		
		// Rising Edge
		top.clk = 1;
		top.eval();
		
		// Falling Edge
		top.clk = 0;
		top.eval();
	}
	
	top.final();
	
	return 0;
}

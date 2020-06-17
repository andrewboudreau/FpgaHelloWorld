// Include common routines
#include <verilated.h>
#include <iostream>

// Include model header, generated from Verilating "alu.v"
#include "Valu.h"

using namespace std;

int main(int argc, char** argv, char** env) {
    Valu top;
	
	top.command = 0;
	
	for (int time = 0; time < 10 && !Verilated::gotFinish(); time++)
	{
		top.lhs = time;
		top.rhs = 0b00000111;
		top.eval();
		cout << "result: " << top.res << endl;
	}
	
	top.final();
	
	return 0;
}

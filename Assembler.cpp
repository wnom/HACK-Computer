/*
William Norman
4282202797
*/

#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
#include <unordered_map>
#include <bitset>
using namespace std;




vector<string> cleanLines(vector<string> v){//Might need to trim whitespace
    vector<string> c;
    for(string str : v){
        string cand = str;
		
        while(cand[0] == ' ' ||  cand[0] == '\t'){
            cand = cand.substr(1, cand.length()-1);
        }
        if(cand[0] != '/' && cand.length() != 0){
            int find = cand.find("//");
            if(find != string::npos)
                cand = cand.substr(0,find);
            
            c.push_back(cand);
        }
    
    }
    return c;
}

unordered_map<string, string> createSymbolTable(vector<string> clean){
    unordered_map<string, string> output;
    output["SP"] = "0000000000000000";
    output["LCL"] = "0000000000000001";
    output["ARG"] = "0000000000000010";
    output["THIS"] = "0000000000000011";
    output["THAT"] = "0000000000000100";
    output["R0"] = "0000000000000000";
    output["R1"] = "0000000000000001";
    output["R2"] = "0000000000000010";
    output["R3"] = "0000000000000011";
    output["R4"] = "0000000000000100";
    output["R5"] = "0000000000000101";
    output["R6"] = "0000000000000110";
    output["R7"] = "0000000000000111";
    output["R8"] = "0000000000001000";
    output["R9"] = "0000000000001001";
    output["R10"] = "0000000000001010";
    output["R11"] = "0000000000001011";
    output["R12"] = "0000000000001100";
    output["R13"] = "0000000000001101";
    output["R14"] = "0000000000001110";
    output["R15"] = "0000000000001111";
    bitset<16> binval(16384);
    output["SCREEN"] = binval.to_string();
    bitset<16> binval2(24576);
    output["KBD"] = binval2.to_string();
    int nextUp = 16;
	int pc = 0;
    for(string str : clean){
        if(str[0] == '('){
            int find = str.find(')');
            string label = str.substr(1, find-1);
            bitset<16> binval3(pc);
            output[label] = binval3.to_string();
            
        }
		pc++;
    }
    
    for(string str : clean){
        if(str[0] == '@'){
            if(!isdigit(str[1])){
                string var = str.substr(1, str.length()-1);
                if(output.find(var) == output.end()){
                    bitset<16> binval3(nextUp);
                    output[var] = binval3.to_string();
					nextUp++;
                }
            }
        }
    
    }
    
    return output;
}

unordered_map<string, string> createCompTable(){
    unordered_map<string, string> output
    ({ { "0", "0101010"}, { "1", "0111111"}, { "-1", "0111010"}, { "D", "0001100"},
	{ "A", "0110000"}, { "M", "1110000"}, { "!D", "0001101"}, { "!A", "0110001"},
	{ "!M", "1110001"}, { "-D", "0001111"}, { "-A", "0110011"}, { "-M", "1110011"},
	{ "D+1", "0011111"}, { "A+1", "0110111"}, { "M+1", "1110111"}, { "D-1", "0001110"},
	{ "A-1", "0110010"}, { "M-1", "1110010"}, { "D+A", "0000010"}, { "D+M", "1000010"},
	{ "D-A", "0010011"}, { "D-M", "1010011"}, { "A-D", "0000111"}, { "M-D", "1000111"},
	{ "D&A", "0000000"}, { "D&M", "1000000"}, { "D|A", "0010101"}, { "D|M", "1010101"}});
    
    return output;
}



unordered_map<string, string> createDestTable(){
    unordered_map<string, string> output
	({ { "M", "001" }, { "D", "010" }, { "MD", "011" }, { "A", "100" },
	{ "AM", "101" }, { "AD", "110" }, { "AMD", "111" } });
    
    
    return output;
}

unordered_map<string, string> createJumpTable(){
    unordered_map<string, string> output
	({ { "JGT", "001" }, { "JEQ", "010" }, { "JGE", "011"}, { "JLT", "100" },
	{ "JNE", "101" }, { "JLE", "110" }, { "JMP", "111" }});
    
    
    return output;
}

bool isAInstr(string line){
	if(line[0] != '@')
		return false;
	string strip = line.substr(1, line.length()-1);
	if(isdigit(strip[0])){
		for(int i = 1; i < strip.length(); i++){
			if(!isdigit(strip[i])){
				return false;
			}
		}
	}
	return true;//Want to check if in list of valid symbols
}

string aInstruction(string line, unordered_map<string, string> symbolTable){
	line = line.substr(1, line.length()-1);
	if(symbolTable.find(line) != symbolTable.end())
		return symbolTable[line];
	int num = stoi(line);
	bitset<15> binval(num);
	return "0" + binval.to_string();

}

bool isCInstr(string line, unordered_map<string, string> compTable, unordered_map<string, string> destTable, unordered_map<string, string> jumpTable){
	auto equals = line.find("=");
	auto semi = line.find(";");
	//cout << equals << " " << semi << endl;
	//cout << equals << " " << semi << endl;
	if(equals != string::npos && semi != string::npos){//all 3
		//cout << "yes" << endl;
		string dest = line.substr(0,equals);
		string comp = line.substr(equals+1, semi-equals-1);
		string jmp = line.substr(semi+1, 3);
		//cout << dest << " " << comp << " " << jmp << endl;
		if(destTable.find(dest) != destTable.end() && compTable.find(comp) != compTable.end() && jumpTable.find(jmp) != jumpTable.end()){
			return true;
		}
		return false;
	}else if(semi != string::npos){//comp and jump only
		string comp = line.substr(0, semi);
		string jmp = line.substr(semi+1, 3);
		if(compTable.find(comp) != compTable.end() && jumpTable.find(jmp) != jumpTable.end()){
			return true;
		}
		return false;
	}else if(equals != string::npos){//dest and comp only
		string dest = line.substr(0,equals);
		string comp = line.substr(equals+1, line.length()-equals-1);
		if(destTable.find(dest) != destTable.end() && compTable.find(comp) != compTable.end()){
			return true;
		}
		return false;
	}else{
		if(compTable.find(line) != compTable.end())//if just comp(valid)
			return true;
	}
	return false;
	
	
}

string cInstruction(string line, unordered_map<string, string> compTable, unordered_map<string, string> destTable, unordered_map<string, string> jumpTable){
	auto equals = line.find("=");
	auto semi = line.find(";");
	//cout << equals << " " << semi << endl;
	if(equals != string::npos && semi != string::npos){//all 3
		string dest = line.substr(0,equals);
		string comp = line.substr(equals+1, semi-equals-1);
		string jmp = line.substr(semi+1, 3);
		return "111" + compTable[comp] + destTable[dest] + jumpTable[jmp];
	}else if(semi != string::npos){//comp and jump only
		string comp = line.substr(0, semi);
		string jmp = line.substr(semi+1, 3);
		return "111" + compTable[comp] + "000" + jumpTable[jmp];
	}else if(equals != string::npos){//dest and comp only
		string dest = line.substr(0,equals);
		string comp = line.substr(equals+1, line.length()-equals-1);
		return "111" +  compTable[comp] + destTable[dest] + "000";
	}else{
		return "111" + compTable[line] + "000000";
	}
	return "error";
}


int main() {
    /* Enter your code here. Read input from STDIN. Print output to STDOUT */ 
    vector<string> v;
    string s;
    while(getline(cin, s)){
        v.push_back(s);

    
    }
    vector<string> clean = cleanLines(v);
    
    unordered_map<string, string> symbolTable = createSymbolTable(clean);
	
    
    unordered_map<string, string> compTable = createCompTable();
    
    unordered_map<string, string> destTable = createDestTable();
    
    unordered_map<string, string> jumpTable = createJumpTable();
	int count = 0;
	for(string line : clean){
		//cout << line << endl;
		if(isAInstr(line)){
			string out = aInstruction(line, symbolTable);
			cout << out << endl;
		}
		if(isCInstr(line, compTable, destTable, jumpTable)){
			string out = cInstruction(line, compTable, destTable, jumpTable);
			cout << out << endl;
			count++;
			
		}
	}
	//cout << count << endl;
    
    
    
    
    
    
    return 0;
}

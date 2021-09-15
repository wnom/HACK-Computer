/*
William Norman
4282202797
*/

#include <vector>
#include <iostream>
#include <algorithm>
#include <unordered_map>
#include <bitset>
using namespace std;

/*
({ { "0", "0101010"}, { "1", "0111111"}, { "-1", "0111010"}, { "D", "0001100"},
	{ "A", "0110000"}, { "M", "1110000"}, { "!D", "0001101"}, { "!A", "0110001"},
	{ "!M", "1110001"}, { "-D", "0001111"}, { "-A", "0110011"}, { "-M", "1110011"},
	{ "D+1", "0011111"}, { "A+1", "0110111"}, { "M+1", "1110111"}, { "D-1", "0001110"},
	{ "A-1", "0110010"}, { "M-1", "1110010"}, { "D+A", "0000010"}, { "D+M", "1000010"},
	{ "D-A", "0010011"}, { "D-M", "1010011"}, { "A-D", "0000111"}, { "M-D", "1000111"},
	{ "D&A", "0000000"}, { "D&M", "1000000"}, { "D|A", "0010101"}, { "D|M", "1010101"}});
*/

string CInstr(string line){
	unordered_map<string, string> destTable
	({ { "001", "M" }, { "010", "D" }, { "011", "MD" }, { "100", "A" },
	{ "101", "AM" }, { "110", "AD" }, { "111", "AMD" } });
	unordered_map<string, string> compTable
	({{"0101010", "0"}, {"0111111", "1"}, {"0111010", "-1"}, {"0001100", "D"},
	{ "0110000", "A"}, { "1110000", "M"}, { "0001101", "!D"}, { "0110001", "!A"},
	{ "1110001", "!M"}, { "0001111", "-D"}, { "0110011", "-A"}, { "1110011", "-M"},
	{ "0011111", "D+1"}, { "0110111", "A+1"}, { "1110111", "M+1"}, { "0001110", "D-1"},
	{ "0110010", "A-1"}, { "1110010", "M-1"}, { "0000010", "D+A"}, { "1000010", "D+M"},
	{ "0010011", "D-A"}, { "1010011", "D-M"}, { "0000111", "A-D"}, { "1000111", "M-D"},
	{ "0000000", "D&A"}, { "1000000", "D&M"}, { "0010101", "D|A"}, { "1010101", "D|M"}});
	unordered_map<string, string> jumpTable 
	({ { "001", "JGT" }, { "010", "JEQ" }, { "011", "JGE"}, { "100", "JLT" },
	{ "101", "JNE" }, { "110", "JLE" }, { "111", "JMP" }});
	
	string comp = line.substr(2,7);
	string dest = line.substr(9, 3);
	string jump = line.substr(12, 3);
	string out;
	
	if(dest == "000" && jump == "000"){
		out += compTable[comp];
	}else if(dest == "000"){
		out += compTable[comp] + ";" + jumpTable[jump];
	}else if(jump == "000"){
		out += destTable[dest] + "=" + compTable[comp];
	}else{
		out += destTable[dest] + "=" + compTable[comp] + ";" + jumpTable[jump];
	}
	return out;
	
}

string AInstr(string line){
	bitset<15> dVal(line);
	return "@" +  to_string(dVal.to_ulong());
	
}

int main(){
	
	vector<string> v;
    string s;
    while(getline(cin, s)){
        v.push_back(s);
		//cout << s << endl;
    }
	for(string line : v){
		if(line[0] == '1')
			cout << CInstr(line.substr(1,line.length()-1)) << endl;
		else if(line[0] == '0')
			cout << AInstr(line.substr(1,line.length()-1)) << endl;

		
	}
	
	
	
}
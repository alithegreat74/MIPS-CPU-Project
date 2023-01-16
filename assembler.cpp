#include <iostream>
#include <string>

using namespace std;
string decimalToBinary(int num,int size) {
    string binary = "";
    for (int i = 0; i < size; i++) {
        binary += '0';
    }
    int j = size - 1;
    while (num != 0) {
        if (num % 2 == 1) {
            binary.at(j) = '1';
        }
        else {
            binary.at(j) = '0';
        }
        num /= 2;
        j--;
        if (j < 0) {
            cout << "memory error\n";
            return 0;
        }
    }
    return binary;
}
string opcode(string order) {
    if (order == "add" || order=="sub" || order=="and" || order=="or"|| order=="mul") {
        return "000000";
    }
    else if (order == "addi") {
        return "001000";
    }
    else if (order == "subi") {
        return "001001";
    }
    else if (order == "andi") {
        return "001100";
    }
    else if (order == "ori") {
        return "001101";
    }
    else {
        return "000010";
    }

}
char type(string order) {
    if (order == "add" || order == "sub" || order == "and" || order == "or" || order=="mul") {
        return 'r';
    }
    else if (order == "addi" || order == "subi" || order == "andi" || order == "ori") {
        return 'i';
    }
    else {
        return 'j';
    }
}
string registerToAssembly(string reg) {
    string num="";
    for (int i = 1; i < reg.size(); i++) {
        num += reg.at(i);
    }
    int number = stoi(num);
    if (number > 31) {
        cout << "memory error\n";
        return 0;
    }
    return decimalToBinary(number,5);

}
string getFunction(string order) {
    if (order == "add") {
        return "100000";
    }
    else if (order == "sub") {
        return "100001";
    }
    else if (order == "and") {
        return "100101";
    }
    else if (order == "or") {
        return "100100";
    }
    else if (order == "mul") {
        return "011000";
    }
}
int main()
{
    cout << "Hello and welcome to our assembler.\nThis program converts MIPS code to assembly language.\nEnter your code if you wanna exit, type exit: ";
    string code;
    string regs[3];
    getline(cin, code);
    code += ',';
    string assembly = "";
    while (code != "exit") {
        int i;
        int k;
        string order = "";
        for (i = 0; i < code.size(); i++) {
            if (code.at(i) != ' ') {
                order += code.at(i);
            }
            else {
                assembly += opcode(order)+' ';
                break;
            }
        }
        if (type(order) == 'r') {
            k = i;
            for (int j = 0; j < 3; j++) {
                string reg = "";
                for (k = k+1; k < code.size(); k++) {
                    if (code.at(k) != ',') {
                        reg += code.at(k);
                    }
                    else {
                        if (reg.at(0) != '$') {
                            cout << "Your entry is not valid";
                            return 0;
                        }
                        regs[j]=registerToAssembly(reg)+' ';
                        break;
                    }
                }
            }
            assembly += regs[1] + regs[2] + regs[0];
            assembly += "00000 ";
            assembly += getFunction(order);
        }
        else if (type(order) == 'i') {
            k = i;
            for (int j = 0; j < 2; j++) {
                string reg = "";
                for (k = k+1; k < code.size(); k++) {
                    if (code.at(k) != ','){
                        reg+=code.at(k);
                    }
                    else {
                        if (reg.at(0) != '$') {
                            cout << "Your entry is not valid";
                            return 0;
                        }
                        regs[j]=registerToAssembly(reg)+' ';
                        break;
                    }
                }
            }
            assembly += regs[1] + ' ' + regs[0] + ' ';
            string imm = "";
            for (int j = k+1; j < code.size(); j++) {
                imm += code.at(j);
            }
            assembly += decimalToBinary(stoi(imm), 16)+ ' ';
            
        }
        else {
            string address="";
            for (int j = i; j < code.size(); j++) {
                address += code.at(j);
            }
            assembly += decimalToBinary(stoi(address), 26)+ ' ';
        }
        cout << assembly << "\n";
        cin >> code;
    }
    return 0;
}

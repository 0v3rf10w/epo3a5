#include <iostream>
#include <fstream>
#include <cassert>
#include <string>
#include <cmath>

using namespace std;

bool is_bitcode(string comp_string)
{
    bool bitcode = true;
    for(unsigned int i=0;i<comp_string.length();i++)
    {
        if(!(comp_string[i]=='0' or comp_string[i]=='1'))
            bitcode = false;
    }
    return bitcode;
}

string to_bitstring(unsigned int dec_num, unsigned int num_bits)
{
    string bitstring = "";
    for(int i=num_bits-1;i>=0;i--)
    {
        unsigned int cur_pow = pow(2,i);
        bitstring += to_string(((cur_pow&dec_num)>0));
    }
    return bitstring;
}

enum opcode {
    jp,
    bz,
    bc,
    ld,
    st,
    add,
    i_xor,
    i_and,
    i_set,
    i_clr,
    error,
};

opcode hashit (std::string const& inString) {
    if (inString == "jp") return jp;
    if (inString == "bz") return bz;
    if (inString == "bc") return bc;
    if (inString == "ld") return ld;
    if (inString == "st") return st;
    if (inString == "add") return add;
    if (inString == "xor") return i_xor;
    if (inString == "and") return i_and;
    if (inString == "set") return i_set;
    if (inString == "clr") return i_clr;
    return error;
}

int main()
{
    cout << "Hello world!" << endl;

    unsigned int max_int = ~0;
    cout << max_int << endl;

    ifstream input;
    input.open("input.md",fstream::in);
    if(!input.is_open())
    {
        assert(1);
    }

    ofstream bitfile;
    bitfile.open("bit.md",fstream::out|fstream::in);
    if(!bitfile.is_open())
    {
        assert(2);
    }

    while(!input.eof())
    {
        string opcode,argument;
        input >> opcode;
        input >> argument;
        switch(hashit(opcode))
        {
        case jp:
            if(is_bitcode(argument))
                bitfile << "00000001 " << argument << endl;
            else
            {
                if(argument == "input")
                {
                    bitfile << "00000010 10000000" << endl;
                }
                else
                {
                    bitfile << "00000010 ";
                    if(argument[0] == 'R')
                    {
                        argument.erase(0,1);
                        bitfile << to_bitstring(atoi(argument.c_str()),8) << endl;
                    }
                    else
                    {
                        assert(4);
                    }
                }
            }
            break;
        case bz:
            bitfile << "00000011 " << argument << endl;
            break;
        case bc:
            bitfile << "00000100 " << argument << endl;
            break;
        case ld:
            if(is_bitcode(argument))
                bitfile << "00000101 " << argument << endl;
            else
            {
                if(argument == "input")
                {
                    bitfile << "00000110 10000000" << endl;
                }
                else
                {
                    bitfile << "00000110 ";
                    if(argument[0] == 'R')
                    {
                        argument.erase(0,1);
                        bitfile << to_bitstring(atoi(argument.c_str()),8) << endl;
                    }
                    else
                    {
                        assert(5);
                    }
                }
            }
            break;
        case st:
            bitfile << "00000111 ";
            if(argument[0] == 'R')
            {
                argument.erase(0,1);
                bitfile << to_bitstring(atoi(argument.c_str()),8) << endl;
            }
            else
            {
                assert(6);
            }
            break;
        case add:
            if(is_bitcode(argument))
                bitfile << "00001000 " << argument << endl;
            else
            {
                if(argument == "input")
                {
                    bitfile << "00001001 10000000" << endl;
                }
                else
                {
                    bitfile << "00001001 ";
                    if(argument[0] == 'R')
                    {
                        argument.erase(0,1);
                        bitfile << to_bitstring(atoi(argument.c_str()),8) << endl;
                    }
                    else
                    {
                        assert(7);
                    }
                }
            }
            break;
        case i_xor:
            if(is_bitcode(argument))
                bitfile << "00001010 " << argument << endl;
            else
            {
                if(argument == "input")
                {
                    bitfile << "00001011 10000000" << endl;
                }
                else
                {
                    bitfile << "00001011 ";
                    if(argument[0] == 'R')
                    {
                        argument.erase(0,1);
                        bitfile << to_bitstring(atoi(argument.c_str()),8) << endl;
                    }
                    else
                    {
                        assert(8);
                    }
                }
            }
            break;
        case i_and:
            if(is_bitcode(argument))
                bitfile << "00001100 " << argument << endl;
            else
            {
                if(argument == "input")
                {
                    bitfile << "00001101 10000000" << endl;
                }
                else
                {
                    bitfile << "00001101 ";
                    if(argument[0] == 'R')
                    {
                        argument.erase(0,1);
                        bitfile << to_bitstring(atoi(argument.c_str()),8) << endl;
                    }
                    else
                    {
                        assert(7);
                    }
                }
            }
            break;
        case i_set:
            bitfile << "00001110 00000000" << endl;
            break;
        case i_clr:
            bitfile << "00001111 00000000" << endl;
            break;
        default:
            assert(3);
        }
    }
    bitfile.close();

    ifstream bitfile_in;
    bitfile_in.open("bit.md",fstream::in);
    if(!bitfile_in.is_open())
    {
        assert(11);
    }

    ofstream sd_instr;
    sd_instr.open("sd_instr.md",fstream::out);
    if(!sd_instr.is_open())
    {
        assert(12);
    }

    while(!bitfile_in.eof())
    {
        char buffer[8];
        bitfile_in.get(buffer,9);
        bitfile_in >> ws;
        char ascii = 0;
        for(int i=0;i<8;i++)
        {
            if(buffer[i] == '1')
            {
                ascii += pow(2,7-i);
            }
        }
        sd_instr << ascii;
    }
    sd_instr.close();

    ifstream sd_debug;
    sd_debug.open("sd_instr.md",fstream::in);
    if(!sd_debug.is_open())
    {
        assert(13);
    }

    ofstream debug;
    debug.open("debug.md",fstream::out);
    if(!debug.is_open())
    {
        assert(12);
    }

    char c;
    while(sd_debug.get(c))
    {
        debug << to_bitstring(c,8) << " ";
        sd_debug.get(c);
        debug << to_bitstring(c,8) << endl;
    }

    return 0;
}

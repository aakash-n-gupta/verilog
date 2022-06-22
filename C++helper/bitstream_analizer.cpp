/*

    // takes in a bitstream file and processes it
    // convert to decimal - signed and unsigned
    // evaluate properties of the incoming vectors
    // checks against predefined parameters - patterns, parity.. etc

    // when
*/

#include <iostream>
#include <fstream>
#include <string>
#include <bitset>

using namespace std;

const uint8_t WIDTH = 16;

string readFile(const string &path);

int main()
{
    uint8_t size = 0;
    uint8_t length = 0;
    string bitstream;
    string bitstream_test = "011100011";
    ifstream myFile;
    bitset<WIDTH> bset_in(bitstream_test);

    bitstream = readFile("testvector.txt");
    cout << bitstream;

    // cout << bset_in << " vector \n";
    // cout << bitstream_test << " sting \n";
    // cout << bitstream_test.size() << " size of string \n";
    // cout << bitstream_test.length() << " length of string \n";
    // cout << bset_in.size() << " length of bitset \n";
    // cout << "\n\n\n\n\n\n OPENING FILE \n";

    // myFile.open("testvector.txt");

    // while (!myFile.eof())
    // {
    //     // myFile.read()
    //     getline(myFile, bitstream);
    //     size = static_cast<uint8_t>(bitstream_test.size()) * 8;
    //     length = bitstream_test.length();
    //     // if (size < WIDTH)
    //     // {
    //     bitset<WIDTH> bset_in(bitstream_test);
    //     cout << bset_in << "\n";
    //     // cout << "length gives " << length << "\n";
    //     cout << "size gives (in bits) " << size << "\n";
    //     // }

    //     // else
    //     // {
    //     //     cout << "\n ERROR: wordsize too big for bitset WIDTH \n";
    //     // }
    // }
}

string readFile(const string &path)
{
    ifstream myfile;
    myfile.open(path);
    if (myfile.is_open())
    {
        cout << "\n File opened sucesfully, reading data... \n";
        return string((istreambuf_iterator<char>(myfile)), istreambuf_iterator<char>());
    }
    else
    {
        cerr << "Could not open the file - '"
             << path << "'" << endl;
        exit(EXIT_FAILURE);
    }
}
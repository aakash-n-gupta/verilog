/*
generates a bitstream where wordsize of vector and length(duration)
of the input to a module/testbench can be defined

// should be able to genetate completely random sequences
// and sequences within some defined constraints

// also create complimentary file which reads, converts - hex, signed, decimal, 2' compliment
 and detects output testvectors for specified patterns

/*
    // handle the code in 3 parts

    1) use random number generator using seed
    2) convert the numbers to binary, decimal, hex, 2's compliment??
    2) generate bitstream of the defined parameters
    3) write to a output file

    set logical checks for overflow and underflow

*/

#include <iostream>
#include <fstream>
#include <bitset>
#include <random>
#include <ctime>

using namespace std;
// pass these as commandline parameters???
// global varibles to store the range of generated values
int64_t MAX = 12550;
int64_t MIN = 0;
const uint8_t WIDTH = 16;   // WIDTH is the wordsize of the desired vector
uint32_t VECTOR_LENGTH = 2; // the number of words to be generated

int main()
{
    uint32_t i = 0;
    uint32_t sum = 0;

    mt19937 rand_num_gen(static_cast<uint64_t>(time(0))); // random-number engine used (Mersenne-Twister-engine)
    uniform_int_distribution<int64_t> uni(MIN, MAX);      // guaranteed unbiased

    ofstream myFile;

    // preferred file name format WIDTHbit_LENGTH_testN
    // where N is the Nth file being generated
    // make sure to not overwrite old files
    myFile.open("testvector.txt");

    // sets the bitvector as 0 (default)
    // bitset<WIDTH> bset_zero;
    // cout << bset_zero << "\n";

    for (i = 0; i < VECTOR_LENGTH; i++)
    {
        int64_t random_integer = uni(rand_num_gen);
        bitset<WIDTH> bset_1(random_integer);
        myFile << bset_1 << "\n";
        // cout << random_integer << "\n";
        // cout << bset_test << "\t";
        // cout << bset_test.count() << "\n";
    }

    // cout << bset_zero.size() << " = size of bset_zero\n";
}

//This program is meant to modify the words text file into a binary data file
#include <iostream>
#include <fstream>
#include <vector>
using namespace std;

int main()
{
   vector<string> words;
   vector<short> chars;
   string str;
   

   ifstream input;
   input.open("filtered_words");
   while (input >> str)
      words.push_back(str);
   for (int i = 0; i < words.size(); ++i) {
      for (int j = 0; j < 10; ++j) {
	 if (words[i].size() > j)
	    chars.push_back((short) (words[i][j]));
	 else
	    chars.push_back(0);
      }
   }

   ofstream output;
   output.open ("words.bin",ios::out | ios::binary);

   for (int i = 0; i < chars.size(); ++i)
      output.write((char*) &chars[i], sizeof(short));
   return 0;		
}


//This program is meant to modify the words text file into a binary data file
#include <iostream>
#include <fstream>
#include <vector>
#include <cstdlib>
using namespace std;

int main(int argc, char *argv[])
{
   vector<short> chars;
   string dic = "dictionary";
   string f_name;
   string str;

   if (argc != 2) {
       cout << "Improper Arguments." << endl;
       return 0;
   } else if (argv[1] == dic) {
       vector<string> words;
       f_name = "words.bin";
       
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
       for (int i = 0; i < 9867; ++i)
           chars.push_back(0);
    
   } else {
       int limit = atoi(argv[1]);
       str = argv[1];
       f_name = "zeros" + str + ".bin";

       for (int i = 0; i < limit; ++i)
           chars.push_back(0);
   }

   ofstream output;
   output.open (f_name.c_str(), ios::out | ios::binary);

   for (int i = 0; i < chars.size(); ++i)
      output.write((char*) &chars[i], sizeof(short));
   return 0;
}


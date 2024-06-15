#include <iostream>

using std::runtime_error;
using std::string;

string exec(const char* command){
    char buffer[128];
    string result;
    FILE* pipe = popen(command, "r");
    if (!pipe) throw runtime_error("popen() failed!");
    while (fgets(buffer, sizeof buffer, pipe) != NULL){
	result += buffer;
    }
    pclose(pipe);
    return result;
}


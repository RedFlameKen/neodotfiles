#include <iostream>
#include "consexec.h"

using std::cout;
using std::cin;
using std::string;
using std::endl;

int main(){
    string output = exec("hyprctl activeworkspace");
    cout << output;
}

#include <iostream>
#include <chrono>
#include <thread>

using std::string;
using std::to_string;
using std::cout;
using std::endl;
using std::system;
using std::this_thread::sleep_for;

class Workspace {
    private:
	int number;
	string icon;
	bool isActive;
    public:
	Workspace(int number, string icon, bool isActive){
	    this -> number = number;
	    this -> icon = icon;
	    this -> isActive = isActive;
	}

	string getLiteral(){
	    string activeClass = "", activelblClass = "";
	    if(isActive){
		activeClass = " activews";
		activelblClass = " activewslbl";
	    }
	    string snum = to_string(number);
	    string literal = "(button :class 'ws"+snum + activeClass +" ws' :onclick '$(hyprctl dispatch workspace "+snum+")' (label :class 'wslbl"+snum + activelblClass +" wslbl' :text '"+icon+"')) ";

	    return literal; 
	}
};

string getIcon(int number);
string createWorkspaceLiteral();
int getActiveWorkspace();
int getWorkspaceSize();
void updateLoop();

int main(){
    string literal = createWorkspaceLiteral();
    cout << literal;
    updateLoop();
    return 0;
}

void updateLoop(){
    using namespace std::chrono_literals;
    int activeWorkspace = getActiveWorkspace();
    while(true){
        cout.flush();
        sleep_for(200ms);

        int curActiveWorkspace = getActiveWorkspace();
        if(activeWorkspace == curActiveWorkspace){
            continue;
        }
        activeWorkspace = curActiveWorkspace;
        string literal = createWorkspaceLiteral();
        cout << literal;
    }
}

string createWorkspaceLiteral(){
    int activeWorkspace = getActiveWorkspace();
    string workspaceLiteral = "(box :class 'workspaces' :orientation 'horizontal' :spacing '5' :space-evenly true ";

    int workspaceSize = 5;
    int curWorkspaceSize = getWorkspaceSize();
    if(curWorkspaceSize > workspaceSize)
	workspaceSize = curWorkspaceSize;

    Workspace* ws;

    for(int i = 1; i <= workspaceSize; i++){
	bool wsactive = false;
	if(activeWorkspace == i)
	    wsactive = true;
	ws = new Workspace(i, getIcon(i), wsactive);
	workspaceLiteral += ws -> getLiteral();
    }
    delete ws;
    workspaceLiteral += ")\n";
    return workspaceLiteral;
}
int getActiveWorkspace(){
    int activeWorkspace = system("scripts/activews.sh");
    return activeWorkspace /= 256;
}
int getWorkspaceSize(){
    int workspaceSize = system("scripts/workspace-size.sh");
    return workspaceSize /= 256;
}

string getIcon(int number){
    switch(number){
	case 1:
	    return "󰈹";
	case 2:
	    return "";
	case 3:
	    return "";
	case 4:
	    return "󰊗";
	case 5:
	    return "";
	case 6:
	    return "󰕧";
	default:
	    return "󱁤";
    }
    return "";
}

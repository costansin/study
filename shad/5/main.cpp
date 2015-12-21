#include <iostream>

using namespace std;

int main()
{
    string s;
    bool block_commenting = false;
    char quot;
    while (cin >> s) {
        int l = s.length();
        for (int i=0; i<l; ++i) {
            if (block_commenting){
                if ((s[i]=='*')&&(s[i+1]=='/')) {
                    block_commenting = false;
                    ++i;
                }
            } else if ((s[i]=='\'')||(s[i]=='"')) {
                cout << (quot = s[i]);
                while ((i<l)&&((s[++i]!=quot)||(s[i-1]=='\\'))) {cout << s[i];}
                cout << quot;
            } else if (s[i]=='/') {
                if (s[i+1]=='/') break;
                else if (s[i+1]=='*') {
                    block_commenting = true;
                    ++i;
                }
                else cout << s[i];
            } else cout << s[i];
        }
        if (!block_commenting) cout << endl;
    }
    return 0;
}

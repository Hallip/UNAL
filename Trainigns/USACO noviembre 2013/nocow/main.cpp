#include <bits/stdc++.h>

using namespace std;

//set
vector<string> a1[30];
//int
//map

int main()

{
    string aux;
     int n, k, c;
     freopen ("nocow.in","r",stdin);
     freopen ("nocow.out","w",stdout);
     cin >> n >> k;
     for (int x = 0; x < n; x++){
            cin >> aux;
            cin >> aux;
            cin >> aux;
            cin >> aux;
            cin >> aux;
            while (aux != "cow."){
                a1[x].push_back (aux);
                cin >> aux;
            }
     }
     for (int y = 0; y < n; y++){
            cout << a1[y];
     }
     return 0;
}

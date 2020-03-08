#include <bits/stdc++.h>

using namespace std;


int main() {

    freopen ("cowjog.in","r",stdin);
    freopen ("cowjog.out","w",stdout);
    long a;
    cin >> a;
    vector<long> j;

    for(long d=0; d<a; d++) {
            long x, y;
            cin >> x>>y;
            j.push_back(y);
        }

    long r = 1;
    long l = j[a-1];

    for(long q=a-2; q>=0; q--) {
            if(j[q] > l){}
            else {
                    r++;
            }
    l = min(l, j[q]);
  }

  cout << r;

}

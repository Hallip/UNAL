#include <bits/stdc++.h>

using namespace std;

int main()
{
    freopen ("milktemp.in","r",stdin);
    freopen ("milktemp.out","w",stdout);
    int n, x, y ,z,temp, mi;
    cin >> n >> x >> y >> z;
    int a[n];
    int b[n];
    for (int j = 0; j < n; j++){
        cin >> a[j];
        cin >> b[j];
    }
    sort(a, a +n);
    sort(b, b +n);
    int c1, c2, lit;
    c1 = 0;
    c2 = 0;
    mi = x * n;
    lit = mi;
    while (a[c1] <= b[n-1]){
        if (a[c1] <= b[c2]){
            mi = mi + y -x;
            c1++;
        }
        else{
            mi = mi + z -y;
            c2++;
        }
        lit = max(lit,mi);
    }
    cout << lit;
//    for (int h = 0; h < n; h++){
//            cout << a[h]<<"   "<< b [h]<<endl;
//    }
}

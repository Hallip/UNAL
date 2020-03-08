#include <iostream>

using namespace std;

int main()
{
    int a[8], mx, ch[9];
    for (int i = 0; i < 8; i++){
        cin >> a[i];
    }
    mx = 0;
    ch[0] =  a[0] + a[1] + a[2] + a[3];
    ch[1] =  a[1] + a[2] + a[3] + a[4];
    ch[2] =  a[2] + a[3] + a[4] + a[5];
    ch[3] =  a[3] + a[4] + a[5] + a[6];
    ch[4] =  a[4] + a[5] + a[6] + a[7];
    ch[5] =  a[5] + a[6] + a[7] + a[0];
    ch[6] =  a[6] + a[7] + a[0] + a[1];
    ch[7] =  a[7] + a[0] + a[1] + a[2];
    for(int i = 0; i < 8; i++){
        if (mx < ch[i])mx = ch[i];
    }
    cout << mx;
    return 0;
}

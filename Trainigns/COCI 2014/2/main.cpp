#include <iostream>

using namespace std;

int main()
{
    int x,y,z,b,p,p2;
    cin >> x >> y;
    char m[x+1][y+1];
    for (int i = 1; i < x+1; i++){
        for (int j = 1; j < y+1; j++){
            cin >> m[i][j];
        }
    }
    int mx = 0,mx2 = 0;
    b = 0;
    for (int k = y; k > 1; k--){
        for (int l = 1; l < y+1; l++){
            p = 0;
            for (int q = 0; q < y+1; q++){
                if (m[k][q] == 'J'){
                    mx =q;
                    p = 1;
                }
                if ((m[k-1][q] == 'J')&&(k - 1 > 0)){
                    mx2 = q;
                    p2 = 1;
                }
                z = z+1;
            }
            if ((z % 2 !=0)&&(p == 0)&&(p2 == 1)){
                b = b+mx2;
            }
            if ((z % 2 !=0)&&(p == 1)&&(p2 == 1)&&(mx > mx2)){
                b = b+mx;
                b = b +(mx-mx2);
            }
        }
    }
    cout << b;
}

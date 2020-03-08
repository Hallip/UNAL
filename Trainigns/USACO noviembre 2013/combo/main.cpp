#include <bits/stdc++.h>

using namespace std;

int main()
{
    freopen ("combo.in","r",stdin);
    freopen ("combo.out","w",stdout);

    int n, cj[3], cm[3],cob;
    int aux [6];
    cin >> n;
    cob = 0;
    cin >> cj[0] >> cj[1] >> cj[2];
    cin >> cm[0] >> cm[1] >> cm[2];

    for (int x = 1; x < n+1; x++){
        for (int y = 1; y < n+1; y++){
            for (int z = 1; z < n+1; z++){


                aux[0] = min(abs(cj[0] - x),(n-abs(cj[0] - x)));
                aux[1] = min(abs(cj[1] - y),(n-abs(cj[1] - y)));
                aux[2] = min(abs(cj[2] - z),(n-abs(cj[2] - z)));

                aux[3] = min(abs(cm[0] - x),(n-abs(cm[0] - x)));
                aux[4] = min(abs(cm[1] - y),(n-abs(cm[1] - y)));
                aux[5] = min(abs(cm[2] - z),(n-abs(cm[2] - z)));

                if (((aux[0] < 3)&&(aux[1] < 3)&&(aux[2] < 3))||((aux[3] < 3)&&(aux[4] < 3)&&(aux[5] < 3))) cob = cob+1;
            }
        }
    }
    cout << cob+7;
    return 0;
}

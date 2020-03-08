#include <iostream>

using namespace std;

int main()
{
    int n, k;
    cin >> n >> k;
    pair <int,int> l[n];
    for (int q = 0; q < n; q++){
        cin >> l[q].first;
        cin >> l[q].second;
    }
    return 0;
}

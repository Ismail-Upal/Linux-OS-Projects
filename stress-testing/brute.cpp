#include<bits/stdc++.h>
using namespace std;

int main()
{   
    int n; cin >> n;

    int x[n];

    for(int i = 0; i < n; i++){
        cin >> x[i];
    }

    int ans = 0;

    for(int i = 0; i < n; i++){
        int sum = 0;
        for(int j = i; j < n; j++){
            sum += x[j];
            if(sum == 0) ans++;
        }
    }

    cout << ans << endl;
    
    return 0;
}

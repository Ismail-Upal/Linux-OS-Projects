#include<bits/stdc++.h>
using namespace std;

int main()
{   
    int n; cin >> n;
    int x[n];
    
    int ans = 0;

    int prefix_sum = 0;

    map<int, int> fr;

    for(int i = 0; i < n; i++){
        cin >> x[i];

        prefix_sum += x[i];

        ans += fr[prefix_sum];

        fr[prefix_sum]++;
    }

    cout << ans << endl;
    
    return 0;
}

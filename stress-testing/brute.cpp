#include<bits/stdc++.h>
using namespace std;
#define opt() ios_base::sync_with_stdio(0);cin.tie(0);cout.tie(0);
#define tc int t; cin >> t; for (int _ = 1; _ <= t; _++)
using ll = long long;
using i128 = __int128_t;
#define endl '\n'
#define sz(x) (ll)(x).size()
//-------------------------------------------

int32_t main()
{   
    opt();
    
    ll mod = 1e9;
    int n, k; cin >> n >> k;
    vector<ll> v(n + 1);

    ll sum = k;
    for(int i = 0; i < min(n + 1, k); i++) v[i] = 1;

    int l = 0, r = k;
    while(r <= n){
        v[r] = sum;
        sum = (sum - v[l] + mod) % mod;
        sum += v[r];
        sum %= (ll) 1e9;
        l++, r++;
    }
    
    cout << v[n];
    cout << endl;

    return 0;
}
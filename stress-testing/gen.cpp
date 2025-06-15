#include <bits/stdc++.h>
using namespace std;

mt19937 rng;
int random(int a, int b) {
    return uniform_int_distribution<int>(a, b)(rng);
}

int main(int argc, char* argv[]) {
    rng.seed(argc > 1 ? atoi(argv[1]) : chrono::steady_clock::now().time_since_epoch().count());
    
    int n = random(1, 100);
    cout << n << endl;

    for(int i = 1; i <= n; i++){
        int x = random(-100, 100);
        cout << x << ' ';
    }
    
    cout << endl;

    return 0;
}

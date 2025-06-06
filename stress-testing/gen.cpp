#include <bits/stdc++.h>
using namespace std;

int rnd(int l, int r){
    return l + rand() % (r - l + 1);
}

int main(int argc, char* argv[]) {
    srand(atoi(argv[1]));

    int n = rnd(1, 100000);
    int k = rnd(1, 100000);

    cout << n << " " << k;
    cout << endl;

    return 0;
}

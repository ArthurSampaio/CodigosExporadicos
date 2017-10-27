#include <iostream>
 
using namespace std;
 
int fibonnaci(int n){
    if(n == 1 || n == 2){
        return 1;
    }else {
        return (fibonnaci(n-1) + fibonnaci(n-2));
    }
}

int main() {
 
    int n; 
    cin >> n; 
    cout << fibonnaci(n) << endl;
    int sum = 0;
    for(int i = 1; i <= n; i++){
    sum += fibonnaci(i);
    }
    cout << sum << endl;

    return 0;
}


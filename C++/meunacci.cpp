#include <iostream>
 
using namespace std;
 
int fibonnaci(int n){
    if(n == 1 || n == 2){
        return 1;
    }else {
        return (fibonnaci(n-1) + fibonnaci(n-2));
    }
}

int lastDigit(int n){
    int out; 
    if (n >= 10){
        out = n%10;
    } else {
        out = n;
    }

    return n; 
    
}

int meunacci(int n){
    int sum = 0; 
    for(int i = 0; i < 3; i++){
       sum += lastDigit(fibonnaci(n + i));
    }
    
    return sum;

}

int main() {
 
    int n; 
    cin >> n; 

    int sum = meunacci(n);
    cout << sum << endl;

    return 0;
}


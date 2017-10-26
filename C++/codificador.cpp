#include <iostream>
#include<map>
#include <bits/stdc++.h>

 
using namespace std;
 
int main() {
 
    char word[1024];

    map<char, int> dict; 
    dict['e'] = '3';
    dict['a'] = '4';
    dict['o'] = '0';
    dict['s'] = '5';

    cin >> word; 
    int i = 0; 

    while(word[i] != '\0'){
        if(dict.count(word[i]) == 1){
           // cout << word[i] << endl;   
            word[i] = dict[word[i]];

        }
        i++;
    }
    cout << word << endl;
 
    return 0;
}


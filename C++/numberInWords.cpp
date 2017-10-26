#include <iostream>
#include <string>
 
using namespace std;
 
//pega o valor da tabela ascii
int numberOfLetter(char l){
    return (int(l) - 97 + 1);
}

int main() {
 
    string word; 
    getline(cin, word);
    int sum = 0; 

    for(int i = 0; i < word.size(); i++){
        sum += numberOfLetter(word[i]);
    }
    
    cout << sum << endl; 
    return 0;
}


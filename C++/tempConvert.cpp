#include <iostream>
 
using namespace std;
 
float celsiusToFarenheint (float celsius){
    return 1.8*celsius + 32;
}

float celsiusToKelvin (float celsius){
    return celsius + 273;
}

int main() {

    string type; 
    float celsius;
    cin >> type >> celsius; 
    if (type == "f"){
        cout << celsiusToFarenheint(celsius) << endl;
    }else if(type == "k"){
        cout << celsiusToKelvin(celsius) << endl;
    }else {
        cout << "Entrada de escala invalida!" << endl;
    }

    return 0;
}


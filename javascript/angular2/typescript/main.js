var minhaVar = 'minha variavel';
function minhaFun(x, y) {
    return x + y;
}
//ES 6 ou ES5
var num = 2;
var pi = 3.14;
var numeros = [1, 2, 3];
numeros.map(function (valor) {
    return valor * 2;
});
//Declaração de Classe
var Matematica = (function () {
    function Matematica() {
    }
    Matematica.prototype.soma = function (x, y) {
        return x + y;
    };
    return Matematica;
}());

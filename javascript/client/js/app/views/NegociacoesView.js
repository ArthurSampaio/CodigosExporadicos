class NegociacoesView {

    constructor(element) {
        this._element = element;
    }

    _template(model) {

        //Maneira declarativa

        return `<table class="table table-hover table-bordered">
        <thead>
            <tr>
                <th>DATA</th>
                <th>QUANTIDADE</th>
                <th>VALOR</th>
                <th>VOLUME</th>
            </tr>
        </thead>
         
        <tbody>

            ${model.negociacoes.map((n) => {
                //concatena toda a string qnd o resultado da expressão acima terminar. 
                return ` 
                    <tr>
                        <td>${DateHelper.dateToText(n.data)}</td>
                        <td>${n.quantidade}</td>
                        <td>${n.valor}</td>
                        <td>${n.volume}</td>
                       
                    </tr>
                `
            }).join('')}
            

        </tbody>
        
        <tfoot>

            <td colspan="3"></td>
            <td>${
                  model.negociacoes.reduce((acc, n ) =>{
                    return  acc + n.volume;
                },0.0)
                    
            }</td>

        </tfoot>
    </table>
    `;

    }

    update(model) {

        //innerHTML é uma maneira de converter a string em elementos do DOM 
        this._element.innerHTML = this._template(model);

    }


}



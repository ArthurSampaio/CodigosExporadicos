class NegociacaoController {

	constructor(){

		let $ = document.querySelector.bind(document);
		this._inputData =$("#data");
		this._inputQuantidade = $("#quantidade");
		this._inputValor = $("#valor");
		this._listaNegociacoes = new ListaNegociacoes();
	}


	adiciona(event) {

		event.preventDefault();
		
		this._listaNegociacoes.adiciona(this._createNegociacao());
		this._cleanInputFields();

	}


	_createNegociacao() {

		return  new Negociacao( 
			DateHelper.textToDate(this._inputData.value),
			 this._inputQuantidade.value, 
			this._inputValor.value);
	}

	_cleanInputFields() {

		this._inputData.value = "";
		this._inputQuantidade.value = 1; 
		this._inputValor.value = 0.0; 

		this._inputData.focus();

	}


}
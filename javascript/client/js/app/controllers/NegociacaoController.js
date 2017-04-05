class NegociacaoController {

	constructor(){

		let $ = document.querySelector.bind(document);
		this._inputData =$("#data");
		this._inputQuantidade = $("#quantidade");
		this._inputValor = $("#valor");
	}

	adiciona(event) {

		event.preventDefault();

		let helper = new DateHelper();

		let data = helper.textToDate(this._inputData.value);

		console.log(data);

		let negociacao = new Negociacao(
			data, 
			this._inputQuantidade.value, 
			this._inputValor.value);

		let dataOut = helper.dateToText(negociacao.data);

		
	
	}


}
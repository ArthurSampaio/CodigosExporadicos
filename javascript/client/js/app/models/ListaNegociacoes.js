class ListaNegociacoes {

	constructor(){

		this._negociacoes = []

	}


	adiciona(negociacao) {

		this._negociacoes.push(negociacao);

	}

	
	get negociacoes() { 

		//garante que uma nova instância é passada como retorno
		return [].concat(this._negociacoes);

	}
} 
class Negociacao {

	
	constructor(date, quantity, value) {

		this._data = new Date(date.getTime());
		this._quantidade = quantity; 
		this._valor = value;
		//garante que os atributos nao serao alterados
		//posteriormente
		
		Object.freeze(this);

	}

	get volume() {
		return this._quantidade * this._valor; 
	} 

	get data() {
		return new Date(this._data.getTime());

	}

	get quantidade () {
		return this._quantidade; 
	}

	get valor() {
		return this._valor;
	}


}
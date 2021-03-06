import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-data-binding',
  templateUrl: './data-binding.component.html',
  styleUrls: ['./data-binding.component.css']
})
export class DataBindingComponent implements OnInit {

  url:string = 'http://github.com/ArthurSampaio';
  cursoAngular: boolean = true;
  urlImagem: string = "http://lorempixel.com/400/200/nature"

  getCurtirCurso() {
    return true;
  }

  getValor(){
    return 1; 
  }

  constructor() { }

  ngOnInit() {
  }

}

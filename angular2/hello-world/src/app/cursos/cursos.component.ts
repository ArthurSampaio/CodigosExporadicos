import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-cursos',
  templateUrl: './cursos.component.html',
  styleUrls: ['./cursos.component.css']
})
export class CursosComponent implements OnInit {

  nomePortal: string;
  cursos: string[];

  constructor() {

    this.nomePortal = "Bonde do tigrão"
    this.cursos = ['Java', 'ReactJS', 'Angular2'];
  }

  ngOnInit() {
  }

}

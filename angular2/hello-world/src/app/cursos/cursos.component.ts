import { Component, OnInit } from '@angular/core';

import { CursosService } from './cursos.service';


@Component({
  selector: 'app-cursos',
  templateUrl: './cursos.component.html',
  styleUrls: ['./cursos.component.css']
})
export class CursosComponent implements OnInit {

  nomePortal: string;
  cursos: string[];

  //injeção de dependência
  constructor(private cursoService:CursosService) {

    this.nomePortal = "Bonde do tigrão";

   this.cursos = this.cursoService.getCursos();

   

  }

  ngOnInit() {
  }

}

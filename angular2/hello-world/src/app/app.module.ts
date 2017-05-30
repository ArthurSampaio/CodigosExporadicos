import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';

import { AppComponent } from './app.component';
import { MyFirstComponent } from './first-my/my-first.component';
import { MeuPrimeiroComponent } from './meu-primeiro/meu-primeiro.component'
import { CursosModule } from './cursos/cursos.module'


@NgModule({
  declarations: [
    AppComponent, 
    MyFirstComponent,
      MeuPrimeiroComponent 
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule, 
    CursosModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { RouterModule, Routes } from '@angular/router';
import { HttpClientModule } from '@angular/common/http'
import { ChatModule } from './component/chat/chat.module';

import { AppComponent } from './app.component';
import { NavbarComponent } from './component/navbar/navbar.component';
import { FooterComponent } from './component/footer/footer.component';
import { BodyComponent } from './component/body/body.component';
import { ItinerariosComponent } from './component/itinerarios/itinerarios.component';
import { RegistroComponent } from './component/registro/registro.component';
import { NosotrosComponent } from './component/nosotros/nosotros.component';
import { ChatComponent } from './component/chat/chat.component';
import { ForoComponent } from './component/foro/foro.component';
import { LogoComponent } from './component/logo/logo.component';
//import { DetalleClimaComponent } from './component/detalleclima/detalleclima.component'

import { AppclimaComponent } from 'src/app/component/appclima/appclima.component'

//import { FormatearFechaPipe } from './component/appclima/formatear-fecha.pipe';
//import { FechaANombreDiaPipe } from './component/appclima/fecha-anombre-dia.pipe';


import { AppclimaService} from 'src/app/services/appclima.service';

const router: Routes = [
  {
    path: 'nosotros',
    component: NosotrosComponent
  },
  {
    path: 'iniciar_sesión',
    component: RegistroComponent
  },
  {
    path: 'itinerarios',
    component: ItinerariosComponent 
  },
  {
    path: 'tiempo',
    component: AppclimaComponent 
  },
  {
    path: 'chat',
    component: ChatComponent 
  },
  {
    path: 'foro',
    component: ForoComponent 
  }
];

@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    FooterComponent,
    BodyComponent,
    RegistroComponent,
    ItinerariosComponent,
    NosotrosComponent,
    ChatComponent,
    LogoComponent,
    AppclimaComponent,
    ForoComponent,
    //FechaANombreDiaPipe
    //DetalleClimaComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    BrowserAnimationsModule,
    HttpClientModule,
    ChatModule,
    //FormatearFechaPipe,
    //FechaANombreDiaPipe,
    RouterModule.forRoot(router, {useHash: true}),
  ],
  providers: [
    AppclimaService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }

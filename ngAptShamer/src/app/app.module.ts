import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {NgbModule} from '@ng-bootstrap/ng-bootstrap';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HomeComponent } from './components/home/home.component';
import { RatingPipe } from './pipes/rating.pipe';
import { NavigationComponent } from './components/navigation/navigation.component';
import { TemplateComponent } from './components/template/template.component';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    RatingPipe,
    NavigationComponent,
    TemplateComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    NgbModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

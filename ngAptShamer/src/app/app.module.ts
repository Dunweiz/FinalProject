import { FetchCallsService } from './services/fetch-calls.service';
import { BrowserModule } from '@angular/platform-browser';
import {NgbModule} from '@ng-bootstrap/ng-bootstrap';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { FormsModule } from '@angular/forms';
import { HomeComponent } from './components/home/home.component';
import { NgModule } from '@angular/core';
import { RatingPipe } from './pipes/rating.pipe';
import { NavigationComponent } from './components/navigation/navigation.component';
import { TemplateComponent } from './components/template/template.component';
import { NotFoundComponent } from './components/not-found/not-found.component';
import { LocationsComponent } from './components/locations/locations.component';


@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    RatingPipe,
    NavigationComponent,
    TemplateComponent,
    NotFoundComponent,
    LocationsComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    NgbModule,
    FormsModule
  ],
  providers: [
    FetchCallsService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }

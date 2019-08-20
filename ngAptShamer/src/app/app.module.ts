import { ComplexService } from './services/complex.service';
import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import { AuthService } from './services/auth.service';
import { BrowserModule } from '@angular/platform-browser';
import { FetchCallsService } from './services/fetch-calls.service';
import { FormsModule } from '@angular/forms';
import { HomeComponent } from './components/home/home.component';
import { HttpClientModule } from '@angular/common/http';
import { LoginComponent } from './components/login/login.component';
import { LogoutComponent } from './components/logout/logout.component';
import { NavigationComponent } from './components/navigation/navigation.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { NgModule } from '@angular/core';
import { NotFoundComponent } from './components/not-found/not-found.component';
import { RatingPipe } from './pipes/rating.pipe';
import { RegisterComponent } from './components/register/register.component';
import { TemplateComponent } from './components/template/template.component';
import { ComplexComponent } from './components/complex/complex.component';
import { ComplaintFormComponent } from './components/complaint-form/complaint-form.component';
import { ComplexDetailComponent } from './components/complex-detail/complex-detail.component';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    RatingPipe,
    NavigationComponent,
    TemplateComponent,
    NotFoundComponent,
    LoginComponent,
    LogoutComponent,
    RegisterComponent,
    ComplaintFormComponent,
    ComplexComponent,
    ComplexDetailComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    NgbModule,
    FormsModule,
    HttpClientModule
  ],
  providers: [
    FetchCallsService,
    AuthService,
    ComplexService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }

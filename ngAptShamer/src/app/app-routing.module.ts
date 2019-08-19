import { LogoutComponent } from './components/logout/logout.component';
import { LoginComponent } from './components/login/login.component';
import { LocationsComponent } from './components/locations/locations.component';
import { NotFoundComponent } from './components/not-found/not-found.component';
import { HomeComponent } from './components/home/home.component';
import { NgModule, Component } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { RegisterComponent } from './components/register/register.component';
import { TemplateComponent } from './components/template/template.component';

const routes: Routes = [
  { path: '', pathMatch: 'full', redirectTo: 'home' },
  { path: 'home', component: HomeComponent },
  { path: 'complexes', component: LocationsComponent},
  { path: 'register', component: RegisterComponent},
  { path: 'login', component: LoginComponent },
  { path: 'logout', component: LogoutComponent},
  { path: 'template', component: TemplateComponent },
  { path: 'complexes', component: LocationsComponent}
  // NOT FOUND COMPONENT IS CATCH ALL, MUST REMAIN LAST PATH
  //{ path: '**', component: NotFoundComponent }

];

@NgModule({
  imports: [RouterModule.forRoot(routes, {useHash: true})],
  exports: [RouterModule]
})
export class AppRoutingModule { }

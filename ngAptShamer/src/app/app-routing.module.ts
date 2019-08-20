import { ComplaintComponent } from './components/complaint/complaint.component';
import { ComplexDetailComponent } from './components/complex-detail/complex-detail.component';
import { LogoutComponent } from './components/logout/logout.component';
import { LoginComponent } from './components/login/login.component';
import { NotFoundComponent } from './components/not-found/not-found.component';
import { HomeComponent } from './components/home/home.component';
import { NgModule, Component } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { RegisterComponent } from './components/register/register.component';
import { TemplateComponent } from './components/template/template.component';
import { ComplexComponent } from './components/complex/complex.component';

const routes: Routes = [
  { path: '', pathMatch: 'full', redirectTo: 'home' },
  { path: 'home', component: HomeComponent },
  { path: 'register', component: RegisterComponent},
  { path: 'login', component: LoginComponent },
  { path: 'logout', component: LogoutComponent},
  { path: 'template', component: TemplateComponent },
  { path: 'complexes', component: ComplexComponent},
  { path: 'complexes/:id', component: ComplexDetailComponent},
  { path: 'complexes/:id/complaints/:id', component: ComplaintComponent },
  { path: 'register', component: RegisterComponent},
  // NOT FOUND COMPONENT IS CATCH ALL, MUST REMAIN LAST PATH
  { path: 'notfound', component: NotFoundComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes, {useHash: true})],
  exports: [RouterModule]
})
export class AppRoutingModule { }

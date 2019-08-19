import { LocationsComponent } from './components/locations/locations.component';
import { NotFoundComponent } from './components/not-found/not-found.component';
import { HomeComponent } from './components/home/home.component';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { TemplateComponent } from './components/template/template.component';


const routes: Routes = [
  { path: '', pathMatch: 'full', redirectTo: 'home' },
  { path: 'home', component: HomeComponent },
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

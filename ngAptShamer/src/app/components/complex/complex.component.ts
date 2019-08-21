import { FetchCallsService } from './../../services/fetch-calls.service';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Complex } from 'src/app/models/complex';
import { ComplexService } from 'src/app/services/complex.service';


@Component({
  selector: 'app-complex',
  templateUrl: './complex.component.html',
  styleUrls: ['./complex.component.css']
})
export class ComplexComponent implements OnInit {
  complex;
  lat;
  long;

  constructor(private fetch: FetchCallsService, private complexSvc: ComplexService,
              private router: Router) { }
  async ngOnInit() {
    try {
    const locat = await this.fetch.location;
    let address;
    this.lat = locat.results[0].geometry.location.lat;
    this.long = locat.results[0].geometry.location.lng;
    if (locat.results.length) {
      const data = locat.results[0].formatted_address;
      address = data.split(', ');
      console.log(address);
      console.log('lat', this.lat);
      console.log('long', this.long);
      if (address.length === 4) {
        this.complexSvc.searchApartment(address[0]).subscribe(
          data2 => {
            this.complex = data2;
            console.log('DATA:', this.complex);
            this.router.navigateByUrl(`complexes/${data2[0].id}`);
          },
          error => {
            console.log(error);
          }
        );
      }  else {
        this.complexSvc.searchCity(address[0]).subscribe(
          data3 => {
            console.log(data3);
            this.complex = data3;
          },
          error => {
            console.log(error);
          }
        );
      }
   } else {
      this.router.navigateByUrl('notfound');
    }
    } catch (Error) {
      console.log(Error, 'locations.component.fetch');
    }
  }

viewComplex(id: number) {
  this.router.navigateByUrl(`/complexes/${id}`);
}
}

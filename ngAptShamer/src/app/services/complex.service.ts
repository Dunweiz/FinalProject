import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { HttpHeaders, HttpClient } from '@angular/common/http';
import { Complex } from '../models/complex';
import { catchError } from 'rxjs/operators';
import { throwError } from 'rxjs';
@Injectable({
  providedIn: 'root'
})
export class ComplexService {
  url = environment.baseUrl + '/api/complexes/';

  constructor(private http: HttpClient) { }

  searchApartment(apt: string) {
    console.log('APTT: ', apt);
    return this.http.get<Complex[]>(this.url + apt)
      .pipe(
        catchError((err: any) => {
          console.log(err);
          return throwError(
            'Error on ComplexService searchApartment'
          );
        })
      );
  }

  searchCity(city: string) {
    console.log('CITY: ', city);
    return this.http.get<Complex[]>(this.url + city)
      .pipe(
        catchError((err: any) => {
          console.log(err);
          return throwError(
            'Error on ComplexService searchApartment'
          );
        })
      );
  }
}

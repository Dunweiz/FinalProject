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

  getComplexById(id: number) {
    return this.http.get<Complex>(this.url + id + '/details')
      .pipe(
        catchError((err: any) => {
          console.log(err);
          return throwError(
            'Error on ComplexService getComplexById'
          );
        })
      );
  }
}

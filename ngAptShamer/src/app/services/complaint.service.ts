import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment.prod';
import { Complaint } from '../models/complaint';
import { catchError } from 'rxjs/operators';
import { throwError } from 'rxjs';
import { HttpClient, HttpHeaders } from '@angular/common/http';



@Injectable({
  providedIn: 'root'
})
export class ComplaintService {

  // Fields

  private url = environment.baseUrl + '/api/complexes/';

  // Constructor

  constructor(private http: HttpClient) { }

  // Methods

  create(complaint: Complaint, id: number) {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json'
      })
    };

    return this.http
      .post<Complaint>('http://localhost:8091/api/complexes/' + id + '/complaints', complaint, httpOptions)
      .pipe(
        catchError((err: any) => {
          console.log(err);
          return throwError('ComplaintService.index(): error retrieving complaint list');
        })
      );
  }
}

import { Injectable } from '@angular/core';
// import { googleMapsApiKey } from '../../assets/apikeys.js';

@Injectable({
  providedIn: 'root'
})
export class FetchCallsService {

  location: string;

  constructor() { }

  async searchByApartment(search: string) {
    // const url = `https://maps.googleapis.com/maps/api/geocode/json?address=${search}&key=${googleMapsApiKey}`;
    // const response = await fetch(url);
    // const location =  await response.json();
    this.location = 'hello';
    return location;
      }

}

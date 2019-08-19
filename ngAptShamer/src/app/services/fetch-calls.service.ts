import { Injectable } from '@angular/core';
import { googleMapsApiKey } from '../../assets/apikeys.js';

@Injectable({
  providedIn: 'root'
})
export class FetchCallsService {

  constructor() { }

  async searchByApartment(search: string) {
    console.log(search);
    const url = `https://maps.googleapis.com/maps/api/geocode/json?address=${search}&key=${googleMapsApiKey}`;
    const response = await fetch(url);
    console.log(response);
    const location = await response.json();
    return location;
      }
}


import { Injectable } from '@angular/core';
import { googleMapsApiKey } from '../../assets/keys.js';

@Injectable({
  providedIn: 'root'
})
export class FetchCallsService {

  location: string;

  constructor() { }

  async searchByApartment(search: string) {
    let location = null;
    try {
    const url = `https://maps.googleapis.com/maps/api/geocode/json?address=${search}&key=${googleMapsApiKey}`;
    const response = await fetch(url);
    location =  await response.json();
    console.log(location);
    this.location = location;
    return location;
    } catch (Error) {
      console.log(Error, ': fetch-calls.service.ts search by apt');
      return location;
      }
    }

}

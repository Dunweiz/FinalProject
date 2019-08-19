import { FetchCallsService } from './../../services/fetch-calls.service';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { JsonPipe } from '@angular/common';

@Component({
  selector: 'app-locations',
  templateUrl: './locations.component.html',
  styleUrls: ['./locations.component.css']
})
export class LocationsComponent implements OnInit {

  constructor(private router: Router, private fetch: FetchCallsService ) {

   }

  async ngOnInit() {
    try {
    const locat = await this.fetch.location;
    const data = locat.results[0].formatted_address;
    // const data = JSON.parse(locat);
    const address = data.split(', ');
    // console.log(address);
    console.log(address);
    } catch (Error) {
      console.log(Error, 'locations.component.fetch');
    }
  }

}

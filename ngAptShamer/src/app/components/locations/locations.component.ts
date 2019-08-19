import { FetchCallsService } from './../../services/fetch-calls.service';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-locations',
  templateUrl: './locations.component.html',
  styleUrls: ['./locations.component.css']
})
export class LocationsComponent implements OnInit {

  constructor(private router: Router, private fetch: FetchCallsService ) {

   }

  async ngOnInit() {
    const locat = await this.fetch.location;
    console.log(locat);
  }

}

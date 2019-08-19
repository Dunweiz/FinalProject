import { FetchCallsService } from './../../services/fetch-calls.service';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  locationSearch = '';

  constructor(private router: Router, private fetchSvc: FetchCallsService) { }

  ngOnInit() {
  }

  async search() {
    const search = await this.fetchSvc.searchByApartment(this.locationSearch);
    const location = search.results[0].formatted_address;
    this.router.navigateByUrl(`/complexes/${location}`);
  }

}

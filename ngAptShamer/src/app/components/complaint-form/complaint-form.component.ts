import { ComplaintService } from './../../services/complaint.service';
import { Component, OnInit } from '@angular/core';
import { Complaint } from 'src/app/models/complaint';

@Component({
  selector: 'app-complaint-form',
  templateUrl: './complaint-form.component.html',
  styleUrls: ['./complaint-form.component.css']
})
export class ComplaintFormComponent implements OnInit {

  // Fields

  newComp: Complaint = new Complaint();

  // Constructor

  constructor(
    private complaintSvc: ComplaintService
  ) { }


  // Methods

  ngOnInit() {
  }

  create(id: number) {
    this.complaintSvc.create(this.newComp, id).subscribe(
      good => {
        this.newComp = new Complaint();
      },
      bad => {
        console.error(bad);
      }
    );
  }


}

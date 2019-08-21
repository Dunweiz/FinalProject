import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { Complaint } from 'src/app/models/complaint';
import { ComplaintService } from 'src/app/services/complaint.service';

@Component({
  selector: 'app-complaint',
  templateUrl: './complaint.component.html',
  styleUrls: ['./complaint.component.css']
})
export class ComplaintComponent implements OnInit {

  editComplaint: Complaint = null;

  complaints: Complaint = new Complaint();

  constructor(private router: Router,
              private complaintSvc: ComplaintService,
              private route: ActivatedRoute) { }

  ngOnInit() {
    this.displayComplaint();
  }

  displayComplaint() {
    const urlId = this.route.snapshot.paramMap.get('id');
    const urlArr = this.router.url.split('/');
    const complexId = parseInt(urlArr[2], 10);
    const complaintId = parseInt(urlArr[4], 10);
    if (urlId) {
      this.complaintSvc.getComplaintById(complexId, complaintId).subscribe(
        good => {
          console.log(good);
          this.complaints = good;
        },
        bad => {
          console.log(bad);
          this.router.navigateByUrl('notfound');
        }
      );
      }
  }

  delete(cid: number) {
    const urlId = this.route.snapshot.paramMap.get('cid');
    const id = this.route.snapshot.paramMap.get('id');
    if (urlId) {
      this.complaintSvc.destroy(cid).subscribe (
        good => {
          console.log(good);
          this.router.navigateByUrl(`complexes/${parseInt(id, 10)}`);
        },
        bad => {
          console.log(bad);
          this.router.navigateByUrl('notfound');
        }
      );
      }
  }

  setEdit() {
    this.editComplaint = Object.assign({}, this.complaints);
  }

  updateComplaint(complaint: Complaint) {
    const urlId = this.route.snapshot.paramMap.get('cid');
    const id = this.route.snapshot.paramMap.get('id');
    if (urlId) {
      this.complaintSvc.update(complaint.id, complaint).subscribe (
        good => {
          console.log(good);
          this.router.navigateByUrl(`complexes/${parseInt(id, 10)}`);
        },
        bad => {
          console.log(bad);
          this.router.navigateByUrl(`complexes/${parseInt(id, 10)}/complaints/${parseInt(urlId, 10)}`);
        }
      );
    }
  }
}

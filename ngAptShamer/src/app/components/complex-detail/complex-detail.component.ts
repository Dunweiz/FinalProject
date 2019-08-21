import { HttpClient } from 'selenium-webdriver/http';
import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { ComplexService } from 'src/app/services/complex.service';
import { Complex } from 'src/app/models/complex';

@Component({
  selector: 'app-complex-detail',
  templateUrl: './complex-detail.component.html',
  styleUrls: ['./complex-detail.component.css']
})
export class ComplexDetailComponent implements OnInit {

complex: Complex = new Complex();

  constructor(private router: Router,
              private complexSvc: ComplexService,
              private route: ActivatedRoute ) { }

  ngOnInit() {
    this.displayComplex();
  }

  displayComplex() {
    const urlId = this.route.snapshot.paramMap.get('id');
    if (urlId) {
      this.complexSvc.getComplexById(parseInt(urlId, 10)).subscribe(
        good => {
          console.log(good);
          this.complex = good;
        },
        bad => {
          console.log(bad);
          this.router.navigateByUrl('notfound');
        }
      );
    }
  }

  viewComplaint(id: number) {
    this.router.navigateByUrl(`/complexes/${this.complex.id}/complaints/${id}`);
  }

  createNew() {
    this.router.navigateByUrl(`complexes/${this.complex.id}/complaints`);
  }
}

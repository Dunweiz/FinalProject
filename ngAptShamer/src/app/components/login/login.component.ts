import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';
import { User } from 'src/app/models/user';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  constructor(private authSrv: AuthService, private router: Router) { }

  login: User = new User();

  user: any;

  ngOnInit() {
  }

  loginForm() {
    console.log(this.login);
    this.authSrv.login(this.login.username, this.login.password).subscribe(
      next => {
        console.log(next);
        this.user = next;
        console.log(this.user);
        this.checkLogin(this.user);
      },
      error => {
        console.log(error);
        this.router.navigateByUrl('/');
      }
    );
  }

  checkLogin(user) {
    console.log(user)
    if (user.authorities[0].authority === 'admin') {
      this.router.navigateByUrl('/admin');
    } else {
      this.router.navigateByUrl('/home');
    }
  }



}

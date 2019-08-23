import { UserService } from './../../services/user.service';
import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-navigation',
  templateUrl: './navigation.component.html',
  styleUrls: ['./navigation.component.css']
})
export class NavigationComponent implements OnInit {

  constructor(private auth: AuthService, private router: Router, private userSvc: UserService) { }

  ngOnInit() {
  }

  loggedIn = function() {
    return this.auth.checkLogin();
  };

  logout = function() {
    return this.auth.logout();
  };

  checkAdmin() {
    if (this.auth.checkLogin()) {
     const user = this.auth.getCredentials();
     const username = this.auth.returnUserName(user);
     this.userSvc.getUser(username).subscribe (
       good => {

         console.log(good);
        },
        bad => {
          console.log(bad);
        }
        );
    }
  }
}

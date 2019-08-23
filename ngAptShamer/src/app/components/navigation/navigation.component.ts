import { UserService } from './../../services/user.service';
import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/services/auth.service';
import { User } from 'src/app/models/user';

@Component({
  selector: 'app-navigation',
  templateUrl: './navigation.component.html',
  styleUrls: ['./navigation.component.css']
})
export class NavigationComponent implements OnInit {

  admin: User = new User();

  userIsAdmin = null;

  constructor(private auth: AuthService, private router: Router, private userSvc: UserService) { }

  ngOnInit() {
    this.checkAdmin();
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
     console.log(user);
     const username = this.auth.returnUserName(user);
     this.userSvc.getUser(username).subscribe (
       good => {
         console.log(good);
         this.admin = good;
         if (this.admin.role === 'admin') {
           this.userIsAdmin = true;
         } else {
           this.userIsAdmin = false;
         }
        },
        bad => {
          console.log(bad);
          this.userIsAdmin = false;
        }
        );
    }
  }
}

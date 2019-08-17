

export class UserProfile {
  id: number;
  user: User;
  complex: Complex;

  constructor(id?: number, user?: User, ) {
    this.id = id;
    this.user = user;
  }

}

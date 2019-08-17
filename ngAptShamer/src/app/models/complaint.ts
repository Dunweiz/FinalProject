import { Complex } from './complex';
import { Image } from './image';

export class Complaint {
  id: number;
  complex: Complex;
  userProfile: UserProfile;
  created: Date;
  resolved: Date;
  title: string;
  description: string;
  resolution: string;
  images: Image[];
  comments: Comment[];

  constructor(id?: number, complex?: Complex, userProfile?: UserProfile,
              created?: Date, resolved?: Date, title?: string, description?: string,
              resolution?: string, images?: Image[], comments?: Comment[]) {
                this.id = id;
                this.complex = complex;
                this.userProfile = userProfile;
                this.created = created;
                this.resolved = resolved;
                this.title = title;
                this.description = description;
                this.resolution = resolution;
                this.images = images;
                this.comments = comments;
              }
}

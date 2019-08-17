import { Complaint } from './complaint';
export class Image {
  id: number;
  complaint: Complaint;
  imageUrl: string;

  constructor(id?: number, compliant?: Complaint, imageUrl?: string) {
    this.id = id;
    this.complaint = complaint;
    this.imageUrl = imageUrl;
  }
}

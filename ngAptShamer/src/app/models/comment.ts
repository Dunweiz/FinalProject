export class Comment {
  id: number;
  text: string;
  commentDate: Date;
  vote: number;
  complaint: Complaint;
  userProfile: UserProfile;
}

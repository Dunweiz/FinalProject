package com.skilldistillery.shamer.entities;

import java.util.*;

import javax.persistence.*;


@Entity
@Table(name="user_profile")
public class UserProfile {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@OneToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name="complex_id")
	private Complex complex;
	
	private String email;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;
	
	@Column(name="display_name")
	private String displayName;
	
	@Column(name="image_url")
	private String imageUrl;
	
	@OneToMany(mappedBy = "userProfile")
	private List<Comment> comments;
	
	@OneToMany(mappedBy = "userProfile")
	private List<Complaint> complaints;
	
	@OneToMany(mappedBy = "userProfile")
	@Column(name="user_complex_ratings")
	private List<Rating> ratings;

	public UserProfile() {
		super();
	}

	public UserProfile(User user, Complex complex, String email, String firstName, String lastName, String displayName,
			String imageUrl, List<Comment> comments, List<Complaint> complaints, List<Rating> ratings) {
		super();
		this.user = user;
		this.complex = complex;
		this.email = email;
		this.firstName = firstName;
		this.lastName = lastName;
		this.displayName = displayName;
		this.imageUrl = imageUrl;
		this.comments = comments;
		this.complaints = complaints;
		this.ratings = ratings;
	}
	
	public void addComment(Comment comment) {
		if (comments == null)
			comments = new ArrayList<>();
		if (!comments.contains(comment)) {
			comments.add(comment);
		}
	}
	
	public void removeComment(Comment comment) {
		if (comments != null && comments.contains(comment)) {
			comments.remove(comment);
		}
	}
	
	public void addComplaint(Complaint complaint) {
		if (complaints == null)
			complaints = new ArrayList<>();
		if (!complaints.contains(complaint)) {
			complaints.add(complaint);
		}
	}
	
	public void removeComplaint(Complaint complaint) {
		if (complaints != null && complaints.contains(complaint)) {
			complaints.remove(complaint);
		}
	}
	
	public void addRating(Rating rating) {
		if (ratings == null)
			ratings = new ArrayList<>();
		if (!ratings.contains(rating)) {
			ratings.add(rating);
		}
	}
	
	public void removeRating(Rating rating) {
		if (ratings != null && ratings.contains(rating)) {
			ratings.remove(rating);
		}
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Complex getComplex() {
		return complex;
	}

	public void setComplex(Complex complex) {
		this.complex = complex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public List<Complaint> getComplaints() {
		return complaints;
	}

	public void setComplaints(List<Complaint> complaints) {
		this.complaints = complaints;
	}

	public List<Rating> getRatings() {
		return ratings;
	}

	public void setRatings(List<Rating> ratings) {
		this.ratings = ratings;
	}

	@Override
	public String toString() {
		return "UserProfile [id=" + id + ", user=" + user + ", email=" + email + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", displayName=" + displayName + ", imageUrl=" + imageUrl + "]";
	}
}
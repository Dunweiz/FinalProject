package com.skilldistillery.shamer.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class Comment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String text;
	
	@CreationTimestamp
	private Date commentDate;
	
	private int vote;
	
	@ManyToOne
	@JoinColumn(name="complaint_id")
	private Complaint complaint;
	
	@ManyToOne
	@JoinColumn(name="user_profile_id")
	private UserProfile userProfile;

}

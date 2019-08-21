package com.skilldistillery.shamer.services;

import java.security.Principal;
import java.util.List;

import com.skilldistillery.shamer.entities.Complaint;

public interface ComplaintService {

	public List<Complaint> index(int id);
	
	public Complaint show(int id, int cid);
	
	public Complaint create(int id, Complaint complaint, Principal principal);
	
	public Complaint update(int id, int cid, Complaint complaint);
	
	public Boolean destroy(int id, int cid);
}

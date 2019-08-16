package com.skilldistillery.shamer.services;

import java.util.List;

import com.skilldistillery.shamer.entities.Complaint;

public interface ComplaintService {

	public List<Complaint> index(int id);
	
	public Complaint show(int id);
	
	public Complaint create(int id, Complaint complaint);
	
	public Complaint update(int id, int cid, Complaint complaint);
	
	public Boolean destroy(int id);
}

package com.skilldistillery.shamer.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.shamer.entities.Complaint;
import com.skilldistillery.shamer.respositories.ComplaintRepository;
import com.skilldistillery.shamer.respositories.ComplexRepository;

@Service
public class ComplaintServiceImpl implements ComplaintService {
	
	@Autowired
	private ComplaintRepository repo;
	
	@Autowired
	private ComplexRepository cRepo;
	
	public List<Complaint> index(int id){
		return repo.findByComplex_Id(id);
	}
	
	public Complaint show(int id) {
		return repo.findById(id).get();
	}
	
	public Complaint create(int id, Complaint complaint) {
		complaint.setComplex(cRepo.findById(id).get());
		return repo.saveAndFlush(complaint);
	}
	
	public Complaint update(int id, int cid, Complaint complaint) {
		complaint.setComplex(cRepo.findById(id).get());
		Complaint newComplaint = repo.findById(cid).get();
		if(newComplaint != null) {
			newComplaint.setComplex(complaint.getComplex());
			newComplaint.setCreated(complaint.getCreated());
			newComplaint.setDescription(complaint.getDescription());
			newComplaint.setResolution(complaint.getResolution());
			newComplaint.setResolved(complaint.getResolved());
			newComplaint.setTitle(complaint.getTitle());
			repo.saveAndFlush(newComplaint);
		}
		return newComplaint;
	}
	
	public Boolean destroy(int id) {
		Complaint complaint = repo.findById(id).get();
		boolean deleted = false;
		if(complaint != null) {
			repo.deleteById(id);
			deleted = true;
		}
		return deleted;
	}

}

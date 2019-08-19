package com.skilldistillery.shamer.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.shamer.entities.Complaint;
import com.skilldistillery.shamer.entities.Complex;
import com.skilldistillery.shamer.respositories.ComplaintRepository;
import com.skilldistillery.shamer.respositories.ComplexRepository;

@Service
public class ComplaintServiceImpl implements ComplaintService {

	@Autowired
	private ComplaintRepository repo;

	@Autowired
	private ComplexRepository cRepo;

	public List<Complaint> index(int id) {
		return repo.findByComplex_Id(id);
	}

	public Complaint show(int id, int cid) {
		Optional<Complex> complex = cRepo.findById(id);
		if (complex != null) {
			return repo.findById(cid).get();
		} else {
			return null;
		}
	}

	public Complaint create(int id, Complaint complaint) {
		complaint.setComplex(cRepo.findById(id).get());
		return repo.saveAndFlush(complaint);
	}

	public Complaint update(int id, int cid, Complaint complaint) {
		complaint.setComplex(cRepo.findById(id).get());
		Complaint newComplaint = repo.findById(cid).get();
		if (newComplaint != null) {
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

	public Boolean destroy(int id, int cid) {
		Optional<Complex> complex = cRepo.findById(id);
		boolean deleted = false;
		if (complex != null) {
			Complaint complaint = repo.findById(cid).get();
			if (complaint != null) {
				repo.deleteById(cid);
				deleted = true;
			}
		}
		return deleted;
	}

}

package com.skilldistillery.shamer.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.shamer.entities.Comment;
import com.skilldistillery.shamer.entities.Complaint;
import com.skilldistillery.shamer.entities.Image;
import com.skilldistillery.shamer.services.CommentService;
import com.skilldistillery.shamer.services.ComplaintService;
import com.skilldistillery.shamer.services.ImageService;

@RestController
@CrossOrigin({ "*", "http://localhost:4203" })
@RequestMapping("api")
public class ComplaintController {
	
	@Autowired
	private ComplaintService cSvc;
	
	@Autowired
	private CommentService comSvc;
	
	@Autowired
	private ImageService iSvc;
	
	//Test PostMan
//	@GetMapping("ping")
//	public String testPing() {
//	return "pong";
//	}
	
	//Complaints
	@GetMapping("/complexes/{id}/complaints")
	public List<Complaint> complaintsOfComplex(@PathVariable int id) {
		return cSvc.index(id);
	}
	
	@GetMapping("complexes/{id}/complaints/{cid}")
	public Complaint getComplaint(@PathVariable int id, @PathVariable int cid) {
		return cSvc.show(id, cid);
	}
	
	@PostMapping("/complexes/{id}/complaints")
	public Complaint createComplaint(@PathVariable int id, @RequestBody Complaint complaint) {
		return cSvc.create(id, complaint);
	}
	
	@PutMapping("/complexes/{id}/complaints/{cid}")
	public Complaint updateComplaint(@PathVariable int id, @PathVariable int cid, @RequestBody Complaint complaint) {
		return cSvc.update(id, cid, complaint);
	}
	
	@DeleteMapping("complexes/{id}/complaints/{cid}")
	public Boolean destroyComplaint(@PathVariable int id, @PathVariable int cid) {
		return cSvc.destroy(id, cid);
	}
	
	//Images
	@GetMapping("/complaints/{id}/images")
	public List<Image> imagesOfComplaints(@PathVariable int id) {
		return iSvc.index(id);
	}
	
//	@GetMapping("complexes/{id}/images/{mid}")
//	public Image oneImage(@PathVariable int id, @PathVariable int mid) {
//		return iSvc.show(mid);
//	}
	
	@PostMapping("/complaints/{id}/images")
	public Image createImage(@PathVariable int id, @RequestBody Image image) {
		return iSvc.create(id, image);
	}
	
	@DeleteMapping("/images/{id}")
	public Boolean deleteImage(@PathVariable int id) {
		return iSvc.destroy(id);
	}
	
	//Comments
	@GetMapping("/complaints/{id}/comments")
	public List<Comment> getCommentsFromComplaints(@PathVariable int id) {
		return comSvc.index(id);
	}
	
	@GetMapping("/complaints/{id}/comments/{cid}")
	public Comment getImageByComment(@PathVariable int id, @PathVariable int cid) {
		return comSvc.show(id, cid);
	}
	
	@PostMapping("/complaints/{id}/comments")
	public Comment createImage(@PathVariable int id, @RequestBody Comment comment) {
		return comSvc.create(id, comment);
	}
	
	@PutMapping("/complaints/{id}/comments/{cid}") 
	public Comment updateCommment(@PathVariable int id, @PathVariable int cid, @RequestBody Comment comment) {
			return comSvc.update(id, cid, comment);
		}
	@DeleteMapping("/complaints/{id}/comments/{cid}")
	public Boolean destroyComment(@PathVariable int id, @PathVariable int cid) {
		return comSvc.destroy(id, cid);
	}
}

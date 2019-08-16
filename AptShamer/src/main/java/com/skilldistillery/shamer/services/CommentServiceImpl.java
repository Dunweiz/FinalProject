package com.skilldistillery.shamer.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.shamer.entities.Comment;
import com.skilldistillery.shamer.entities.Complaint;
import com.skilldistillery.shamer.respositories.CommentRepository;
import com.skilldistillery.shamer.respositories.ComplaintRepository;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentRepository repo;
	
	@Autowired
	private ComplaintRepository cRepo;
	
	@Override
	public List<Comment> index(int id){
		return repo.findByComplaint_Id(id);
	}
	
	@Override
	public Comment show(int id) {
		return repo.findById(id).get();
	}
	
	@Override
	public Comment create(int id, Comment comment) {
		comment.setComplaint(cRepo.findById(id).get());
		return repo.saveAndFlush(comment);
	}
	
	@Override
	public Comment update(int id, int cid, Comment comment) {
		comment.setComplaint(cRepo.findById(id).get());
		Comment newComment = repo.findById(cid).get();
		if(newComment != null) {
			newComment.setCommentDate(comment.getCommentDate());
			newComment.setComplaint(comment.getComplaint());
			newComment.setText(comment.getText());
			newComment.setVote(comment.getVote());
			repo.saveAndFlush(newComment);
		}
		return newComment;
	}
	
	@Override
	public Boolean destroy(int id) {
		Comment comment = repo.findById(id).get();
		boolean deleted = false;
		if(comment != null) {
			repo.deleteById(id);
			deleted = true;
		}
		return deleted;
	}

}

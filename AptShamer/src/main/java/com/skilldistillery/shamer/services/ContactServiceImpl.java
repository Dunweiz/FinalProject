package com.skilldistillery.shamer.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.shamer.entities.Contact;
import com.skilldistillery.shamer.respositories.ContactRepository;

@Service
public class ContactServiceImpl implements ContactService {

	@Autowired
	private ContactRepository cRepo;
	
	@Override
	public List<Contact> index() {
		return cRepo.findAll();
	}

	@Override
	public Contact show(int id) {
		return null;
	}

	@Override
	public Contact create(Contact contact) {
		return null;
	}

	@Override
	public Contact update(int id, Contact contact) {
		return null;
	}

	@Override
	public Boolean destroy(int id) {
		return null;
	}

}

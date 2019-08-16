package com.skilldistillery.shamer.controllers;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.shamer.entities.Contact;
import com.skilldistillery.shamer.services.ContactService;

@RestController
@RequestMapping("api")
@CrossOrigin({ "*", "http://localhost:4203" })
public class ContactController {
	
	@Autowired
	private ContactService cSvc;
	
	@GetMapping(path = "contacts/ping")
	public String ping() {
		return "pong";
	}
	
	@GetMapping("contacts")
	public List<Contact> showContacts() {
		return cSvc.index();
	}

}

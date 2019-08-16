package com.skilldistillery.shamer.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.shamer.entities.Complex;
import com.skilldistillery.shamer.services.ComplexService;

@RestController
@RequestMapping("api/")
@CrossOrigin({ "*", "http://localhost:4203" })
public class ComplexController {
	
	@Autowired
	private ComplexService svc;
	
	@GetMapping("ping")
	public String ping() {
		return "pong";
	}
	
	@GetMapping("complex")
	public List<Complex> index(HttpServletRequest req, HttpServletResponse res){
		return svc.index();
	}
	
	@GetMapping("complex/{id}")
	public Complex show(HttpServletRequest req, HttpServletResponse resp, @PathVariable("id") int id) {
		return svc.show(id);
	}
	
	@PostMapping("complex")
	public Complex create(HttpServletRequest req, HttpServletResponse res, @RequestBody Complex complex, Principal principal) {
		return svc.create(complex);
	}
	
	@PutMapping("complex/{id}")
	public Complex undate(HttpServletRequest req, HttpServletResponse res, @PathVariable int id, @RequestBody Complex complex, Principal principal) {
		return svc.update(id, complex);
	}

}










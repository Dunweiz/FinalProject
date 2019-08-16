package com.skilldistillery.shamer.services;

import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.skilldistillery.shamer.entities.User;
import com.skilldistillery.shamer.respositories.UserRepository;

@Transactional
@Repository
public class AuthServiceImpl implements AuthService {
	  @Autowired
	  private PasswordEncoder encoder;
	  
	  @Autowired 
	  private UserRepository repo;

	@Override
	public User register(User user) {
		String plainPassword = user.getPassword();
		String encryptedPassword = encoder.encode(plainPassword);
		user.setPassword(encryptedPassword);
		user.setEnabled(true);
		user.setRole("standard");
		repo.saveAndFlush(user);
		return user;
	}
}
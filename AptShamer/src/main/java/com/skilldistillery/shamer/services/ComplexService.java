package com.skilldistillery.shamer.services;

import java.util.List;

import com.skilldistillery.shamer.entities.Complex;

public interface ComplexService {

	//index, show, create, update, delete
	
	List<Complex> index();

	Complex show(int id);

	Complex create(Complex complex);

	Complex update(int id, Complex complex);
	

}

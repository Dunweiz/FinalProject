package com.skilldistillery.shamer.respositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.shamer.entities.Complex;

public interface ComplexRepository extends JpaRepository<Complex, Integer>{

	List<Complex> findByNameLikeOrCityLikeOrStreetLike(String name, String name2, String name3);
}

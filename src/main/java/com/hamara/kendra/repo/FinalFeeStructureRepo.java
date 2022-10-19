package com.hamara.kendra.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hamara.kendra.model.BookingServicesDetails;
import com.hamara.kendra.model.FinalFeeStructure;

@Repository
public interface FinalFeeStructureRepo extends JpaRepository<FinalFeeStructure, Integer>{
	
	FinalFeeStructure findByurlName(String serv);
	

}

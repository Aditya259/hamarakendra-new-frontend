package com.hamara.kendra.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.hamara.kendra.model.BookingServicesDetails;
import com.hamara.kendra.model.User;

public interface UserRepo extends JpaRepository<User, Integer>{
	
	@Query(value="select * from user where email = ?1",nativeQuery = true)
	User findByCustEmail(String email);
	
	@Query(value="select * from user where mobile_no = ?1",nativeQuery = true)
	User findByCustMobileNo(String mobileNo);
	
	

}

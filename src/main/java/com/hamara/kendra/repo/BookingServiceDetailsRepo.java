package com.hamara.kendra.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.hamara.kendra.model.BookingServicesDetails;


@Repository
public interface BookingServiceDetailsRepo extends JpaRepository<BookingServicesDetails, Integer>{
	@Query(value="select * from booking_services_details where url_name= ?1",nativeQuery = true)
	List<BookingServicesDetails> findByurlName(String urlName);
}

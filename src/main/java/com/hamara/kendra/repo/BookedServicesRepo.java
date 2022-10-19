package com.hamara.kendra.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hamara.kendra.model.BookedServices;

@Repository
public interface BookedServicesRepo extends JpaRepository<BookedServices, Integer>{

}

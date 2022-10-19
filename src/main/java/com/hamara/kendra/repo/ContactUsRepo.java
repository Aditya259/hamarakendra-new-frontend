package com.hamara.kendra.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hamara.kendra.model.ContactUs;

@Repository
public interface ContactUsRepo extends JpaRepository<ContactUs, Integer>{

}

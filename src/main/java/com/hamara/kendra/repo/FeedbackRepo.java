package com.hamara.kendra.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hamara.kendra.model.FeedBack;
@Repository
public interface FeedbackRepo extends JpaRepository<FeedBack, Integer>{

}

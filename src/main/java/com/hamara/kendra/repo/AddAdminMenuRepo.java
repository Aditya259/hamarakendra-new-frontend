package com.hamara.kendra.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hamara.kendra.model.AddAdminMenu;

@Repository
public interface AddAdminMenuRepo extends JpaRepository<AddAdminMenu, Integer>{

}

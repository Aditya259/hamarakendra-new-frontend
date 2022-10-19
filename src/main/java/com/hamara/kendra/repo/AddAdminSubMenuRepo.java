package com.hamara.kendra.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hamara.kendra.model.AddAdminSubMenu;

@Repository
public interface AddAdminSubMenuRepo extends JpaRepository<AddAdminSubMenu, Integer>{

}

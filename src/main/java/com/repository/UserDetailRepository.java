package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.UserDetailEntity;
import com.entity.UsersEntity;

@Repository
public interface UserDetailRepository extends JpaRepository<UserDetailEntity, Integer>{

	UserDetailEntity findUserDetailByUser(UsersEntity userById);

}

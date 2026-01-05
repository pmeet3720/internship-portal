package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.InternshipsEntity;

@Repository
public interface InternshipsRepository extends JpaRepository<InternshipsEntity, Integer>{

}

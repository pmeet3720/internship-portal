package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.entity.InternshipsEntity;

@Repository
public interface InternshipsRepository extends JpaRepository<InternshipsEntity, Integer>{

	@Query("""
		    SELECT i FROM InternshipsEntity i
		    LEFT JOIN FETCH i.technologies
		    WHERE i.internshipId = :id
		""")
	InternshipsEntity findByIdWithTechnologies(@Param("id") Integer id);

}

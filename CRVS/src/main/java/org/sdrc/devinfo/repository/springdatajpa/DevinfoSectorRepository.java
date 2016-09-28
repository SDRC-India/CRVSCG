package org.sdrc.devinfo.repository.springdatajpa;

import java.util.List;

import org.sdrc.devinfo.domain.UtIndicatorClassificationsEn;
import org.sdrc.devinfo.repository.SectorRepository;
import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface DevinfoSectorRepository extends SectorRepository, JpaRepository<UtIndicatorClassificationsEn , Long>{ 
	@Override
	@Query("SELECT sector from UtIndicatorClassificationsEn sector where sector.IC_Type = :IC_Type ")
	public List<UtIndicatorClassificationsEn> findByIC_Type(@Param("IC_Type") String IC_Type) throws DataAccessException;
	
	@Override
	@Query("SELECT uice FROM UtIndicatorClassificationsEn uice where uice.IC_Parent_NId = :IC_Parent_NId")
	public List<UtIndicatorClassificationsEn> findByIC_Parent_NId(@Param("IC_Parent_NId") int IC_Parent_NId) throws DataAccessException;
	
	@Override
	@Query("SELECT uice FROM UtIndicatorClassificationsEn uice where uice.IC_NId = :IC_NId")
	public List<UtIndicatorClassificationsEn> findByIC_NId(@Param("IC_NId") int IC_Parent_NId) throws DataAccessException;
	
	@Override
	@Query("SELECT MAX(sector.IC_NId) from UtIndicatorClassificationsEn sector where sector.IC_Type = :IC_Type ")
	public int findIcNIdbySourceType(@Param("IC_Type") String IC_Type) throws DataAccessException;
	
}
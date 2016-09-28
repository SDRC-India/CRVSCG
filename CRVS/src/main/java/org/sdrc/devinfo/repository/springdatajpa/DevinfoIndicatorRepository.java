package org.sdrc.devinfo.repository.springdatajpa;

import java.util.List;

import org.sdrc.devinfo.domain.UtIndicatorEn;
import org.sdrc.devinfo.repository.IndicatorRepository;
import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface DevinfoIndicatorRepository extends IndicatorRepository , JpaRepository<UtIndicatorEn , Long> { 
	
	@Override
	@Query("SELECT distinct uticius,(SELECT utUnit FROM UtUnitEn utUnit where utUnit.unit_NId = utius.unit_NId), " +
			" (SELECT utIn from UtIndicatorEn utIn WHERE utIn.indicator_NId = utius.indicator_NId), " +
			" (SELECT subEn from UtSubgroupValsEn subEn WHERE subEn.subgroup_Val_NId = utius.subgroup_Val_NId) " +
			" FROM UtIcIus uticius,UtIndicatorUnitSubgroup utius,UtIndicatorEn utIn " +
			" WHERE utius.IUSNId = uticius.IUSNId AND uticius.IC_NId = :sectorNid Order by uticius.IUSNId ")
	public List<Object []> findByIC_Type(@Param("sectorNid") Integer sectorNid) throws DataAccessException;
	
	@Override
	@Query("SELECT  utIndicatorEn FROM UtData utData, UtIndicatorEn utIndicatorEn"
			+ " WHERE utData.indicator_NId = utIndicatorEn.indicator_NId AND "
			+ " utData.IUSNId = :iusNID " )
	public UtIndicatorEn findByIndicator_NId(@Param("iusNID")int indicator_NId);
}
package org.sdrc.devinfo.repository.springdatajpa;

import java.util.List;

import org.sdrc.devinfo.domain.UtIndicatorUnitSubgroup;
import org.sdrc.devinfo.repository.UtIndicatorUnitSubgroupRepository;
import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;

public interface DevinfoUtIndicatorUnitSubgroupRepository extends
		UtIndicatorUnitSubgroupRepository, Repository<UtIndicatorUnitSubgroup,Integer> {
	
	@Override
	@Query("SELECT utIus FROM UtIndicatorUnitSubgroup utIus WHERE utIus.IUSNId=:IUSNId")
	UtIndicatorUnitSubgroup findByIUSNId(@Param("IUSNId")int IUSNId) throws DataAccessException;
	
	@Override
	@Query("SELECT utIus FROM UtIndicatorUnitSubgroup utIus "
			+ " WHERE utIus.indicator_NId=(SELECT utIus.indicator_NId FROM UtIndicatorUnitSubgroup utIus WHERE utIus.IUSNId=:IUSNId) "
			+ " AND utIus.subgroup_Val_NId=(SELECT utIus.subgroup_Val_NId FROM UtIndicatorUnitSubgroup utIus WHERE utIus.IUSNId=:IUSNId) "
			+ " AND utIus.unit_NId=:unit_NId ")
	UtIndicatorUnitSubgroup findByIUSNIdAndUnitNid(@Param("IUSNId")int IUSNId,@Param("unit_NId")int unitNid) throws DataAccessException;
	
	@Override
	@Query("SELECT utIus FROM UtIndicatorUnitSubgroup utIus WHERE utIus.indicator_NId=:indicator_NId "
			+ "AND utIus.subgroup_Val_NId=:subgroup_Val_NId "
			+ "AND utIus.unit_NId=:unit_NId")
	UtIndicatorUnitSubgroup findByIndicatorNIdAndSubgroupNidAndUnitNid(@Param("indicator_NId")int indicatorNid,@Param("subgroup_Val_NId")int subgroupNid,@Param("unit_NId")int unitNid) throws DataAccessException;
	
	@Override
	@Query("SELECT utIus FROM UtIndicatorUnitSubgroup utIus WHERE utIus.unit_NId=:unit_NId")
	List<UtIndicatorUnitSubgroup> findByUnitNid(@Param("unit_NId")int unitNid) throws DataAccessException;
}
 
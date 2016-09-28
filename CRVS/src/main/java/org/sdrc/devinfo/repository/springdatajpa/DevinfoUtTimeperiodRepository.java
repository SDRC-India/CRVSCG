package org.sdrc.devinfo.repository.springdatajpa;

import java.util.Date;
import java.util.List;

import org.sdrc.devinfo.domain.UtTimeperiod;
import org.sdrc.devinfo.repository.UtTimeperiodRepository;
import org.springframework.dao.DataAccessException;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;

public interface DevinfoUtTimeperiodRepository extends UtTimeperiodRepository, Repository<UtTimeperiod , Long> {

	@Override
	@Query("SELECT utTime FROM UtTimeperiod utTime WHERE utTime.startDate=:startDate AND utTime.endDate=:endDate")
	UtTimeperiod getByStartDateAndEndDate(@Param("startDate")Date startDate,@Param("endDate")Date endDate);
	
	@Override
	@Query("SELECT utTime FROM UtTimeperiod utTime ORDER BY utTime.startDate DESC ")
	List<UtTimeperiod> getTimeperiodByLimit(Pageable pageable) throws DataAccessException;

//	@Override
//	@Query("SELECT utTime FROM UtTimeperiod utTime WHERE utTime.timePeriod_NId " +
//			" in (SELECT distinct utdata.timePeriod_NId FROM UtData utdata  WHERE utdata.IUSNId = :iusNid AND utdata.source_NId = :sourceNid "
//			+ " AND utdata.area_NId IN(SELECT utArea.area_NId from UtAreaEn utArea "
//			+ " where utArea.area_Parent_NId=(SELECT utAr.area_NId from UtAreaEn utAr where utAr.area_ID = :areaId)) ) ")
	@Override
	@Query("SELECT utTime FROM UtTimeperiod utTime WHERE utTime.timePeriod_NId " +
			" IN ( SELECT distinct utdata.timePeriod_NId FROM UtData utdata  WHERE utdata.IUSNId = :iusNid AND utdata.source_NId = :sourceNid )")
	List<UtTimeperiod> findBySource_Nid(@Param("iusNid") Integer iusNid,@Param("sourceNid") Integer sourceNid) throws DataAccessException;
}

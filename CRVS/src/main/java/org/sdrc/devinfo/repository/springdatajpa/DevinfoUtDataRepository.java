package org.sdrc.devinfo.repository.springdatajpa;

import java.util.List;

import org.sdrc.devinfo.domain.UtAreaEn;
import org.sdrc.devinfo.domain.UtData;
import org.sdrc.devinfo.repository.UtDataRepository;
import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface DevinfoUtDataRepository extends UtDataRepository,Repository<UtData, Long> {
	
	/**
	 * Fetching data from Ut_Data, combination of data, area, time period, source
	 */
	@Override
	@Query("SELECT utData , utArea , utTimePeriod , source FROM UtAreaEn utArea,UtData utData, UtTimeperiod utTimePeriod, UtIndicatorClassificationsEn source "
			+ "WHERE utArea.area_NId = utData.area_NId AND "
			+ "utData.timePeriod_NId = utTimePeriod.timePeriod_NId AND "
			+ "utData.source_NId = source.IC_NId AND "
			+ "utArea.area_NId = :areaNid AND "
			+ "utData.IUSNId = :indicatorId "
			+ "ORDER BY utArea.area_ID,utTimePeriod.timePeriod")
	public List<Object[]> findData(@Param("indicatorId") Integer indicatorId,@Param("areaNid") Integer areaNid);
	
	/**
	 * Fetches UtAreaEns between two levels of area i.e childLevel as 2nd
	 * parameter and areaLevel for areaCode(parent) as 1st parameter. Both the
	 * levels are inclusive. So this method results child areas for given
	 * areaCode and their parent area.
	 */
	@Override
	@Query("SELECT ar FROM UtAreaEn ar WHERE ar.area_Level <= :childLevel AND ar.area_Level >=   "
			+ "(SELECT parArea.area_Level FROM UtAreaEn parArea WHERE parArea.area_ID = :areaId)")
	public UtAreaEn[] getAreaNid(@Param("areaId") String areaCode,@Param("childLevel")Integer childLevel);

	
	@Override
	@Query("SELECT utData , utArea , utTimePeriod FROM UtAreaEn utArea,UtData utData, UtTimeperiod utTimePeriod "
			+ "WHERE utArea.area_NId = utData.area_NId AND "
			+ "utData.timePeriod_NId = utTimePeriod.timePeriod_NId AND"
			+ " utArea.area_NId "
			+ "IN "
			+ "(:areaNid) AND "
			+ " utData.timePeriod_NId = :timeperiodId AND "
			+ " utData.source_NId = :sourceNid AND "
			+ " utData.IUSNId = :indicatorId " 
			+ " ORDER BY utData.data_Value")
	public List<Object[]> findDataByTimePeriod(@Param("indicatorId") Integer indicatorId,@Param("timeperiodId") Integer timeperiodId,@Param("sourceNid") Integer sourceNid,@Param("areaNid") Integer[] areaNid);

	@Query("select area.area_ID,area.area_Name, ar.area_ID, ar.area_Name from UtAreaEn area , UtAreaEn ar where ar.area_NId = area.area_Parent_NId")
	public List<Object[]> findByAreaCode();

	@Override
	@Query("SELECT data FROM UtData data WHERE data.IUSNId=:IUSNId "
			+ "AND data.area_NId=:area_NId "
			+ "AND data.timePeriod_NId=:timePeriod_NId "
			+ "AND data.source_NId=:source_NId")
	UtData findByIUSNIdAndAreaNidAndTimePeriodNidAndSourcNid(
			@Param("IUSNId") int IUSNId, @Param("area_NId") int areaNid,
			@Param("timePeriod_NId") int timeNid,
			@Param("source_NId") int sourceNid) throws DataAccessException;

	@Override
	@Modifying
	@Query("UPDATE UtData data SET data.data_Value=:data_Value WHERE data.IUSNId=:IUSNId "
			+ "AND data.area_NId=:area_NId AND data.timePeriod_NId=:timePeriod_NId "
			+ "AND data.source_NId=:source_NId")
	@Transactional
	void updateDataValue(@Param("data_Value") Double data_Value,
			@Param("IUSNId") int IUSNId, @Param("area_NId") int areaNid,
			@Param("timePeriod_NId") int timeNid,
			@Param("source_NId") int sourceNid) throws DataAccessException;

	@Override
	@Query("SELECT utData , utArea  FROM UtAreaEn utArea,UtData utData "
			+ " WHERE utArea.area_NId = utData.area_NId "
			+ " AND utArea.area_Level = :area_Level "
			+ " AND utData.timePeriod_NId = :timePeriod_NId "
			+ " AND utData.IUSNId = :IUSNId "
			+ " AND utData.source_NId=:source_NId ORDER BY utData.data_Value")
	List<Object[]> findByIUSNIdAndTimePeriodNidAndSourceNidAndAreaLevel(
			@Param("IUSNId") int IUSNId, @Param("timePeriod_NId") int timeNid,
			@Param("source_NId") int sourceNid,
			@Param("area_Level") int areaLevel) throws DataAccessException;

	@Override
	@Query("SELECT utArea.area_Parent_NId,utArea.area_NId,utArea.area_Name,utData.data_Value FROM UtAreaEn utArea,UtData utData "
			+ " WHERE utArea.area_NId = utData.area_NId "
			+ " AND utArea.area_Level = :area_Level "
			+ " AND utData.timePeriod_NId = :timePeriod_NId "
			+ " AND utData.IUSNId = :IUSNId "
			+ " AND utData.source_NId=:source_NId ORDER BY utData.data_Value")
	List<Object[]> findDataValueByAreaLevel(@Param("IUSNId") int IUSNId,
			@Param("timePeriod_NId") int timeNid,
			@Param("source_NId") int sourceNid,
			@Param("area_Level") int areaLevel) throws DataAccessException;

	@Override
	@Query("SELECT data_Value FROM UtData WHERE IUSNId=:ius_nid AND timePeriod_NId=:timeperiod_nid AND source_NId=:source_nid AND area_NId=:area_NId")
	Double getDataValueForBlock(@Param("ius_nid") int ius_nid,
			@Param("timeperiod_nid") int timeperiod_nid,
			@Param("source_nid") int source_nid, @Param("area_NId") int area_NId);
	
	@Override
	@Query("SELECT u.data_Value FROM UtData u WHERE u.IUSNId=:ius_nid AND u.timePeriod_NId=:timeperiod_nid AND u.source_NId=:source_nid AND u.area_NId=(SELECT a.area_NId From UtAreaEn a where a.area_ID=:areaCode)")
	Double getDataValueForDistrict(@Param("ius_nid")int ius_nid,@Param("timeperiod_nid") Integer timeperiod_nid,@Param("source_nid")int source_nid,@Param("areaCode") String areaCode);
	
	@Override
	@Query("SELECT SUM(utData.data_Value) FROM UtData utData "
			+ " WHERE utData.area_NId IN (SELECT utArea.area_NId FROM UtAreaEn utArea WHERE utArea.area_Parent_NId=(SELECT utArea.area_NId FROM UtAreaEn utArea WHERE utArea.area_ID=:area_ID)) "
			+ " AND utData.IUSNId=:IUSNId "
			+ " AND utData.timePeriod_NId=:timePeriod_NId "
			+ " AND utData.source_NId=:source_NId")
	Double getAggregatedDataValueByAreaCode(@Param("IUSNId")int iusNid,@Param("timePeriod_NId")int timePeriodNid,@Param("source_NId")int sourceNid,@Param("area_ID")String areaId) throws DataAccessException;
	
	@Override
	@Query("SELECT ROUND(AVG(utData.data_Value),1) FROM UtData utData "
			+ " WHERE utData.IUSNId IN (SELECT utIus.IUSNId FROM UtIndicatorUnitSubgroup utIus , UtIcIus icIus , UtIndicatorClassificationsEn classificationsEn"
			+ " where utIus.IUSNId=icIus.IUSNId AND icIus.IC_NId=classificationsEn.IC_NId AND classificationsEn.IC_Type='SC' "
			+ " AND classificationsEn.IC_Name=:IC_Name AND utIus.unit_NId=2)"
			+ " AND utData.timePeriod_NId=:timePeriod_NId"
			+ " AND utData.source_NId=:source_NId"
			+ " AND utData.area_NId=:area_NId")
	Double getOverAllscore(@Param("timePeriod_NId")int timePeriodNid,@Param("source_NId")int sourceNid,@Param("area_NId")int areaNid,@Param("IC_Name")String iCName) throws DataAccessException;
	
	@Override
	@Query("SELECT ROUND(AVG(utData.data_Value),1) FROM UtData utData "
			+ " WHERE utData.IUSNId IN (:IUSNIds)"
			+ " AND utData.timePeriod_NId=:timePeriod_NId"
			+ " AND utData.source_NId=:source_NId"
			+ " AND utData.area_NId=:area_NId")
	Double getOverAllscoreForSectors(@Param("timePeriod_NId")int timePeriodNid,@Param("source_NId")int sourceNid,@Param("area_NId")int areaNid,@Param("IUSNIds")Integer[] iusNids) throws DataAccessException;
	
	@Override
	@Query("SELECT ROUND(AVG(utData.data_Value),1) FROM UtData utData "
			+ " WHERE utData.area_NId IN (SELECT utArea.area_NId FROM UtAreaEn utArea WHERE utArea.area_Parent_NId=(SELECT utArea.area_NId FROM UtAreaEn utArea WHERE utArea.area_ID=:area_ID)) "
			+ " AND utData.IUSNId=:IUSNId "
			+ " AND utData.timePeriod_NId=:timePeriod_NId "
			+ " AND utData.source_NId=:source_NId")
	Double getAverageDataValueByAreaCode(@Param("IUSNId")int iusNid,@Param("timePeriod_NId")int timePeriodNid,@Param("source_NId")int sourceNid,@Param("area_ID")String areaId) throws DataAccessException;
	
	/**
	 * Fetching data from Ut_Data, combination of data, area, time period, source
	 */
	@Override
	@Query("SELECT utData , source FROM UtAreaEn utArea,UtData utData, UtTimeperiod utTimePeriod, UtIndicatorClassificationsEn source "
			+ "WHERE utArea.area_NId = utData.area_NId AND "
			+ "utData.timePeriod_NId = utTimePeriod.timePeriod_NId AND "
			+ "utData.source_NId = source.IC_NId AND "
			+ "utArea.area_ID = :areaId  AND "
			+ "utData.IUSNId = :indicatorId AND "
			+ "utTimePeriod.timePeriod = :timeperiod")
	public List<Object[]> findDataByTimeAndAreaId(@Param("indicatorId") Integer indicatorId,@Param("areaId") String areaId,@Param("timeperiod") String timeperiod);
	
}

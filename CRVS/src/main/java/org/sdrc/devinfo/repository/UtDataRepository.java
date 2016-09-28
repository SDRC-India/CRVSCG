package org.sdrc.devinfo.repository;

import java.util.List;

import org.sdrc.devinfo.domain.UtAreaEn;
import org.sdrc.devinfo.domain.UtData;
import org.springframework.dao.DataAccessException;
import org.springframework.transaction.annotation.Transactional;

public interface UtDataRepository {

//	List<Object[]> findData(Integer indicatorId, String[] areaCode,Integer childLevel);

	List<Object[]> findDataByTimePeriod(Integer indicatorId,
			Integer timePeriodNid,Integer sourceNid, Integer[] areaNid);

	@Transactional
	void save(UtData data);

	UtData findByIUSNIdAndAreaNidAndTimePeriodNidAndSourcNid(int IUSNId,
			int areaNid, int timeNid, int sourceNid) throws DataAccessException;

	void updateDataValue(Double data_Value, int IUSNId, int areaNid,
			int timeNid, int sourceNid) throws DataAccessException;

	List<Object[]> findByIUSNIdAndTimePeriodNidAndSourceNidAndAreaLevel(
			int IUSNId, int timeNid, int sourceNid, int areaLevel)
			throws DataAccessException;

	List<Object[]> findDataValueByAreaLevel(int IUSNId, int timeNid,
			int sourceNid, int areaLevel) throws DataAccessException;

	Double getDataValueForBlock(int ius_nid, int timeperiod_nid,
			int source_nid, int area_NId);

	Double getDataValueForDistrict(int ius_nid, Integer timeperiod_nid,
			int source_nid, String areaCode);

	Double getAggregatedDataValueByAreaCode(int iusNid, int timePeriodNid,
			int sourceNid, String areaId) throws DataAccessException;

	UtAreaEn[] getAreaNid(String areaId, Integer childLevel);

	/**
	 * fetching ut_data
	 * @param indicatorId
	 * @param areaNid
	 * @param sourceNid
	 * @return
	 */
	List<Object[]> findData(Integer indicatorId, Integer areaNid);
	
	Double getOverAllscore(int timePeriodNid,int sourceNid,int areaNid,String iCName) throws DataAccessException;
	
	Double getOverAllscoreForSectors(int timePeriodNid,int sourceNid,int areaNid,Integer[] iusNids) throws DataAccessException;

	Double getAverageDataValueByAreaCode(int iusNid,int timePeriodNid,int sourceNid,String areaId) throws DataAccessException;
	
	public List<Object[]> findDataByTimeAndAreaId( Integer indicatorId, String areaId, String timeperiod);
}

package org.sdrc.devinfo.repository;

import java.util.List;

import org.sdrc.devinfo.domain.UtAreaEn;
import org.springframework.dao.DataAccessException;

public interface UtAreaEnRepository {
	
	List<UtAreaEn> findByAreaParentNId(int area_Parent_NId)throws DataAccessException;
	
	UtAreaEn findByAreaID(String area_ID)throws DataAccessException;
	
	List<UtAreaEn> findByAreaLevel(int area_Level)throws DataAccessException;
	
	int findAreaNid(String area_name);
	
	int findAreaNidByParent(String area_name,int parent_nid);

	List<UtAreaEn> findByAreaParentId(String areaCode);

	String areaNamebyAreaID(String areaCode);
	
	UtAreaEn findParentAreaByAreaId(String areaId)throws DataAccessException;
	
	List<UtAreaEn> getClustersByDistrictAreaId(String areaCode)throws DataAccessException;

	String findAreaIdbyAreaName(String area_name) throws DataAccessException;

	List<Integer> findAreaNidbyGranularity(String selectedGranularity)
			throws DataAccessException;

	UtAreaEn findbyAreaNId(int areaNId) throws DataAccessException;
}

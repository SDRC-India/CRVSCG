package org.sdrc.devinfo.repository.springdatajpa;

import java.util.List;

import org.sdrc.devinfo.domain.UtAreaEn;
import org.sdrc.devinfo.repository.UtAreaEnRepository;
import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;

public interface DevinfoUtAreaEnRepository extends UtAreaEnRepository,
		Repository<UtAreaEn,Integer> {

	@Override
	@Query("SELECT utArea From UtAreaEn utArea where utArea.area_Parent_NId=:area_Parent_NId")
	List<UtAreaEn> findByAreaParentNId(@Param("area_Parent_NId")int area_Parent_NId)throws DataAccessException;
	
	@Override
	@Query("SELECT utArea From UtAreaEn utArea where utArea.area_ID=:area_ID")
	UtAreaEn findByAreaID(@Param("area_ID")String area_ID)throws DataAccessException;
	
	@Override
	@Query("SELECT utArea From UtAreaEn utArea where utArea.area_Level=:area_Level")
	List<UtAreaEn> findByAreaLevel(@Param("area_Level")int area_Level)throws DataAccessException;
	
	@Override
	@Query("SELECT utArea.area_NId From UtAreaEn utArea where utArea.area_Name=:area_name")
	int findAreaNid(@Param("area_name")String area_name);
	
	@Override
	@Query("SELECT utArea.area_NId From UtAreaEn utArea where utArea.area_Name=:area_name and utArea.area_Parent_NId=:parent_nid")
	int findAreaNidByParent(@Param("area_name")String area_name,@Param("parent_nid")int parent_nid);
	
	@Override
	@Query("SELECT utArea From UtAreaEn utArea where utArea.area_Parent_NId = (SELECT a.area_NId From UtAreaEn a where a.area_ID=:areaCode)")
	List<UtAreaEn> findByAreaParentId(@Param("areaCode")String areaCode);
	
	@Override
	@Query("SELECT utArea.area_Name From UtAreaEn utArea where utArea.area_ID=:areaCode")
	String areaNamebyAreaID(@Param("areaCode")String areaCode);
	
	@Override
	@Query("SELECT utArea From UtAreaEn utArea where utArea.area_NId=(SELECT utArea.area_Parent_NId From UtAreaEn utArea where utArea.area_ID=:area_ID)")
	UtAreaEn findParentAreaByAreaId(@Param("area_ID")String areaId)throws DataAccessException;
	
	@Override
	@Query("SELECT utArea From UtAreaEn utArea where utArea.area_Parent_NId in (SELECT area.area_NId From UtAreaEn area where area.area_Parent_NId = (SELECT a.area_NId From UtAreaEn a where a.area_ID=:areaCode))")
	List<UtAreaEn> getClustersByDistrictAreaId(@Param("areaCode")String areaCode)throws DataAccessException;
	
	@Override
	@Query("SELECT utArea.area_ID From UtAreaEn utArea where utArea.area_Name=:area_name")
	String findAreaIdbyAreaName(@Param("area_name")String area_name)throws DataAccessException;
	
	@Override
	@Query("SELECT utArea.area_NId From UtAreaEn utArea where utArea.area_Parent_NId = (SELECT area.area_NId From UtAreaEn area where area.area_ID = :selectedGranularity)")
	List<Integer> findAreaNidbyGranularity(@Param("selectedGranularity")String selectedGranularity)throws DataAccessException;
	
	@Override
	@Query("SELECT utArea From UtAreaEn utArea where utArea.area_NId=:areaNId")
	UtAreaEn findbyAreaNId(@Param("areaNId")int areaNId)throws DataAccessException;
}

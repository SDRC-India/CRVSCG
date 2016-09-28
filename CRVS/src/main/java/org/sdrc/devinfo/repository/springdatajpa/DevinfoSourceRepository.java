package org.sdrc.devinfo.repository.springdatajpa;

import java.util.List;

import org.sdrc.devinfo.domain.UtIndicatorClassificationsEn;
import org.sdrc.devinfo.domain.UtIndicatorEn;
import org.sdrc.devinfo.repository.SourceRepository;
import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface DevinfoSourceRepository extends SourceRepository , JpaRepository<UtIndicatorEn , Long>{

	@Override
	@Query("SELECT utIc FROM UtIndicatorClassificationsEn utIc WHERE utIc.IC_NId " +
			" in (SELECT distinct utdata.source_NId FROM UtData utdata WHERE utdata.IUSNId = :iusNid )" )
				
	public List<UtIndicatorClassificationsEn> findByIUS_Nid(@Param("iusNid") Integer iusNid) throws DataAccessException;
}

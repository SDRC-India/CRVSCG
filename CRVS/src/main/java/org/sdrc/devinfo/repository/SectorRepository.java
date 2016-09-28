package org.sdrc.devinfo.repository;
import java.util.List;

import org.sdrc.devinfo.domain.UtIndicatorClassificationsEn;
import org.springframework.dao.DataAccessException;

public interface SectorRepository 
{
	List<UtIndicatorClassificationsEn> findByIC_Type(String IC_Type);

	List<UtIndicatorClassificationsEn> findByIC_Parent_NId(int IC_Parent_NId)throws DataAccessException;

	List<UtIndicatorClassificationsEn> findByIC_NId(int IC_NId)
			throws DataAccessException;

	int findIcNIdbySourceType(String IC_Type) throws DataAccessException;
}

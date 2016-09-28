package org.sdrc.devinfo.repository;
import java.util.List;

import org.sdrc.devinfo.domain.UtIndicatorEn;
import org.springframework.dao.DataAccessException;

public interface IndicatorRepository
{
	public List<Object []> findByIC_Type(Integer sectorNid) throws DataAccessException;
	
	public UtIndicatorEn findByIndicator_NId(int indicator_NId);
}

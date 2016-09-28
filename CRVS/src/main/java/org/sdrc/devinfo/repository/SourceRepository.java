package org.sdrc.devinfo.repository;
import java.util.List;

import org.sdrc.devinfo.domain.UtIndicatorClassificationsEn;
import org.springframework.dao.DataAccessException;

public interface SourceRepository {

	List<UtIndicatorClassificationsEn> findByIUS_Nid(Integer iusNid) throws DataAccessException;
}

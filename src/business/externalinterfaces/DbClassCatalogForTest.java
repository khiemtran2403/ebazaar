package business.externalinterfaces;

import java.util.List;
import middleware.exceptions.DatabaseException;
import middleware.externalinterfaces.DbClass;
import business.exceptions.BackendException;

public interface DbClassCatalogForTest extends DbClass{
	public List<Catalog> getCatalogList() throws BackendException;
	
	public int saveNewCatalogForTest(String catalogName) throws DatabaseException;
	public int deleteCatalogForTest(int catId) throws DatabaseException;
}

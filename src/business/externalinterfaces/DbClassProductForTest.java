package business.externalinterfaces;

import middleware.exceptions.DatabaseException;
import middleware.externalinterfaces.DbClass;

public interface DbClassProductForTest extends DbClass {
	
	public int saveNewProductForTest(Product product, Catalog catalog) throws DatabaseException;
	public int deleteProductForTest(int productId) throws DatabaseException;
}

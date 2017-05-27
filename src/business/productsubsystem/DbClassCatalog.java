package business.productsubsystem;

import java.sql.ResultSet;
import java.sql.Types;
import java.util.List;
import java.util.logging.Logger;

import business.exceptions.BackendException;
import business.externalinterfaces.Catalog;
import business.externalinterfaces.DbClassCatalogForTest;
import middleware.DbConfigProperties;
import middleware.dataaccess.DataAccessSubsystemFacade;
import middleware.exceptions.DatabaseException;
import middleware.externalinterfaces.DataAccessSubsystem;
import middleware.externalinterfaces.DbClass;
import middleware.externalinterfaces.DbConfigKey;

/**
 * This class is concerned with managing data for a single
 * catalog. To read or update the entire list of catalogs in
 * the database, see DbClassCatalogs
 *
 */
public class DbClassCatalog implements DbClass, DbClassCatalogForTest {
	enum Type {INSERT, DELETE, UPDATE};
	@SuppressWarnings("unused")
	private static final Logger LOG = 
		Logger.getLogger(DbClassCatalog.class.getPackage().getName());
	private DataAccessSubsystem dataAccessSS = 
    	new DataAccessSubsystemFacade();
	
	private Type queryType;
	
	private String insertQuery = "INSERT into CatalogType (catalogname) VALUES(?)"; 
	private String deleteCatalogQuery = "DELETE FROM CatalogType WHERE catalogid = ?"; 
	private String updateCatalogQuery = "UPDATE CatalogType SET catalogname = ? WHERE catalogid = ?"; 
	private Object[] insertParams, deleteCatalogParams, updateCatalogParams;
	private int[] insertTypes, deleteCatalogTypes, updateCatalogTypes;
    
    public int saveNewCatalog(String catalogName) throws DatabaseException {
    	queryType = Type.INSERT;
    	insertParams = new Object[]{catalogName};
    	insertTypes = new int[]{Types.VARCHAR};
    	return dataAccessSS.insertWithinTransaction(this);  	
    }
    
    public int deleteCatalog(int catId) throws DatabaseException {
    	queryType = Type.DELETE;
    	deleteCatalogParams = new Object[]{catId};
    	deleteCatalogTypes = new int[]{Types.INTEGER};
    	return dataAccessSS.deleteWithinTransaction(this);  	
    }
    
    public int updateCatalog(Catalog cat) throws DatabaseException {
    	queryType = Type.UPDATE;
    	updateCatalogParams = new Object[]{cat.getName(), cat.getId()};
    	updateCatalogTypes = new int[]{Types.VARCHAR, Types.INTEGER};
    	return dataAccessSS.updateWithinTransaction(this);  	
    }
    
    @Override
	public String getDbUrl() {
		DbConfigProperties props = new DbConfigProperties();	
    	return props.getProperty(DbConfigKey.PRODUCT_DB_URL.getVal());
	}
    
    @Override
	public String getQuery() {
		switch(queryType) {
			case INSERT:
				return insertQuery;
			case DELETE:
				return deleteCatalogQuery;
			case UPDATE:
				return updateCatalogQuery;
			default:
				return null;
		}
	}
    @Override
   	public Object[] getQueryParams() {
   		switch(queryType) {
   			case INSERT:
   				return insertParams;
   			case DELETE:
				return deleteCatalogParams;
   			case UPDATE:
				return updateCatalogParams;
   			default:
   				return null;
   		}
    }		
	 @Override
	public int[] getParamTypes() {
		 switch(queryType) {
			case INSERT:
				return insertTypes;
			case DELETE:
				return deleteCatalogTypes;
			case UPDATE:
				return updateCatalogTypes;
			default:
				return null;
		}
	 }
    @Override
	public void populateEntity(ResultSet resultSet) throws DatabaseException {
		// do nothing
		
	}
    //just for testing
	@Override
	public int saveNewCatalogForTest(String catalogName) throws DatabaseException {
		return saveNewCatalog(catalogName);
	}

	@Override
	public int deleteCatalogForTest(int catId) throws DatabaseException {
		return deleteCatalog(catId);
	}

	@Override
	public List<Catalog> getCatalogList() throws BackendException {
		// TODO Auto-generated method stub
		return null;
	}
	
}

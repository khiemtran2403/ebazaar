package business.productsubsystem;

import java.time.LocalDate;
import java.util.List;
import java.util.logging.Logger;

import middleware.exceptions.DatabaseException;
import business.exceptions.BackendException;
import business.externalinterfaces.*;
import business.util.TwoKeyHashMap;

public class ProductSubsystemFacade implements ProductSubsystem {
	private static final Logger LOG = 
			Logger.getLogger(ProductSubsystemFacade.class.getPackage().getName());
	public static Catalog createCatalog(int id, String name) {
		return new CatalogImpl(id, name);
	}
	public static Product createProduct(Catalog c, String name, 
			LocalDate date, int numAvail, double price) {
		return new ProductImpl(c, name, date, numAvail, price);
	}
	@Override
	public Catalog getCatalogFromName(String catName) throws BackendException {
		LOG.warning("ProductSubsystemFacade method getCatalogFromName has not been implemented");
		return new CatalogImpl(10, catName);
		
	}
	public static Product createProduct(Catalog c, Integer pi, String pn, int qa, 
			double up, LocalDate md, String desc) {
		return new ProductImpl(c, pi, pn, qa, up, md, desc);
	}
	
	/** obtains product for a given product name */
    public Product getProductFromName(String prodName) throws BackendException {
    	try {
			DbClassProduct dbclass = new DbClassProduct();
			return dbclass.readProduct(getProductIdFromName(prodName));
		} catch(DatabaseException e) {
			throw new BackendException(e);
		}	
    }
    public Integer getProductIdFromName(String prodName) throws BackendException {
		try {
			DbClassProduct dbclass = new DbClassProduct();
			TwoKeyHashMap<Integer,String,Product> table = dbclass.readProductTable();
			return table.getFirstKey(prodName);
		} catch(DatabaseException e) {
			throw new BackendException(e);
		}
		
	}
    public Product getProductFromId(Integer prodId) throws BackendException {
		try {
			DbClassProduct dbclass = new DbClassProduct();
			return dbclass.readProduct(prodId);
		} catch(DatabaseException e) {
			throw new BackendException(e);
		}
	}
    
    public List<Catalog> getCatalogList() throws BackendException {
    	try {
			DbClassCatalogTypes dbClass = new DbClassCatalogTypes();
			return dbClass.getCatalogTypes().getCatalogs();
		} catch(DatabaseException e) {
			throw new BackendException(e);
		}
		
    }
    
    public List<Product> getProductList(Catalog catalog) throws BackendException {
    	try {
    		DbClassProduct dbclass = new DbClassProduct();
    		return dbclass.readProductList(catalog);
    	} catch(DatabaseException e) {
    		LOG.info(e.getMessage());
    		throw new BackendException(e);
    	}
    }
	
	public int readQuantityAvailable(Product product) {
		//IMPLEMENT
		LOG.warning("Method readQuantityAvailable(Product product) has not been implemented");
		return 2;
	}
	@Override
	public int saveNewCatalog(String catalogName) throws BackendException {
		try {
			DbClassCatalog dbclass = new DbClassCatalog();
			return dbclass.saveNewCatalog(catalogName);
		} catch(DatabaseException e) {
			LOG.info(e.getMessage());
    		throw new BackendException(e);
    	}
	}
	@Override
	public int deleteCatalog(int catId) throws BackendException {
		try {
			DbClassCatalog dbclass = new DbClassCatalog();
			return dbclass.deleteCatalog(catId);
		} catch(DatabaseException e) {
			LOG.info(e.getMessage());
    		throw new BackendException(e);
    	}
	}
	@Override
	public int updateCatalog(Catalog cat) throws BackendException {
		try {
			DbClassCatalog dbclass = new DbClassCatalog();
			return dbclass.updateCatalog(cat);
		} catch(DatabaseException e) {
			LOG.info(e.getMessage());
    		throw new BackendException(e);
    	}
	}
	@Override
	public int saveNewProduct(Product product, Catalog catalog) throws BackendException {
		try {
			DbClassProduct dbclass = new DbClassProduct();
			return dbclass.saveNewProduct(product, catalog);
		} catch(DatabaseException e) {
			LOG.info(e.getMessage());
    		throw new BackendException(e);
    	}
	}
	@Override
	public int deleteProduct(int productId) throws BackendException {
		try {
			DbClassProduct dbclass = new DbClassProduct();
			return dbclass.deleteProduct(productId);
		} catch(DatabaseException e) {
			LOG.info(e.getMessage());
    		throw new BackendException(e);
    	}
	}
	@Override
	public int updateProduct(Product product) throws BackendException {
		// TODO Auto-generated method stub
		try {
			DbClassProduct dbclass = new DbClassProduct();
			return dbclass.updateProduct(product);
		} catch(DatabaseException e) {
			LOG.info(e.getMessage());
    		throw new BackendException(e);
    	}
	}
	//just for testing
	@Override
	public DbClassCatalogForTest getGenericDbClassCatalog() {
		return new DbClassCatalog();
	}
	@Override
	public DbClassProductForTest getGenericDbClassProduct() {
		return new DbClassProduct();
	}
	
	
}
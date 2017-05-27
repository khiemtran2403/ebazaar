
package business.usecasecontrol;

import java.util.List;
import java.util.logging.Logger;

import org.springframework.stereotype.Component;

import middleware.exceptions.DatabaseException;

import business.exceptions.BackendException;
import business.externalinterfaces.Catalog;
import business.externalinterfaces.Product;
import business.externalinterfaces.ProductSubsystem;
import business.productsubsystem.ProductSubsystemFacade;
@Component
public class ManageProductsController   {
    //INSTANCE;
    private static final Logger LOG = 
    	Logger.getLogger(ManageProductsController.class.getName());
    
    public List<Product> getProductsList(Catalog catalog) throws BackendException {
    	ProductSubsystem pss = new ProductSubsystemFacade();    
    	return pss.getProductList(catalog);
    }
    
    public int saveNewCatalog(String catName) throws BackendException {
    	ProductSubsystem pss = new ProductSubsystemFacade(); 
    	return pss.saveNewCatalog(catName);
    }
    
    public int deleteCatalog(int catId) throws BackendException {
    	ProductSubsystem pss = new ProductSubsystemFacade(); 
    	return pss.deleteCatalog(catId);
    }
    
    public int updateCatalog(Catalog cat) throws BackendException {
    	ProductSubsystem pss = new ProductSubsystemFacade(); 
    	return pss.updateCatalog(cat);
    }
    
    public int saveNewProduct(Product product, Catalog catalog) throws BackendException {
    	ProductSubsystem pss = new ProductSubsystemFacade(); 
    	return pss.saveNewProduct(product, catalog);
    }
    
    public int deleteProduct(int productId) throws BackendException {
    	ProductSubsystem pss = new ProductSubsystemFacade(); 
    	return pss.deleteProduct(productId);
    }
    
    public int updateProduct(Product product) throws BackendException {
    	ProductSubsystem pss = new ProductSubsystemFacade(); 
    	return pss.updateProduct(product);
    }
    
    public Product getProductById(Integer productId) throws BackendException {
		ProductSubsystem pss = new ProductSubsystemFacade();
		return pss.getProductFromId(productId);
	}
    
    public List<Catalog> getCatalogList() throws BackendException {
		ProductSubsystem pss = new ProductSubsystemFacade();
		return pss.getCatalogList();
	}
    
	public List<Product> getProducts(Catalog catalog) throws BackendException {
		ProductSubsystem pss = new ProductSubsystemFacade();
		return pss.getProductList(catalog);
	}
}
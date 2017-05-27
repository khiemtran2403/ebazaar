package presentation.control;

import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import business.exceptions.BackendException;
import presentation.data.CatalogPres;
import presentation.data.ManageProductsData;
import presentation.data.ProductPres;
import presentation.util.Util;

@Controller
public class ManageProductsUIControl {

	private static final Logger LOG = Logger.getLogger(ManageProductsUIControl.class.getSimpleName());

	@Autowired
	ManageProductsData manageProductsData;

	@RequestMapping(method = RequestMethod.GET, value = "/listCatalogs")
	public String getListCatalogs(ModelMap modelMap) {
		LOG.info("******** get List of Catalogs ***********");
		List<CatalogPres> catalogs = null;
		try {
			catalogs = manageProductsData.getCatalogLists();
		} catch (BackendException e) {
			e.printStackTrace();
			LOG.info(e.getMessage());
		}
		modelMap.addAttribute("catalogs", catalogs);
		return "managecatalogs";
	}

	@RequestMapping(value = "/modifyCatalog/catalogId/{id}/catalogName/{name}", method = RequestMethod.GET)
	public String viewCatalogDetail(@PathVariable int id, @PathVariable String name, ModelMap modelMap) {
		LOG.info("catalog id: " + id + ", catalog name: " + name);
		modelMap.addAttribute("catalogId", id);
		modelMap.addAttribute("catalogName", name);
		return "modifycatalog";
	}

	@RequestMapping(value = "/modifyCatalog", method = RequestMethod.POST)
	public String modifyCatalog(@RequestParam int id, @RequestParam String name, ModelMap modelMap) {
		LOG.info("modify Catalog....." + name);
		String successMessage = "";
		try {
			manageProductsData.updateCatalog(id, name);
		} catch (BackendException e) {
			e.printStackTrace();
			LOG.info(e.getMessage());
		} finally {
			LOG.info("modify Catalog....." + name + " successfully");
			successMessage = "Modify Catalog....." + name + " successfully";
		}

		modelMap.addAttribute("catalogId", id);
		modelMap.addAttribute("catalogName", name);
		modelMap.addAttribute("successMessage", successMessage);
		return "modifycatalog";
	}

	@RequestMapping(value = "/addNewCatalog", method = RequestMethod.POST)
	public String addNewCatalog(@RequestParam String name, ModelMap modelMap) {
		LOG.info("add New Catalog.....");

		int catalogId = 0;
		try {
			catalogId = manageProductsData.saveNewCatalog(name);
		} catch (BackendException e) {
			e.printStackTrace();
			LOG.info(e.getMessage());
		} finally {
			LOG.info("add New Catalog....." + catalogId + " " + name + " successfully");
		}

		return this.getListCatalogs(modelMap);
	}

	@RequestMapping(value = "/deleteCatalog/catalogId/{id}/catalogName/{name}", method = RequestMethod.GET)
	public String deleteCatalog(@PathVariable int id, @PathVariable String name, ModelMap modelMap) {
		System.out.println("delete Catalog.....");

		try {
			manageProductsData.deleteCatalog(id);
		} catch (BackendException e) {
			e.printStackTrace();
			LOG.info(e.getMessage());
		} finally {
			LOG.info("delete Catalog....." + name + " successfully");
		}

		return this.getListCatalogs(modelMap);
	}

	@RequestMapping(value = "/manageProducts/catalogId/{id}/catalogName/{name}", method = RequestMethod.GET)
	public String getListProducts(@PathVariable int id, @PathVariable String name, ModelMap modelMap) {
		LOG.info("********* get List of Products **********");
		List<ProductPres> products = null;
		CatalogPres cat = manageProductsData.createCatalogPres(id, name);
		try {
			products = manageProductsData.getProductLists(cat);
		} catch (BackendException e) {
			e.printStackTrace();
			LOG.info(e.getMessage());
		}

		modelMap.addAttribute("products", products);
		modelMap.addAttribute("catalog", cat);
		return "manageproducts";
	}

	@RequestMapping(value = "/addNewProduct", method = RequestMethod.POST)
	public String addNewProduct(@RequestParam int catid, @RequestParam String catname, @RequestParam String productname,
			@RequestParam String mfgdate, @RequestParam int totalquantity, @RequestParam double price,
			@RequestParam String description, ModelMap modelMap) {
		LOG.info("add New Catalog.....");
		CatalogPres catalog = manageProductsData.createCatalogPres(catid, catname);
		ProductPres product = null;
		try {
			product = manageProductsData.createProductPres(catname, 0, productname, totalquantity, price,
					Util.localDateForString(mfgdate), description);
		} catch (BackendException e1) {
			e1.printStackTrace();
			LOG.info(e1.getMessage());
		}

		int productid = 0;
		try {
			productid = manageProductsData.saveNewProduct(product.getProduct(), catalog.getCatalog());
		} catch (BackendException e2) {
			e2.printStackTrace();
			LOG.info(e2.getMessage());
		} finally {
			LOG.info("add New Catalog....." + productid + " " + productname + " successfully");
		}

		List<ProductPres> products = null;

		try {
			products = manageProductsData.getProductsListPres(catalog);
		} catch (BackendException e) {
			e.printStackTrace();
			LOG.info(e.getMessage());
		}

		modelMap.addAttribute("products", products);
		modelMap.addAttribute("catalog", catalog);
		return "manageproducts";
	}

	@RequestMapping(value = "/deleteProduct/id/{id}/catid/{catid}/catname/{catname}", method = RequestMethod.GET)
	public String deleteProduct(@PathVariable int id, @PathVariable int catid, @PathVariable String catname,
			ModelMap modelMap) {
		LOG.info("delete Product.....");
		CatalogPres catalog = manageProductsData.createCatalogPres(catid, catname);
		try {
			manageProductsData.deleteProduct(id);
		} catch (BackendException e1) {
			e1.printStackTrace();
			LOG.info(e1.getMessage());
		} finally {
			LOG.info("delete Product....." + id + " successfully");
		}

		List<ProductPres> products = null;

		try {
			products = manageProductsData.getProductsListPres(catalog);
		} catch (BackendException e) {
			e.printStackTrace();
			LOG.info(e.getMessage());
		}

		modelMap.addAttribute("products", products);
		modelMap.addAttribute("catalog", catalog);
		return "manageproducts";
	}

	@RequestMapping("/viewProduct")
	public String viewProductDetail(@RequestParam("id") int id, @RequestParam("catname") String catname, @RequestParam("catid") String catid,
			ModelMap modelMap) {
		LOG.info("viewProductsHandler2 - id: " + id);
		ProductPres prodPres = null;
		try {
			prodPres = manageProductsData.createProductPresByName(id);
		} catch (BackendException e) {
			e.printStackTrace();
			LOG.info(e.getMessage());
		}
		modelMap.addAttribute("product", prodPres);
		modelMap.addAttribute("catname", catname);
		modelMap.addAttribute("catid", catid);
		return "modifyproduct";
	}

	@RequestMapping(value = "/modifyProduct", method = RequestMethod.POST)
	public String modifyProduct(@RequestParam String name, @RequestParam String mfg, @RequestParam int quantityavail,
			@RequestParam double unitprice, @RequestParam String description, @RequestParam int id,
			@RequestParam String catname, @RequestParam int catid, ModelMap modelMap) {
		LOG.info("modify Product.....");
		String successMessage = "";
		ProductPres product = null;
		try {
			product = manageProductsData.createProductPres(catname, id, name, quantityavail, unitprice,
					Util.localDateForString(mfg), description);
		} catch (BackendException e1) {
			e1.printStackTrace();
			LOG.info(e1.getMessage());
		}

		try {
			manageProductsData.updateProduct(product.getProduct());
		} catch (BackendException e) {
			e.printStackTrace();
			LOG.info(e.getMessage());
		} finally {
			LOG.info("modify Product....." + id + " successfully");
			successMessage = "Modify Product....." + name + " successfully";
		}

		modelMap.addAttribute("product", product);
		modelMap.addAttribute("catname", catname);
		modelMap.addAttribute("catid", catid);
		modelMap.addAttribute("successMessage", successMessage);
		return "modifyproduct";
	}
}

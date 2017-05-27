
package business.externalinterfaces;

import java.io.Serializable;

public interface Address extends Serializable{
    public String getStreet();
    public String getCity();
    public String getState();
    public String getZip();
    public int getId();
    public void setStreet(String s);
    public void setCity(String s);
    public void setState(String s);
    public void setZip(String s);
    public void setId(int id);
    public boolean isShippingAddress();
	public boolean isBillingAddress();   
}

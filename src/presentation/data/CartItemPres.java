package presentation.data;

import java.io.Serializable;

public class CartItemPres implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8914014237294493367L;
	
	private CartItemData cartItem;

	public CartItemPres() {
	}

	public void setCartItem(CartItemData item) {
		cartItem = item;
	}

	public CartItemData getCartItem() {
		return cartItem;
	}

	public String getItemName() {
		return cartItem.getItemName();
	}

	public void setItemName(String name) {
		cartItem.setItemName(name);
	}

	public int getQuantity() {
		return cartItem.getQuantity();
	}

	public void setQuantity(int quant) {
		cartItem.setQuantity(quant);
	}

	public double getPrice() {
		return cartItem.getPrice();
	}

	public void setPrice(double price) {
		cartItem.setPrice(price);
	}

	public double getTotalPrice() {
		return cartItem.getTotalPrice();
	}
}

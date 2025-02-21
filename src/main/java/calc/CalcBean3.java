package calc;

import java.util.ArrayList;
import java.util.List;

public class CalcBean3 {
    private int res;
    private String fruit;
    private int quantity;
    private int price;
    private int totalprice;
    private List<CartItem> cartItems;

    public CalcBean3(){
        cartItems = new ArrayList<CartItem>();
    }

    public void addToCart() {
        if(this.fruit == null) {
            return;
        }
        calcculate();
        CartItem item = new CartItem(this.fruit, this.quantity, this.price);
        cartItems.add(item);
    }

    public int getCartTotal() {
        int total = 0;
        for(CartItem item : cartItems) {
            total += item.getTotalPrice();
        }
        return total;
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public void calcculate() {
        if(this.fruit == null) {
            return;
        }
        else if(this.fruit.equals("사과")) {
            this.price = 1000;
        }
        else if(this.fruit.equals("바나나")) {
            this.price = 2000;
        }
        else if(this.fruit.equals("키위")){
            this.price = 500;
        }
        this.totalprice = this.price * this.quantity;
    }



    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getFruit() {
        return fruit;
    }
    public void setFruit(String fruit) {
        this.fruit = fruit;
    }

    public int getRes() {
        return res;
    }
    public void setRes(int res) {
        this.res = res;
    }

    public int getPrice() {
        return price;
    }
    public void setPrice(int price) {
        this.price = price;
    }

    public int getTotalprice() {
        return totalprice;
    }
    public void setTotalprice(int totalprice) {
        this.totalprice = totalprice;
    }

}

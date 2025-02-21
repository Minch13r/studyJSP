package calc;

public class CartItem {
    private String fruit;
    private int quantity;
    private int price;
    private int totalPrice;

    public CartItem(String fruit, int quantity, int price) {
        this.fruit = fruit;
        this.quantity = quantity;
        this.price = price;
        this.totalPrice = price * quantity;
    }

    // Getter와 Setter 메소드들
    public String getFruit() {
        return fruit;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getPrice() {
        return price;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

}

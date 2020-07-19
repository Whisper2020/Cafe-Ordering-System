package entity;

public class Order {
    int orderNo;
    String consumerName;
    String foodName;
    int quantity;
    double price;
    String orderDate;

    public String getOrderDate() {
        return orderDate;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getFoodName() {
        return foodName;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }



    public int getOrderNo() {
        return orderNo;
    }

    public String getConsumerName() {
        return consumerName;
    }



    public void setConsumerName(String consumerName) {
        this.consumerName = consumerName;
    }



    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public void setOrderNo(int orderNo) {
        this.orderNo = orderNo;
    }



}

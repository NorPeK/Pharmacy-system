package project_gui_remake;

public class Order {
    //int
    String  cust_id , quantity , product_id,price,order_date;
    
    String product_name , cust_name;
    
    public Order(){
       
    }
    public Order(String cust_id,String cust_name,String product_id,String product_name,String quantity,String price,String order_date){
        this.cust_id=cust_id;
        this.cust_name=cust_name;
        this.product_id=product_id;
        this.quantity=quantity;
        this.price=price;
        this.order_date=order_date;
    }

    public String getCust_id() {
        return cust_id;
    }

    public void setCust_id(String cust_id) {
        this.cust_id = cust_id;
    }

    public String getCust_name() {
        return cust_name;
    }

    public void setCust_name(String cust_name) {
        this.cust_name = cust_name;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }
}
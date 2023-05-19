package project_gui_remake;

public class Products {
  
    //int
    int product_id,quantity;
    
    double selling_price;
    
    String name,type,barcode,dose,production_data,expiration_date;
    
    public Products(){
        
    }
    public Products(String name , String type , String barcode , String dose , int product_id , int selling_price , 
            String production_date , String expiration_date , int quantity){
        this.name=name;
        this.type=type;
        this.barcode=barcode;
        this.dose=dose;
        this.product_id=product_id;
        this.selling_price=selling_price;
        this.production_data=production_date;
        this.expiration_date=expiration_date;
        this.quantity=quantity;

    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public double getSelling_price() {
        return selling_price;
    }

    public void setSelling_price(int selling_price) {
        this.selling_price = selling_price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    public String getDose() {
        return dose;
    }

    public void setDose(String dose) {
        this.dose = dose;
    }

    public String getProduction_data() {
        return production_data;
    }

    public void setProduction_data(String production_data) {
        this.production_data = production_data;
    }

    public String getExpiration_date() {
        return expiration_date;
    }

    public void setExpiration_date(String expiration_date) {
        this.expiration_date = expiration_date;
    }
    
    
    
    
}
package project_gui_remake;

public class Warehouses {
    //int
    String Managerssn;
    String Supplied_Company , warehouse_name ,warehouse_Id;
    
    public Warehouses(){
        
    }
    public Warehouses(String Supplied_Company , String warehouse_name , String Managerssn , String warehouse_id ){
       
        this.Supplied_Company=Supplied_Company;
        this.warehouse_name=warehouse_name;
        this.Managerssn=Managerssn;
        this.warehouse_Id=warehouse_Id;
    }

    public String getManagerssn() {
        return Managerssn;
    }

    public void setManagerssn(String Managerssn) {
        this.Managerssn = Managerssn;
    }

    public String getSupplied_Company() {
        return Supplied_Company;
    }

    public void setSupplied_Company(String Supplied_Company) {
        this.Supplied_Company = Supplied_Company;
    }

    public String getWarehouse_name() {
        return warehouse_name;
    }

    public void setWarehouse_name(String warehouse_name) {
        this.warehouse_name = warehouse_name;
    }

    public String getWarehouse_Id() {
        return warehouse_Id;
    }

    public void setWarehouse_Id(String warehouse_Id) {
        this.warehouse_Id = warehouse_Id;
    }
    
}

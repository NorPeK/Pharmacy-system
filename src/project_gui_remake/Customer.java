package project_gui_remake;

import java.math.BigInteger;

public class Customer {
    //int
    BigInteger id , phone;
    
    String name , password , dob;
    
    String gender;
    
    public Customer(){
        
    }
    
    public Customer(BigInteger id , String name , BigInteger phone , String gender , String password , String dob){
        this.id=id;
        this.name=name;
        this.phone=phone;
        this.gender=gender;
        this.password=password;
        this.dob=dob;
    }

    public BigInteger getId() {
        return id;
    }

    public void setId(BigInteger id) {
        this.id = id;
    }

    public BigInteger getPhone() {
        return phone;
    }

    public void setPhone(BigInteger phone) {
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
    
}

package project_gui_remake;

import java.math.BigInteger;

public class Adminstrator {
    //int
    BigInteger SSN;
      
    int phone,salary;
    
    String name , dob , address , password; 
    //char
    String gender;
    
    public Adminstrator(){
        
    }
    
    public Adminstrator(BigInteger SSN , String name , String dob ,String gender , String address , int phone ,
                            String password , int salary){
        this.SSN=SSN;
        this.name=name;
        this.dob=dob;
        this.gender=gender;
        this.address=address;
        this.phone=phone;
        this.password=password;
        this.salary=salary;
    }

    public BigInteger getSSN() {
        return SSN;
    }

    public void setSSN(BigInteger SSN) {
        this.SSN = SSN;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    
    
    
}

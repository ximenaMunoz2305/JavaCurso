/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author SENA
 */
public class DbData {
    private final String driver= "com.mysql.jdbc.Driver";
    private final String user = "root";
    private final String pass = "";
    private final String url = "jdbc:mysql://localhost/pet_manager";

    public String getDriver() {
        return driver;
    }

    public String getUser() {
        return user;
    }

    public String getPass() {
        return pass;
    }

    public String getUrl() {
        return url;
    }
   
    
    
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package javacurso;



import java.sql.Connection;
import java.sql.DriverManager;


public class Javacurso {

    public static void main(String[] args) {
        String driver = "com.mysql.jdbc.Driver";
        String user = "root";
        String password = "";
        String url = "jdbc:mysql://localhost:3306/mascotasbd";
        Connection connection = null;
        
        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(url, user, password);
            
            // Aquí puedes realizar operaciones con la conexión
            
            // No olvides cerrar la conexión cuando hayas terminado de usarla
            connection.close();
        } catch(Exception e) {
            e.printStackTrace(); // Imprimir la traza del error
        }
    }
}
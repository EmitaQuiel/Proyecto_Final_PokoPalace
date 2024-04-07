/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Emi
 */
public class Conexion {
    private static String bd = "bd_poko_palace";
    private static String url = "jdbc:mysql://localhost:3306/" + bd;
    private static String user = "root";
    private static String password = "Vinemipokitos.321";
    
    
    public static Connection getConnection(){
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("conexion establecida");
        } catch (Exception ex) {
            System.out.println("Ha ocurrido un error: " + ex.getMessage());
        }
        return conn;
    }
}

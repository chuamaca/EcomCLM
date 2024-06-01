/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Conexion;

import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author Cesar
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        // TODO code application logic here
        
        Connection conexion=ConexionJDBC.getConnection();
        System.out.println("conex: " + conexion.toString());
    }
    
}

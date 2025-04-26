/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Hospital;


import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mittr
 */
public class Connect {
    public Connection con;
    
    public Connect() throws ClassNotFoundException, SQLException{
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_management_system", "hms", "raysdebuggers");
      
    }
//    public Connection con=null;
//    public static Connection ConnectToDB() throws ClassNotFoundException {
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management_system","libms","raysdebuggers");
////            jdbc:mysql://localhost:3306/library_management_system?zeroDateTimeBehavior=convertToNull
//        } catch (SQLException ex) {
//            Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return con;
//    }
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        System.out.print(new Connect().con);
    }
}



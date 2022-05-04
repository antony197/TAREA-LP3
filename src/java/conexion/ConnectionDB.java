package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConnectionDB 
{
    private final String url;
    private Connection conn;
    
    public ConnectionDB() 
    {        
        this.url = "jdbc:mysql://localhost:3306/bdyt?user=root&password=";
        try 
        {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();//para MySQL 8.x..x
            //Class.forName("com.mysql.jdbc.Driver").newInstance();//para MySQL 5.x..x
            
           
            if(this.conn==null){
                this.conn = DriverManager.getConnection(url);
                System.out.println("Todo bien..estamos conectados..!!");
            }
        } 
        catch (SQLException e) 
        {
            e.printStackTrace();            
        }         
        catch (InstantiationException e) 
        {
            e.printStackTrace();
        }         
        catch (IllegalAccessException e) 
        {
            e.printStackTrace();
        } 
        catch (ClassNotFoundException e) 
        {
            e.printStackTrace();
        }
    }
    
    public Connection getConn() {
        return conn;
    }
    public void cierraConexion()
    {        
        try 
        {
            this.conn.close();
        } 
        catch (SQLException ex) 
        {
            Logger.getLogger(ConnectionDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

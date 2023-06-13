
package com.solent.mavenproject2;
import java.sql.*;




public class Database {
    private String driverName = "com.mysql.cj.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String dbName = "test";
    String userId = "root";
    String password = "";
    
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    
    public Database(){
        
        try {
            Class.forName(driverName);
            connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
            statement=connection.createStatement();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        
    }
    
    public ResultSet executeSQL(String sql){
        //System.out.println(sql);
       
        try{
            //System.out.println(statement);
            resultSet =  statement.executeQuery(sql);
            //System.out.println("heer");
        } catch(SQLException e){
            e.printStackTrace();
        }
        //System.out.println(rs);
        return resultSet;
        
    }
    
    public int getQueryRowCount(ResultSet rs) throws SQLException
    {
        int size = 0;
        while (rs.next()) {
            size++;
        }
        return size;
    }
    
    public int executeUpdate(String query) throws SQLException {
    Statement statement = connection.createStatement();
    int rowsAffected = statement.executeUpdate(query);
    statement.close();
    return rowsAffected;
}

    
    
    
}
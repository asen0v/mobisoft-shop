package com.solent.mavenproject2;
import com.solent.mavenproject2.Database;

import java.sql.ResultSet;
import java.sql.SQLException;

public class User {
    Database db = new Database();

    public boolean login(String uName, String uPass) throws SQLException{
        //System.out.println(db.connection);
        ResultSet rs = db.executeSQL("Select * from user where uName='"+uName+"' AND uPass='"+uPass+"'");
        return db.getQueryRowCount(rs)==1;
        //return false;//rs.getRow()==1;
    }
    
    public String[] getUserDetails(String uName, String uPass) throws SQLException
    {
        ResultSet rs = db.executeSQL("Select * from user where uName='"+uName+"' AND uPass='"+uPass+"'");
        rs.next();
        String[] user = {rs.getString("uId"),rs.getString("uTitle"),rs.getString("uType")};
        return user;
    }
public boolean register(String uName, String uPass, String uTitle) throws SQLException {
    ResultSet rs = db.executeSQL("SELECT * FROM user WHERE uName='" + uName + "'");
    if (db.getQueryRowCount(rs) > 0) {
        return false;  // Username already exists
    } else {
        String query = "INSERT INTO user (uName, uPass, uTitle, uBank, uType) VALUES ('" + uName + "', '" + uPass + "', '" + uTitle + "', '3000', 'user')";
        int rowsAffected = db.executeUpdate(query);
        return rowsAffected > 0;
    }
}


}



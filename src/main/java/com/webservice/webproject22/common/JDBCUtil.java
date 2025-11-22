package com.webservice.webproject22.common;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCUtil {
    private static Connection con=null;
    public static Connection getConnection(){
        try{
            if(con==null || con.isClosed()){
                Class.forName("org.mariadb.jdbc.Driver");
                con= DriverManager.getConnection("jdbc:mariadb://walab.handong.edu:3306/W25_22200525", "W25_22200525", "Ooth3x");
            }
        }catch (Exception e){
            System.out.println(e);
        }
        return con;
    }

//    public static void main(String[] args){
//        Connection con = JDBCUtil.getConnection();
//        if(con != null){
//            System.out.println("연결 성공!");
//        }
//    }
}

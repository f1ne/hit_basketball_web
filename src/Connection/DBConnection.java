package Connection;
import java.sql.*;


public class DBConnection {
	   	String DRIVER = "com.mysql.jdbc.Driver";
	   	//private static final String URL ="jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_booklib";
	   	//private static final String USER = "ynw54y204w";
	   	//private static final String PWD = "3xwx5zi540j2543ki3ymyyl1m4xklw5xm21m132j";
	   	private static final String URL ="jdbc:mysql://localhost:3306/db";
	   	private static final String USER = "root";
	   	private static final String PWD = "csm0212";
	   	private  Connection con = null;
	   	public DBConnection(){
	  	try {
	  		Class.forName("com.mysql.jdbc.Driver");
	  		con = DriverManager.getConnection(URL,USER,PWD);
	  		System.out.println("database connecting succeed");
	  	} catch (SQLException e) {
	  		System.out.println("database connecting failed");
	  		// TODO Auto-generated catch blo-QWAwaaAck
	  		e.printStackTrace();
	  	} catch (ClassNotFoundException e) {
	  		// TODO Auto-generated catch block
	  		System.out.println("driver load failed");
	  		e.printStackTrace();
	  	}
	   }
	   public Connection getConnection(){
		   return con;
	   }
	   public void close(){
		   try {
	    		this.con.close();
	    		System.out.println("database closing succeed");
	    		} catch (SQLException e) {
	    		// TODO Auto-generated catch block
	    		System.out.println("database closing failed");
	    		e.printStackTrace();
	    	}
	   }
}

package Connection;
import java.sql.*;


public class DBConnection {
	   	String DRIVER = "com.mysql.jdbc.Driver";
	   	private static final String URL ="jdbc:mysql://localhost:3306/db";
	   	private static final String USER = "root";
	   	private static final String PWD = "csm0212";
	   	private  Connection con = null;
	   	public DBConnection(){
	  	try {
	  		Class.forName("com.mysql.jdbc.Driver");
	  		//<----------------- 本地数据库------------------------>
	  		//con = DriverManager.getConnection(URL,USER,PWD);
	  		//<-----------------sae数据库链接------------------------->
	  		String accesskey="k00152n2my";
    		String secretkey="mk3wwz5w1552xxlhh1kl043j1yz513l3ii0ikh22";
    		con=DriverManager.getConnection("jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_guangxibei",accesskey,secretkey);
	  	    //<---------------------------------------------------->
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

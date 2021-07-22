<%@ page contentType="application/json" %>

<%@page
	import="org.json.simple.JSONObject,org.json.simple.JSONValue,org.json.simple.JSONArray,java.util.*"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page
	import="java.sql.Connection,java.sql.SQLException,java.time.LocalDate,java.lang.StringBuffer"%>

	<%
	
	String dbFull= String.valueOf(request.getParameter("dbUFull")); //N00E099
	System.out.println ("dbFull is="+dbFull);
	
	String dbIns = String.valueOf(request.getParameter("dbUIns")); //N00E099
	System.out.println ("dbIns is="+dbIns);
	
	String dbEma = String.valueOf(request.getParameter("dbUEma")); //N00E099
	System.out.println ("dbEma is="+dbEma);

	String dbNam = String.valueOf(request.getParameter("dbUNam")); //N00E099
	System.out.println ("dbNam is="+dbNam);
	
	String dbPass = String.valueOf(request.getParameter("dbUPass")); //N00E099
	System.out.println ("dbPass is="+dbPass);
	
	
	System.out.println("Connecting to mysql...");
	String url = "jdbc:mysql://localhost:3306/webdb";
	String user = "root";
	String password = "";
                                      	// Date date1=new Date();
	Connection connect;
	
	JSONObject objT = new JSONObject();
	JSONArray objArT = new JSONArray();
	
	objArT.add(objT);

//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	connect = DriverManager.getConnection(url, user, password);
	PreparedStatement preparedStmt = connect.prepareStatement("text");
	int result=100;
	boolean status=true;
	
	
	try {
		//DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		
		//String query = "SELECT `Pass` FROM `user_pass` WHERE `Name`= ?;";
		//String query = "INSERT INTO `user_data` (`full_name`, `instansi`,`email`, `name`, `Pass`) VALUES (?, ?, ?,?,?)";

		String queryS = "SELECT COUNT('name') FROM `user_data` WHERE `name`=?";

			
		
		// create the mysql insert preparedstatement
		preparedStmt = connect.prepareStatement(queryS);
		preparedStmt.setObject(1, dbNam);
		
		// execute the preparedstatement
		

		
		ResultSet rs = preparedStmt.executeQuery();
		while (rs.next()) {
			result=rs.getInt(1);
			//try {
		if(result==0) 
		{
	System.out.println("result0="+result);

			
				//DriverManager.registerDriver(new com.mysql.jdbc.Driver());
				
				//String query = "SELECT `Pass` FROM `user_pass` WHERE `Name`= ?;";
				String query = "INSERT INTO `user_data` (`full_name`, `instansi`,`email`, `name`, `Pass`) VALUES (?, ?, ?,?,?)";

				//String queryS = "SELECT `name` FROM `user_data` WHERE `name`= ?";

					
				
				// create the mysql insert preparedstatement
				preparedStmt = connect.prepareStatement(query);
				preparedStmt.setObject(1, dbFull);
				preparedStmt.setObject(2, dbIns);
				preparedStmt.setObject(3, dbEma);
				preparedStmt.setObject(4, dbNam);
				preparedStmt.setObject(5, dbPass);
				
				// execute the preparedstatement
				preparedStmt.executeUpdate();

				//ResultSet rs2 = preparedStmt.executeUpdate();
				//while (rs.next()) {
					//System.out.println(rs.getString("png_name") + "," + rs.getString("full_path"));
				//}
					 //  foundType = result.getString(1);
					
					//out.print(objT);
			
			/*System.out.println("mainObjWritten" );
			out.flush();
					//}
			} 
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally {
		        try {
		        	preparedStmt.close();
		            connect.close();
		        } 
		        catch (Exception e) {
		            e.printStackTrace();
		        }
		    }
*/
			System.out.println("statusYes="+status);
			objT.put("result", status);		
		
			String test = "echo success";
			//System.out.println("mainObj="+mainObj );
			//System.out.println("cek_user_db-->this is true");
			//System.out.println("objT="+objT);
			out.print(objT);
			out.flush();
		
		}
		else {
			
			System.out.println("statusNO="+status);
			status=false;
			objT.put("result", status);		
		
			String test = "echo success";
			//System.out.println("mainObj="+mainObj );
			//System.out.println("cek_user_db-->this is true");
			//System.out.println("objT="+objT);
			out.print(objT);
			out.flush();
		}
		
		//ResultSet rs = preparedStmt.executeQuery();
		//while (rs.next()) {
			//System.out.println(rs.getString("png_name") + "," + rs.getString("full_path"));
		//}
			 //  foundType = result.getString(1);
			
			//out.print(objT);
	
	//System.out.println("mainObjWritten" );
	
			//}
	}
	}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	finally {
        try {
        	preparedStmt.close();
            connect.close();
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
    }

	
	
	
		%>


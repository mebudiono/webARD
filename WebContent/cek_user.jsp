<%@ page contentType="application/json" %>

<%@page
	import="org.json.simple.JSONObject,org.json.simple.JSONValue,org.json.simple.JSONArray,java.util.*"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page
	import="java.sql.Connection,java.sql.SQLException,java.time.LocalDate,java.lang.StringBuffer"%>

	<%
	String userN= String.valueOf(request.getParameter("name")); //N00E099
	System.out.println ("userN is="+userN);
	
	String pass = String.valueOf(request.getParameter("pass")); //N00E099
	System.out.println ("pass is="+pass);
	
	

	System.out.println("Connecting to mysql...");
	String url = "jdbc:mysql://localhost:3306/webdb";
	String user = "root";
	String password = "";
	// Date date1=new Date();
	Connection connect;
	LocalDate date = LocalDate.now();


	JSONObject objT = new JSONObject();
	JSONArray objArT = new JSONArray();
/*
	String tileT=tile+"_T";
String dateAT=dateA+"_T";
String dateBT=dateB+"_T";
objT.put("dateAT", dateAT);
objT.put("dateBT", dateBT);
	
*/
	
	objArT.add(objT);
	
	//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	try {
		System.out.println("Connected, search mysql...");
		//DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		connect = DriverManager.getConnection(url, user, password);
		String query = "SELECT `pass` FROM `user_data` WHERE `name`= ?;";
		//String query = "SELECT `name`,`path` FROM `filepath` WHERE `tile`=? AND (date >= ? and date <= ?)";

		// create the mysql insert preparedstatement
		PreparedStatement preparedStmt = connect.prepareStatement(query);
		preparedStmt.setObject(1, userN);
		
		// execute the preparedstatement
		//preparedStmt.execute();

		ResultSet rs = preparedStmt.executeQuery();
		//while (rs.next()) {
			//System.out.println(rs.getString("png_name") + "," + rs.getString("full_path"));
		//}
		if(rs.next()){
			System.out.println("RS Next...");
			 //  foundType = result.getString(1);
			
			boolean t=true;
			System.out.println("rs.getString(Pass):"+rs.getString("Pass"));
			if(rs.getString("Pass").equals(pass)){
				//String jString = JSONObject.toJSONString(tesReceive);
				//Boolean t=true;
				objT.put("result", t);

	
				String test = "echo success";
				//System.out.println("mainObj="+mainObj );
				System.out.println("cek_user_db-->this is true");
				System.out.println("objT="+objT);
				out.print(objT);
	
				//System.out.println("mainObjWritten" );
				out.flush();

			}
			else{	
				//	String test = "echo success";
				//System.out.println("mainObj="+mainObj );
				t=false;
				objT.put("result", t);
				System.out.println("objT="+objT);
				System.out.println("cek_user_db-->this is false");
				String test = "echo success";
				//System.out.println("mainObj="+mainObj );
	
				out.print(objT);
				out.flush();
				}
			}	//}
	else{
		System.out.println("Not Found no next RS...");
	}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	%>


<%@ page contentType="application/json" %>

<%@page
	import="org.json.simple.JSONObject,org.json.simple.JSONValue,org.json.simple.JSONArray,java.util.*"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page
	import="java.sql.Connection,java.sql.SQLException,java.time.LocalDate,java.lang.StringBuffer"%>

	<%
	String name = String.valueOf(request.getParameter("folder")); //N00E099
	System.out.println ("name is="+name);
	
	/*
	char[] NAr=tile.toCharArray();
	StringBuffer N=new StringBuffer();
	N.append(NAr[0]);
	N.append(NAr[1]);
	N.append(NAr[2]);
	String north=N.toString();
	
	StringBuffer E=new StringBuffer();
	E.append(NAr[3]);
	E.append(NAr[4]);
	E.append(NAr[5]);
	E.append(NAr[6]);
	String east=E.toString();
	
	if (dateA == "") {
		dateA = "2010-01-01";
	}
	if (dateB == "") {
		dateB = "2099-12-31";
	}
*/
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
	objT.put("name", name);
	
	objArT.add(objT);
	
	//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	try {
		//DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		connect = DriverManager.getConnection(url, user, password);
		String query = "SELECT content FROM `content` WHERE `name`= ?;";
		//String query = "SELECT `name`,`path` FROM `filepath` WHERE `tile`=? AND (date >= ? and date <= ?)";

		// create the mysql insert preparedstatement
		PreparedStatement preparedStmt = connect.prepareStatement(query);
		preparedStmt.setObject(1, name);
		
		// execute the preparedstatement
		//preparedStmt.execute();

		ResultSet rs = preparedStmt.executeQuery();
		//while (rs.next()) {
			//System.out.println(rs.getString("png_name") + "," + rs.getString("full_path"));
		//}

		JSONObject obj = new JSONObject();
		JSONObject mainObj = new JSONObject();
		JSONArray objAr = new JSONArray();
		//ResultSet rs = preparedStmt.executeQuery();
		//if(rs.isBeforeFirst()){
		while (rs.next()) {
			//create JSONObject object and name is "obj"
			String cont=rs.getString("content");
			String[] contAr=cont.split(",");
			for(int i=0;i<contAr.length;i++){
				objAr.add(contAr[i]);	
			}
			
			/*System.out.println("tempNm=" + tempNm);

			String tempPt=rs.getString("path");
			objAr.add(rs.getString("path")); // get database record and "put" through json object "obj" and store in name,skill,age object variable name
			System.out.println("tempPt=" + tempPt);
			//System.out.println(rs.getDate("date")+","+rs.getString("tile")+","+rs.getString("png_name")+","+rs.getString("full_path"));	
			//objAr.add(obj);
			
		
		/*
		mainObj.put("namePath",objAr);
		System.out.println("objAr(0)="+objAr.get(0));
		System.out.println("objAr(1)="+objAr.get(1));
		System.out.println("objAr(2)="+objAr.get(2));
		*/
		//}else{
		}
		//}
		//String jString = JSONObject.toJSONString(tesReceive);
		String test = "echo success";
		//System.out.println("mainObj="+mainObj );
		out.print(objAr);
		
		System.out.println("mainObjWritten" );
		out.flush();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	%>


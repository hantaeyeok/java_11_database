<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*, java.sql.*" %>
<%@ page import="org.kh.dto.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String userid = "system";
	String userpw = "1234";
	String sql = "";
	
	List<All_table> aList = new ArrayList<All_table>();
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection(url, userid, userpw);
		
		sql = "select owner,table_name,tablespace_name,pct_used,pct_free from all_tables where owner='SYSTEM' and tablespace_name='SYSTEM' and num_rows is null";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while(rs.next()){
			All_table data = new All_table(
					rs.getString("owner"), 
					rs.getString("table_name"),
					rs.getString("tablespace_name"),
					rs.getInt("pct_used"),
					rs.getInt("pct_free"));
			aList.add(data);
		}
	} catch(Exception e){
		e.printStackTrace();
	} finally {
		if(rs!=null){
			try {
				rs.close();
			} catch(Exception e){
				e.printStackTrace();
			}
		}
		if(pstmt!=null){
			try {
				pstmt.close();
			} catch(Exception e){
				e.printStackTrace();
			}
		}
		if(con!=null){
			try {
				con.close();
			} catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	pageContext.setAttribute("aList", aList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터베이스 오브젝트 생성 완료 보고서</title>
<style>
	.title { text-align:center; }
    .tb th { border-top:3px solid #333; border-bottom:3px solid #333; line-height:40px; }
    .tb td { border-bottom:1px solid #333; line-height: 30px; text-align: center; } 
    hr { clear:both; width:100%; margin:30px 0px; padding:0; } 
</style>
</head>
<body>
<h1 class="title">데이터베이스 오브젝트 생성 완료 보고서</h1>
<%@ include file="menu.jsp" %>
<hr>
<h2 class="title">all_data_system 목록</h2>
	<table style="width:1400px;margin:30px auto" class="tb">
		<thead>
		<tr>
			<th>owner</th>
			<th>table_name</th>
			<th>tablespace_name</th>
			<th>pct_used</th>
			<th>pct_free</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="data" items="${aList }" varStatus="status">
			<tr>
			<td>${data.owner }</td>
			<td>${data.table_name }</td>
			<td>${data.tablespace_name }</td>
			<td>${data.pct_used }</td>
			<td>${data.pct_free }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>
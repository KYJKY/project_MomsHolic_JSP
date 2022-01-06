<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>맘스톡</title>
	<link rel="stylesheet" href="css/bootstrap.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<%
		String userID = null;
		if (request.getParameter("userID") != null) {
			userID = (String) request.getParameter("userID");
		}
		String loginID = null;
		if(session.getAttribute("loginSession")!=null){
			loginID = (String)session.getAttribute("loginSession");
		}
		if (!userID.equals(loginID)){
			%> 
			<script>
			alert("로그인 정보가 일치하지 않습니다.");
			window.close();
			</script>
			<%
		}
		// DB접속
		String DB_URL = "jdbc:mysql://localhost:3306/momsholic";
		String DB_ID = "multi";
		String DB_PASSWORD = "abcd";
		Class.forName("org.gjt.mm.mysql.Driver"); 
		Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
		request.setCharacterEncoding("UTF-8");
		
	%>
	
</head>
<body>
<nav class="navbar navbar-default">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
		aria-expanded="false">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<p class="navbar-brand" style="font-weight:bold;font-size:18px;color:black;margin:0px">MOM'S TALK</p>
	</div>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li class="active"><a href="javascript:window.close();">나가기</a>
		</ul>
	</div>
	<hr style="margin:0 0 20px"></hr>
	<div class="container bootstrap snippet">
	<div class="row">
		<div class="col-xs-12">
			<div class="portlet portlet-default">
				<div id="chat" class="panel-collapse collapse in">
					<div id="chatlist" class="porlet-body chat-widget" style="overflow-y:auto; overflow-x:hidden; width: auto; height: 600px">
					<%
					String jsql = "select * from msgcontent where mc_id in (select max(mc_id) from msgcontent where mc_sendid = ? or mc_receiveid = ? group by mc_roomid) order by mc_id desc";
					PreparedStatement pstmt = con.prepareStatement(jsql);
					pstmt.setString(1, userID);
					pstmt.setString(2, userID);
					ResultSet rs = pstmt.executeQuery();
					while(rs.next()) {
						int tp_id = rs.getInt("tp_id");
						String mc_contentTemp = rs.getString("mc_content");
						int mc_dateTime = Integer.parseInt(rs.getString("mc_date").substring(11,13));
						String timeType = "오전";
						if (mc_dateTime >= 13) {
							timeType = "오후";
							mc_dateTime -= 12;
						} if (mc_dateTime == 12) {
							timeType = "오후";
						}
						String mc_date = rs.getString("mc_date").substring(0,11) + " " + timeType + " " + mc_dateTime + ":" + rs.getString("mc_date").substring(14,16) + "";
						int mc_roomid = rs.getInt("mc_roomid");
						String mc_sendid = rs.getString("mc_sendid");
						String mc_receiveid = rs.getString("mc_receiveid");
						String counterid = null;
						
						if (!userID.equals(mc_sendid)) {
							counterid = mc_sendid;
						} else if (!userID.equals(mc_receiveid)) {
							counterid = mc_receiveid;
						}
						String jsqlnick = "select m_nickname from member where m_id = ?";
						PreparedStatement pstmtnick = con.prepareStatement(jsqlnick);
						pstmtnick.setString(1,counterid);
						ResultSet rsnick = pstmtnick.executeQuery();
						String counternick = null;
						if (rsnick.next()) {
							counternick = rsnick.getString("m_nickname");
						}
						
						String jsql2 = "select tp_goodsimg from tradepost where tp_id = ?";
						PreparedStatement pstmt2 = con.prepareStatement(jsql2);
						pstmt2.setInt(1,tp_id);
						ResultSet rs2 = pstmt2.executeQuery();
						String goodsimg = null;
						if (rs2.next()) {
							goodsimg = rs2.getString("tp_goodsimg");
						}
						String jsql3 = "select count(mc_id) from msgcontent where mc_receiveid = ? and mc_roomid = ? and mc_read = 0";
						PreparedStatement pstmt3 = con.prepareStatement(jsql3);
						pstmt3.setString(1,userID);
						pstmt3.setInt(2,mc_roomid);
						ResultSet rs3 = pstmt3.executeQuery();
						int unreadmsg = 0;
						if (rs3.next()) {
							unreadmsg = rs3.getInt(1);
						}
						
						String mc_content = null;
						if (mc_contentTemp.length() <= 18) {
							mc_content = mc_contentTemp;
						} else if (mc_contentTemp.length() > 18) {
							mc_content = mc_contentTemp.substring(0, 18);
							mc_content += "...";
						}
						%>
						<div class="row" onclick="location.href='momstalk.jsp?userID=<%=userID%>&toID=<%=counterid%>&tp_id=<%=tp_id%>'" style="cursor:pointer;">
						<div class="col-lg-12">
						<div class="media">
						<a class="pull-left" href="momstalk.jsp?userID=<%=userID%>&toID=<%=counterid%>&tp_id=<%=tp_id%>">
						<img class="media-object img-circle" src="<%=goodsimg %>" alt="" style="width:50px">
						</a>
						<div class="media-only">
						<h4 class="media-heading">
						
						<span style="font-size:14px;"><%=counternick %>&nbsp;<font style="color:#999999;">(<%=counterid %>)</font></span>
						<span class="small pull-right">
						<%=mc_date %>
						</span>
						</h4>
						<span class="small pull-right">
						<%
						if (unreadmsg != 0) {
						%>
						<span id="unread" class="label label-success" style="font-size:12px;"><%=unreadmsg %></span>
						<%
						}
						%>
						
						</span>
						<p><%=mc_content %></p>
						</div>
						</div>
						</div>
						</div>
						<hr>
						<%
					}
					%>
					
					
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</nav>
</body>
</html>
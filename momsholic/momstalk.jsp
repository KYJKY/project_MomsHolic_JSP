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
		String toID = null;
		if (request.getParameter("toID") != null) {
			toID = (String) request.getParameter("toID");
		}
		String tp_id = null;
		if(request.getParameter("tp_id") != null) {
			tp_id = (String) request.getParameter("tp_id");
		}
		// DB접속
		String DB_URL = "jdbc:mysql://localhost:3306/momsholic";
		String DB_ID = "multi";
		String DB_PASSWORD = "abcd";
		Class.forName("org.gjt.mm.mysql.Driver"); 
		Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
		request.setCharacterEncoding("UTF-8");
		
		String jsqlnick = "select m_nickname from member where m_id = ?";
		PreparedStatement pstmtnick = con.prepareStatement(jsqlnick);
		pstmtnick.setString(1,toID);
		ResultSet rsnick = pstmtnick.executeQuery();
		String counternick = null;
		if(rsnick.next()) {
			counternick = rsnick.getString("m_nickname");
		}
		
		String jsql = "select * from tradepost where tp_id = ?";
		PreparedStatement pstmt = con.prepareStatement(jsql);
		pstmt.setString(1,tp_id);
		ResultSet rs = pstmt.executeQuery();
		String tp_titleTemp = null;
		String tp_title = null;
		String tp_goodsimg = null;
		if (rs.next()) {
			tp_titleTemp = rs.getString("tp_title");
			tp_goodsimg = rs.getString("tp_goodsimg");
			if (tp_titleTemp.length() <= 10) {
				tp_title = tp_titleTemp;
			} else if (tp_titleTemp.length() > 10) {
				tp_title = tp_titleTemp.substring(0, 10);
				tp_title += "...";
			}
		}
		
			 		
	
	%>
	<script type="text/javascript">
		$('textarea').keyup(function(e){
			if(e.keyCode == 13) {
				submitFunction();
			}
		});
		
		function autoClosingAlert(selector, delay) {
			var alert = $(selector).alert();
			alert.show();
			window.setTimeout(function() { alert.hide()}, delay);
		}
		
		function submitFunction() {
			<% System.out.println("userID");
			System.out.println("toID");
			%>
			var fromID = '<%=userID%>';
			var toID = '<%=toID%>';
			var tp_id = '<%=tp_id%>';
			var chatContent = $('#chatContent').val();
			$.ajax({
				type: "POST",
				url: "./chatSubmitServlet",
				data : {
					fromID: encodeURIComponent(fromID),
					toID: encodeURIComponent(toID),
					tp_id: encodeURIComponent(tp_id),
					chatContent: encodeURIComponent(chatContent),
				},
				success: function(result) {
					
				}
			});
			$('#chatContent').val('');
			
		}
		var lastID = 0;
		function chatListFunction(type) {
			var fromID = '<%=userID%>';
			var toID = '<%=toID%>';
			$.ajax({
				type: "POST",
				url: "./chatListServlet",
				data: {
					fromID: encodeURIComponent(fromID),
					toID: encodeURIComponent(toID),
					listType: type
				},
				success: function(data) {
					if(data == "") return;
					var parsed = JSON.parse(data);
					var result = parsed.result;
					for (var i = 0 ; i < result.length ; i++ ) {
						addChat(result[i][0].value, result[i][2].value, result[i][3].value);
					}
					lastID = Number(parsed.last);
				}
			});
		}
		
		function addChat(chatName, chatContent, chatTime) {
			$('#chatlist').append('<div class="row">' +
				'<div class="col-lg-12">' +
				'<div class="media">' +
				'<a class="pull-left" href="#">' +
				'<img class="media-object img-circle" src="images/icon.png" alt="">' +
				'</a>' +
				'<div class="media-only">' +
				'<h4 class="media-heading">' +
				chatName +
				'<span class="small pull-right">' +
				chatTime +
				'</span>' +
				'</h4>' +
				'<p>' +
				chatContent +
				'</p>' +
				'</div>' +
				'</div>' +
				'</div>' +
				'</div>' +
				'<hr>');
			$('#chatlist').scrollTop($('#chatlist')[0].scrollHeight);
		}
		
		function getInfiniteChat() {
			setInterval(function() {
				chatListFunction(lastID);
			}, 2000);
		}
	</script>
</head>
<body>
<nav class="navbar navbar-default">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
		aria-expanded="false" style="margin-top:12px;">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<%
		if (tp_id != null) {
		%>
		<p class="navbar-brand" style="font-weight:bold;font-size:18px;color:black;margin:0px 0px 5px 0px;padding:10px 10px;">
		<img class="media-object img-circle" src="<%=tp_goodsimg %>" alt="" style="width:40px;display:inline;margin-right:5px"><%=tp_title %></p>
		<%
		} else {
		%>
		<p class="navbar-brand" style="font-weight:bold;font-size:18px;color:black;margin:0px 0px 5px 0px;padding:20px 15px;">
			MOM'S TALK
		<%
		}
		%>
	</div>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li class="active"><a href="momstalklist.jsp?userID=<%=userID%>">이전으로</a>
		</ul>
	</div>
	<hr style="margin:0 0 10px"></hr>
	<div class="container bootstrap snippet">
	<div class="row">
		<div class="col-xs-12">
			<div class="portlet portlet-default">
				<div class="portlet-heading">
					<div class="portlet-title">
						<h4><i class="fa fa-circle text-green"></i><%=counternick %><font style="color:#999999;">(<%=toID%>)</font>님과 대화</h4>
						<hr></hr>
					</div>
					<div class="clearfix"></div>
				</div>
				<div id="chat" class="panel-collapse collapse in">
					<div id="chatlist" class="porlet-body chat-widget" style="overflow-y:auto; overflow-x:hidden; width: auto; height: 600px">
					</div>
					<div class="portlet-footer">
						<div class="row" style="hieght:90px;">
							<div class="form-group col-xs-10">
								<textarea style="height:80px" id="chatContent" class="form-control" placeholder="메세지를 입력하세요." maxlength="100"></textarea>
							</div>
							<div class="form-group col-xs-2">
								<button type="button" class="btn btn-default pull-right" onclick="submitFunction()">전송</button>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			chatListFunction('0');
			getInfiniteChat();
		});
	</script>
</div>
</nav>
</body>
</html>
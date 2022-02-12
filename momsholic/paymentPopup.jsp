<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>     
<html>
   <head><title>결제진행</title>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
   <script>
		function loginalert(){
			alert("로그인이 필요한 서비스입니다.");
			opener.location.href="login.jsp";
			window.close();
		}
		</script>
   </head>      
   <body>
   <%
   String DB_URL="jdbc:mysql://localhost:3306/momsholic";  
   String DB_ID="multi";  
   String DB_PASSWORD="abcd"; 
 	 
   Class.forName("org.gjt.mm.mysql.Driver");  
   Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
   request.setCharacterEncoding("UTF-8");
   
   String tp_id = request.getParameter("tp_idval");
   String method = request.getParameter("paymentMethod");
   int total = Integer.parseInt(request.getParameter("totalamount"));
   String dealing = request.getParameter("dealingval");
   String buyername = "";
   String buyertel = "";
   String buyeraddrcode = "";
   String buyeraddr1 = "";
   String buyeraddr2 = "";
   
   String jsqlseller = "select m_id from tradepost where tp_id = ?";
   PreparedStatement pstmtseller = con.prepareStatement(jsqlseller);
   pstmtseller.setString(1, tp_id);
   ResultSet rsseller = pstmtseller.executeQuery();
   rsseller.next();
   String sellerid = rsseller.getString("m_id");
   
   if (!dealing.equals("directDealing")) {
	   buyername = request.getParameter("buyername");
	   buyertel = request.getParameter("buyertel");
	   buyeraddrcode = request.getParameter("addressCode");
	   buyeraddr1 = request.getParameter("address1");
	   buyeraddr2 = request.getParameter("address2");
   }
   
   String loginID = null;
	if(session.getAttribute("loginSession")!=null){
		loginID = (String)session.getAttribute("loginSession");
	}
	
   String jsql = "select * from member where m_id=?";
   PreparedStatement pstmt = con.prepareStatement(jsql);
   pstmt.setString(1,loginID);
   ResultSet rs = pstmt.executeQuery();
   rs.next();
   String email1 = rs.getString("m_email1");
   String email2 = rs.getString("m_email2");
   String email = email1 + "@" + email2;
   String phoneTemp = rs.getString("m_phone");
   String phone1 = phoneTemp.substring(0,3);
   String phone2 = phoneTemp.substring(3,7);
   String phone3 = phoneTemp.substring(7,11);
   String phone = phone1 + "-" + phone2 + "-" + phone3;
   String address = rs.getString("m_address1");
   int addresscode = rs.getInt("m_addresscode");
   
   String jsqlhistory = "select count(*) from tradehistory where tp_id = ? and th_buyerid = ?";
   PreparedStatement pstmthistory = con.prepareStatement(jsqlhistory);
   pstmthistory.setInt(1,Integer.parseInt(tp_id));
   pstmthistory.setString(2,loginID);
   ResultSet rshistory = pstmthistory.executeQuery();
   rshistory.next();
   int istraded = rshistory.getInt(1);
   if(istraded > 0) {
	   %>
	   <script>
	   alert("이미 결제된 거래입니다.");
	   window.close();
	   </script>
	   <%
   } else {
   if (method.equals("kakao")) {
   %>
   <script>
   $(function() {
	   IMP.init('imp07485077');
	   IMP.request_pay({
		 pg : 'kakaopay',
		 pay_method : 'card',
		 merchant_uid : 'merchant_' + new Date().getTime(),
		 name : '결제진행',
		 amount : <%=total%>,
		 buyer_email : '<%=email%>',
		 buyer_tel : '<%=phone%>',
		 buyer_addr : '<%=address%>',
		 buyer_postcode : '<%=addresscode%>'
	   }, function(rsp) {
		   if (rsp.success) {
			   $.ajax({
					type: 'POST',
					url: './PaymentServlet',
					data: {tp_id:"<%=tp_id%>", loginID:"<%=loginID%>", name:"<%=buyername%>",
						tel:"<%=buyertel%>", addrCode:"<%=buyeraddrcode%>", addr1:"<%=buyeraddr1%>", addr2:"<%=buyeraddr2%>"},
					success: function(result) {
						if(result == 1) {
					    	
							//성공
							alert("결제를 성공적으로 완료하였습니다.");
							opener.location.href="paymentSuccess.jsp?tp_id=<%=tp_id%>";
							window.close();
						} else if (result == -1){
							//실패
							alert("결제 실패 : 이미 결제된 거래입니다.");
							window.close();
						} else {
							alert("결제 실패 : DB 오류가 발생하였습니다.");
							window.close();
						}
					}
				})
		   } else {
			   alert("결제 실패 : " + rsp.error_msg);
			   window.close();
		   }
		   
	   });
   })
   </script>
   <% } else if (method.equals("card")) { %>
   <script>
   $(function() {
	   IMP.init('imp04178657');
	   IMP.request_pay({
		   pg : 'danal_tpay',
		   pay_method : 'card',
		   merchant_uid : 'merchant' + new Date().getTime(),
		   name : '결제진행',
		   amount : <%=total%>,
		   buyer_email : '<%=email%>',
		   buyer_tel : '<%=phone%>',
		   buyer_addr : '<%=address%>',
		   buyer_postcode : '<%=addresscode%>'
	   }, function(rsp) {
		   if (rsp.success) {
			   $.ajax({
					type: 'POST',
					url: './PaymentServlet',
					data: {tp_id:"<%=tp_id%>", loginID:"<%=loginID%>", name:"<%=buyername%>",
						tel:"<%=buyertel%>", addrCode:"<%=buyeraddrcode%>", addr1:"<%=buyeraddr1%>", addr2:"<%=buyeraddr2%>"},
					success: function(result) {
						if(result == 1) {
							
							//성공
							alert("결제를 성공적으로 완료하였습니다.");
							opener.location.href="paymentSuccess.jsp?tp_id=<%=tp_id%>";
							window.close();
						} else if (result == -1){
							//실패
							alert("결제 실패 : 이미 결제된 거래입니다.");
							window.close();
						} else {
							alert("결제 실패 : DB 오류가 발생하였습니다.");
							window.close();
						}
					}
				})
		   } else {
			   alert("결제 실패 : " + rsp.error_msg);
			   window.close();
		   }
	   });
   })
   </script>
   <% }} %>
  </body>
</html>
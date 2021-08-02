<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%
    
    String button = request.getParameter("btn");
    if(button !=null && button.equals("submit") )
    {
      
    String address = request.getParameter("add");
    String pin = request.getParameter("code");
    String datetime = request.getParameter("datetime");
    String contact= request.getParameter("con");
    String quantity= request.getParameter("quantity");
    try{
        Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            PreparedStatement st = con.prepareStatement("insert into ordertab values(?,?,?,?,?)");
            st.setString(1,address);
            st.setString(2,pin);
            st.setString(3,datetime);
            st.setString(4,contact);
            st.setString(5,quantity);
            st.executeUpdate();
           // System.out.println("Record inserted");
           //response.sendRedirect("confirmation.jsp");
    }catch(Exception ex){}
    }
    

%>
<%
  String btn1 = request.getParameter("btn");
  if(btn1!=null && btn1.equals("submit"))
  {
      String quantity  = request.getParameter("q1");
       String fuel_rate = request.getParameter("f1");
        String  del_charge= request.getParameter("del");
         String  total= request.getParameter("total");
          try{
        Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            PreparedStatement st = con.prepareStatement("insert into invoicetab values(?,?,?,?)");
            st.setString(1,quantity);
            st.setString(2,fuel_rate);
            st.setString(3,del_charge);
            st.setString(4,total);
            
            st.executeUpdate();
           // System.out.println("Record inserted");
           //response.sendRedirect("confirmation.jsp");
    }catch(Exception ex){}
    
  }
%>

<%
  response.addHeader("Pragma","no-Cache");
    response.setHeader("Pragma","no-Cache");
     response.addHeader("Cache-Control","no-Store");
      String value = (String)session.getAttribute("CALL");
      if(session==null)
      {
          response.sendRedirect("home.jsp");
      }
       if(value==null)
      {
          response.sendRedirect("home.jsp");
      }
 %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />

		

		<!-- Favicon -->
		<link rel="icon" href="./images/favicon.png" type="image/x-icon" />

		<!-- Invoice styling -->
		<style>
			body {
				font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
				text-align: center;
				color: #777;
			}

			body h1 {
				font-weight: 300;
				margin-bottom: 0px;
				padding-bottom: 0px;
				color: #000;
			}

			body h3 {
				font-weight: 300;
				margin-top: 10px;
				margin-bottom: 20px;
				font-style: italic;
				color: #555;
			}

			body a {
				color: #06f;
			}

			.invoice-box {
				max-width: 800px;
				margin: auto;
				padding: 30px;
				border: 1px solid #eee;
				box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
				font-size: 16px;
				line-height: 24px;
				font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
				color: #555;
			}

			.invoice-box table {
				width: 100%;
				line-height: inherit;
				text-align: left;
				border-collapse: collapse;
			}

			.invoice-box table td {
				padding: 5px;
				vertical-align: top;
			}

			.invoice-box table tr td:nth-child(2) {
				text-align: right;
			}

			.invoice-box table tr.top table td {
				padding-bottom: 20px;
			}

			.invoice-box table tr.top table td.title {
				font-size: 45px;
				line-height: 45px;
				color: #333;
			}

			.invoice-box table tr.information table td {
				padding-bottom: 40px;
			}

			.invoice-box table tr.heading td {
				background: #eee;
				border-bottom: 1px solid #ddd;
				font-weight: bold;
			}

			.invoice-box table tr.details td {
				padding-bottom: 20px;
			}

			.invoice-box table tr.item td {
				border-bottom: 1px solid #eee;
			}

			.invoice-box table tr.item.last td {
				border-bottom: none;
			}

			.invoice-box table tr.total td:nth-child(2) {
				border-top: 2px solid #eee;
				font-weight: bold;
			}

			@media only screen and (max-width: 600px) {
				.invoice-box table tr.top table td {
					width: 100%;
					display: block;
					text-align: center;
				}

				.invoice-box table tr.information table td {
					width: 100%;
					display: block;
					text-align: center;
				}
			}
		</style>
	</head>

	<body>
		
            
		<div class="invoice-box">
			<table>
                            <h1>Order Invoice</h1>
				<tr class="top">
					<td colspan="2">
						<table>
							<tr>
								<td class="title">
									<img src="logo.png"  style="width: 50%; max-width: 150px" />
								</td>
                                                        <br>
                                                        <br>
								<td>
									Order date and time:<input type="text" readonly id="dt" value="<%=request.getParameter("datetime")%>">
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr class="information">
					<td colspan="2">
						<table>
							<tr>
								<td>
									Refuel Now<br />
							
					                              Indore(MP)
								</td>

								<td>
									Fuel Delivery at your doorstep<br />
									Email us at:<br />
									arihantjainapr@gmail.com
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr class="heading">
					<td>Payment Method</td>

					
				</tr>

				<tr class="details">
					<td>Cash on delivery</td>

					
				</tr>

				<tr class="heading">
					<td>Description</td>

					<td>Price</td>
				</tr>

				<tr class="item">
					<td>Quantity</td>

					<td><input type="text" readonly id="q1" name="quantity" value="<%=request.getParameter("quantity")%>"></td>
				</tr>

				<tr class="item">
					<td>Fuel-rate</td>

					<td>Rs.<input type="text" readonly id="f1" name="fuel" value="100"></td>
				</tr>

				<tr class="item last">
					<td>Delivery charge</td>

                                        <td>Rs.<input id="del" name="del" readonly value="30"></td>
				</tr>

				<tr class="total">
					<td></td>

					<td>Total:Rs.<input type="text" name="total" readonly id="total"> </td>
				</tr>
                                
			           <script>
            let quantity = document.getElementById("q1").value;
            let fuel = document.getElementById("f1").value;
            let del = parseInt(document.getElementById("del").value);
            let total = (quantity*fuel)+del;
            console.log(total);
            document.getElementById("total").value=total;
           
        </script>
                        </table>
		</div>
                                                             
                                <input type="submit" value="Click here to confirm"  name="btn" onclick="location.href='confirmation.jsp';" style="background-color: black;font-size: 16px; display: inline-block;color: white; size:">
                                
	</body>
</html>


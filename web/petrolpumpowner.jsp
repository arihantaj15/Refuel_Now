<%@include file = "security.jsp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>

<%
  
   ArrayList list1=new ArrayList();
   ArrayList list2=new ArrayList();
   ArrayList list3=new ArrayList();
   ArrayList list4=new ArrayList();
   ArrayList list5=new ArrayList();
   
   Class.forName("com.mysql.jdbc.Driver");
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
   PreparedStatement st = con.prepareStatement("select * from ordertab");
   ResultSet rs=st.executeQuery();
   
while(rs.next())
{
    list1.add(rs.getString(1));
    list2.add(rs.getString(2));
    list3.add(rs.getString(3));
    list4.add(rs.getString(4));
    list5.add(rs.getString(5));
}
   
   
%>
<html>
    <body>
<style>
    body{
        background-image: url("petrol4.jpg");
    }
    .tdtheme{
        /*background-color: #ff8080;*/
        width: 15%;
        font-weight: bold;
        font-family: arial;
        /*border-radius: 30px;*/
    }
    .tdtheme:hover{
        
        width:15%;
        /*border-radius: 30px;*/
    }
    
    a{
       color:black;
       text-decoration: none;
    }
    h1{
        text-align: center;
        font-family:sans-serif;
        font-size: 30px;
    }
</style>
<h1>Orders Pending</h1>
<div style="width:45%;height: 60px;color: black;padding-left: 820px" >
     <table border=0 width="90%" style="height: 60px;color: black;margin-left:300px;font-family: serif;">
                <tr align="center">
                   
                    <td class="tdtheme"><a href='destroysession.jsp'>Logout</a></td>
                </tr>
     </table>
</div>
    
<div style="width:100%;height:600px">
    <br>
    <%
        for(int i=0;i<list1.size();i++)
        {
    %>
   
    <div style="border:inset;width:80%;height:100px;border:inset;background-color: black;margin-left: 150px;background:rgba(255,255,255,0.8) ">
        <table width="90%" align="center" cellpadding="5" cellspacing="5" >
            
            <tr align="center" bgcolor="white" style="font-weight:bold">
                <td>Address</td>
                <td>Pin-code</td>
                <td>Date and Time</td>
                <td>Contact</td>
                <td>Quantity</td>
            </tr>
            <tr align="center">
                <td style="color:black"><%=list1.get(i)%></td>
                <td style="color:black"><%=list2.get(i)%></td>
                <td style="color:black"><%=list3.get(i)%></td>
                <td style="color:black"><%=list4.get(i)%></td>
                <td style="color:black"><%=list5.get(i)%></td>
            </tr>
        </table>
    </div>
    
            <br><br>
            <%
                }
            %>
   
<!--<div style="border:inset;width:16%;height:400px;background-color:white;margin-left:83%;margin-top:-430px">-->
                
</div>           
            
</div>
</body>
</html>
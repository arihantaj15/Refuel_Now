<%--<%@include file = "security.jsp"%>--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<%
 try{
    String button = request.getParameter("btn");
    if(button !=null && button.equals("Login") )
  {
      
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String type= request.getParameter("type");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
    if(type.equals("User"))
    {
    
    PreparedStatement st = con.prepareStatement("select * from usertab where id=? and password=?");
    st.setString(1,id);
    st.setString(2,password);
    ResultSet rs = st.executeQuery();
    if(rs.next())
    {
        session.setAttribute("CALL",id);
        response.sendRedirect("menu.jsp");
      
    }
    else
    {
         out.println ("<script>alert('Invalid id/password');</script>");
//        out.println("Invalid id/password");
    }
  }
     if(type.equals("Petrol pump owner"))
    {    
        
    PreparedStatement st= con.prepareStatement("select * from ownertab where id=? and password=?");
    st.setString(1,id);
    st.setString(2,password);
    ResultSet rs = st.executeQuery();
      if(rs.next())
      {
        session.setAttribute("CALL",id);
        response.sendRedirect("petrolpumpowner.jsp");
        
      }
      else
      {
        out.println("Invalid id/password");
          
      }
   }
  }
 }catch(Exception ex){}
  %>


<html>

   <style>
body {
  background-image: url('petrol4.jpg');
   background-repeat: no-repeat;
   background-size:cover;
   width: 100%;
   background-position: center;
  
}


    .tdtheme{
        /*background-color: #ff8080;*/
        width: 15%;
        font-size:20px;
        font-family: serif;
        /*border-radius: 30px;*/
    }
    .tdtheme:hover{
        /*color:white;*/
        width:15%;
        box-shadow: 0 0 40px black;
        /*border-radius: 30px;*/
    }
   
    p{
        text-align: left;
        font-style:normal;
        margin-left: 110px;
        /*margin-right: 55px;*/
        font-size: 30px;
       color:white;
         font-family: serif;
    }
     a{
            color:black;
        }
     p1{
                text-align: left;
                font-size: 40px;
                font-style:normal;
                margin-left: 80px;
                font-family: sans-serif;
        }
          
        
.button {
  border: none;
  color: white;
  padding: 8px 15px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}

.button1 {
  background-color: #4CAF50; 
  color: black; 
  /*border: 2px solid #4CAF50;*/
}

.button1:hover {
  background-color: #4CAF50;
  color: white;
}

          a{
              color: black;
              text-decoration: none;
          }
          
          .theme{
            color:white;  
          }
        
    
</style>
<!--<script>
    function myf()
    {
        if()
    }
</script>-->
<div style="width: 45%;height: 60px;color: black;padding-left: 820px" >
<table border=0 width="90%" style="border-radius:30px;height: 60px;color: black;font-family: serif;">
    <tr align="center">
        <td class="tdtheme"><a href="home.jsp">Home</a></td>
        <td class="tdtheme">About</td>
        <td class="tdtheme">Contact</td>
        <td class="tdtheme"><a href='login.jsp'>Login</a></td>
  
      
    </tr>
</table>
</div>
<br>
<br>
<br>
<br>
<br>

<br>
<p1>WE DELIVER THE<br></p1>
<p1>FUEL AT YOUR <br></p1>
<p1> DOORSTEP</p1>

<div style="border:inset;width:300px;height:350px;background-color:black;margin-left:940px;margin-top: -100px;opacity:0.9 ">
    <form action ="" method="post">
      <table align="center" border="0" cellspacing="2.5" cellpadding="3">
             <p>Login</p>
        
           <label style="font-size: 18px;margin-left: 40px;color:white">Login as:</label>
  <select name="type" id="type">
    <option>User</option>
    <option>Petrol pump owner</option>
    
  </select>
           <br>
       
       <tr align='center'>
           <td class="theme">ID</td>
       </tr>
       
      
      
      <tr align ="center">
          <td>
              <input type ="text" placeholder ="enter id here" name="id" required style="width:200px; height:30px; border-radius: 4px ">
          </td>
      </tr>  
      
      <tr align="center">
          <td class="theme">Password</td>
      </tr>
      
      <tr align ="center">
          <td>
              <input type ="password" placeholder ="enter password here" id="myInput" name="password" required style="width:200px; height:30px; border-radius: 4px">
              
          </td>
          
      </tr>  
      <tr align="center">
          <td>
              <label style="color:white">show password</label>
              <input type="checkbox" onclick="myFunction()">
          </td>
      </tr>
      <script>
          function myFunction() {
  var x = document.getElementById("myInput");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
      </script>
      <tr align="center">
          <td>
              <!--<input type="submit" value="Login" name="btn" style="width:80px; height:30px ;border-radius: 30px;background-color: #39e600;color: white ">-->
              <button class="button button1" type="submit" value="Login" name="btn">Login</button>        
          </td>
      </tr>
      
       <tr align="center">
           <td><a href="register.jsp" style="color:white">Don't have an account!Register here</a></td>
      </tr>
      
      </table>
  </form>
</div>
    
</body>
</html>
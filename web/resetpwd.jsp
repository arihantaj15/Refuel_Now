<%@include file = "security.jsp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<%
    String id=request.getParameter("uid");
    String oldPassword=request.getParameter("oldPwd");
    String newPassword=request.getParameter("newPwd");
    String cNewPassword=request.getParameter("confirmNewPwd");
     Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
    PreparedStatement st = con.prepareStatement("select * from usertab where id=? and password=?");
    st.setString(1,id);
    st.setString(2,oldPassword);
    ResultSet rs = st.executeQuery();
    if(rs.next())
    {
        if(newPassword.equals(cNewPassword))
        {
            PreparedStatement st1 = con.prepareStatement("update usertab set password = ? where id=?");
            st1.setString(1, newPassword);
            st1.setString(2,id);
            st1.executeUpdate();
            response.sendRedirect("home.jsp");
        }
       else
    {
        out.println("new password and confirm new password doesn't match");
    }
}
    else
    {
        out.println("invalid id/old password");
    }
    
        %>
<style>
    body {
  background-image: url('petrol.png');
   background-repeat: no-repeat;
   background-color: black;
   width: 100%;
   background-position: left;
  
}


     .tdtheme{
                /*background-color: #ff8080;*/
                width: 15%;
                font-weight: bold;
                font-family: arial;
                color: white;
                /*margin-right: 100px;*/
                /*border-radius: 30px;*/
            }
     .tdtheme:hover{
                /*background-color:#cccccc;*/
                width:15%;
                /*border-radius: 30px;*/
            }
       
       a{
                color:white;
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

.theme{
            color:white;  
            
          }
          a{
              text-decoration: none;
          }

</style>

<div style="width: 45%;height: 60px;color: black;padding-left: 820px" >
    <table  width="90%" style="border-radius:30px;height: 60px;color: white;font-family: serif;margin-left:300px">
    <tr align="center">
    <!--<td class="tdtheme">Home</td>-->
    <!--<td class="tdtheme">About</td>-->
    <!--<td class="tdtheme"><a href='PasswordSet.jsp'>Edit Password</a></td>-->
    <!--<td class="tdtheme"><a href='mailto:glance.aanchaljaindec@gmail.com'>Complain Here</a></td>-->
    <td class="tdtheme"><a href='destroysession.jsp'>Logout</a></td>
    
    </tr>
    </table>
</div>

<div style="border:inset;width:400px;height:425px;background-color:black;margin-left:900px;
     margin-top: 80px;opacity:1 ">
  <form action ="">
      <table align="center" border="0" cellspacing="3" cellpadding="4">
           
          <p>Reset Password</p>
          
           
       
       <tr align='center'>
           <td class="theme">ID</td>
       </tr>
       
      
     
      <tr align ="center">
          <td>
              <input type ="text" placeholder ="enter id here" name="uid" 
                     style="width:250px; height:30px; border-radius: 4px">
          </td>
      </tr>  
      
      <tr align="center">
          <td class="theme">Old Password</td>
      </tr>
      
      <tr align ="center">
          <td>
              <input type ="password" placeholder ="enter old password here" name="oldPwd" 
                     style="width:250px; height:30px; border-radius: 4px">
          </td>
      </tr>  
      
      <tr align="center">
          <td class="theme">New Password</td>
      </tr>
      
      <tr align ="center">
          <td>
              <input type ="password" placeholder ="enter new password here" name="newPwd" 
                     style="width:250px; height:30px; border-radius: 4px">
          </td>
      </tr>  
      
       <tr align="center">
          <td class="theme">Confirm New Password</td>
      </tr>
      
      <tr align ="center">
          <td>
              <input type ="password" placeholder ="enter confirm password here" name="confirmNewPwd" 
                     style="width:250px; height:30px; border-radius: 4px">
          </td>
      
      </tr>  
      
      <tr align="center">
          <td>
              <button class="button button1" type="submit" value="Change" name="btn1">Change</button>
              <button class="button button1" type="reset" value="Clear" name="btn1">Clear</button>        
          </td>
      </tr>
      
      </table>
  </form>
</div>
        

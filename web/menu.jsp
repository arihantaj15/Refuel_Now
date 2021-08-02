
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
           response.sendRedirect("invoice1.jsp");
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
 
<html>
    <body>

        <style>
            body {
              background-image: url('petrol.png');
              background-repeat: no-repeat;
              /*background-color: black;*/
              width: 100%;
              background-position: left;
  
            }

        
            .tdtheme{
                /*background-color: #ff8080;*/
                width: 15%;
                font-size:20px;
                font-family: serif;
                /*text-color:white;
                font-weight: bold;
                color:white;
                /*border-radius: 30px;*/
            }
            
            .tdtheme:hover{
                
                width:15%;
                /*border-radius: 30px;*/
            }
           
            p{
                text-align: left;
                font-size: 40px;
                font-style:normal;
                margin-left: 70px;
                font-family: sans-serif;
            }
             
            a{
                 color:white;
                 text-decoration:none;
               }
                    
            p1{
                text-align: center;
                margin-left: 550px;
                bottom:10px;
                font-size: 30px;
                font-style:normal;
                bottom:0px;
                font-family:garamond;
                font-weight: bold;
            }
            
            p2{
                text-align: center;
                /*font-weight: bold;*/
                bottom:10px;
                font-size: 20px;
                font-style:normal;
                bottom:0px;
                font-family:helvetica;
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

  input[type=text]:focus {
  border: 3px solid #555;
}              
            
        
                
        </style>

<!--        <div style="width: 45%;height: 60px;padding-left: 850px" >
            <table  width="90%" style="border-radius:30px;height: 60px;color: white;font-family: serif;">
                <tr align="center" >
                     <td class="tdtheme"><a href="resetpwd.jsp">Reset Password</a></td>
                     <td class="tdtheme"><a href='destroysession.jsp'>Logout</a></td>
              
                </tr>
            </table>
        </div>-->
        

        <!--<p>WE DELIVER THE<br> FUEL AT YOUR<br> DOORSTEP</p>-->
        
        <div style="border:inset;width:400px;height:650px;background-color:black;margin-left: 900px ;opacity:0.9 ">
            <form action ="invoice1.jsp" method="GET">
      <table align="center" border="0" cellspacing="7" cellpadding="7">
          
           <tr align='center' style="color:white;font-size: 25px">
                  <td>Order Details</td>
              </tr>
          
       
        <br>
        <br>
             <tr align='center' style="color:white">
                  <td>Address</td>
              </tr>
      
      
      <tr align ="center" >
          <td>
              <input type ="text" placeholder ="enter address here" name="add" required style="width:250px; height:50px; border-radius: 4px">
          </td>
      </tr>  
        <tr align='center' style="color:white">
                  <td>Pin-code</td>
              </tr>
      
      
      <tr align ="center">
          <td>
              <input type ="text" placeholder ="enter pincode here" pattern="[0-9]{6}" title="must be a 6-digit number" name="code" required style="width:200px; height:30px; border-radius: 4px">
          </td>
      </tr>  
      
<!--      <tr align="center" style="color:white">
          <td>City</td>
      </tr>
      <br>
      <tr align ="center">
          <td>
              <input type ="text" placeholder ="enter city name here" name="city" required style="width:200px; height:30px; border-radius: 4px">
          </td>
      </tr>  -->
       <tr align='center' style="color:white">
                  <td>Contact</td>
              </tr>
     


      <tr align ="center" >
          <td>
              <input type ="text"  placeholder ="enter number here" name="con" pattern="[0-9]{10}" title="Must be a 10-digit mobile number" required style="width:200px; height:30px; border-radius: 4px">
          </td>
      </tr>
      <tr align="center" style="color:white">
          <td>Date and time</td>
      </tr>
      <br>
        <tr align ="center" >
          <td>
              <input type ="datetime-local" placeholder ="enter date here" name="datetime" required style="width:200px; height:30px; border-radius: 4px">
          </td>
      </tr>  
<!--      <tr align="center">
          <td>Register as:</td>
      <select name="type" style="width:200px;height:30px;border-radius:30px;background-color: lightblue;color:black " >
          <option>Select type</option>
          <option>Petrol pump owner</option>
          <option>User</option>
      </select>
      </tr>-->
       <tr align="center" style="color:white">
          <td>Quantity of petrol needed:</td>
      </tr>
      <br>
      <tr align ="center">
          <td>
              <input type ="number" min="3" placeholder ="enter quantity here" name="quantity" required style="width:200px; height:30px; border-radius: 4px">
          </td>
      </tr>  
      
      <tr align="center">
          <td>
              <button class="button button1" type="submit" value="submit" name="btn">Submit</button>      
              <!--<input type="submit" value="Register" name="btn" style="width:80px; height:30px ;border-radius: 30px;background-color: #39e600;color: white ">-->
          </td>
      </tr>
      </table>
  </form>        </div>
    </td>
    </tr>
    </table>
  
        <div>
            <!--<p1>A MOVE FORWARD IN A SIMPLEST WAY<br></p1>-->
            <br>
            <!--<p2><marquee scrollamount="10" direction="left">Buying petrol,diesel? So now get delivered it at your doorstep, Refuel Now is an easiest way to have fuel at your place.</marquee></p2>-->
        
        </div>

    </body>
</html>

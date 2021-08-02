
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<%
        try {
            String button = request.getParameter("btn");
            String id = request.getParameter("id1");
            String fullName = request.getParameter("fnm");

            String password = request.getParameter("password");
//    //session.setAttribute("email",id);
            String type = request.getParameter("type");

            if (button != null && button.equals("Register")) {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");

                String sql = "select * from usertab where id='" + id + "' ";
                PreparedStatement stmt = con.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();
                if (rs.next() == true) {
                    out.println("<script>alert('User already exists');</script>");

                } else {

//    if(type.equals("User"))
//    {
//        Class.forName("com.mysql.jdbc.Driver");
//            Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
////            PreparedStatement st = con.prepareStatement("insert into usertab values(?,?,?)");
//            st.setString(1,fullName);
//            st.setString(2,id);
//            st.setString(3,password);
//            st.executeUpdate();
                    //HttpSession session1 = request.getSession();

                    session.setAttribute("name", fullName);
                    session.setAttribute("email", id);
                    session.setAttribute("password", password);
                    session.setAttribute("type", type);
                    response.sendRedirect("UserVerify");
                }
//    else
//    {
//        
//    
//    
//        
//            Class.forName("com.mysql.jdbc.Driver");
//            Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
//            PreparedStatement st = con.prepareStatement("insert into ownertab values(?,?,?)");
//            st.setString(1,fullName);
//            st.setString(2,id);
//            st.setString(3,password);
//            st.executeUpdate();
//            response.sendRedirect("login.jsp");
//    
//    }
//    
            }
        }
    
    catch(Exception ex

    
    
){}
     
    
    
%>


<html>
    
    
    <body>

        <style>
            body {
                background-image: url('petrol4.jpg');
                background-repeat: no-repeat;
                background-size:cover;
                width: 100%;
                background-position: center;

            }

        </style>  
        <style>
            .tdtheme{
                /*background-color: #ff8080;*/
                width: 15%;
                font-size: 20px;
                font-family: serif;
                /*border-radius: 30px;*/
            }
            .tdtheme:hover{
                /*color:white;*/
                width:15%;
                box-shadow: 0 0 40px black;
                /*border-radius: 30px;*/
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
                background-color:#4CAF50;
                color: white;
            }

            p1{
                margin-left: 100px;
                font-size: 25px;
                color:white;
            }

            a{
                color:black;
                text-decoration: none;
            }
            p{
                text-align: left;
                font-size: 40px;
                font-style:normal;
                margin-left: 80px;
                font-family: sans-serif;


            }




        </style>

        <div style="width: 45%;height: 60px;color: black;padding-left: 820px" >
            <table border=0 width="90%" style="border-radius:30px;height:100px;color: black;font-family: serif;">
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
        <p>WE DELIVER THE<br>FUEL AT YOUR<br>DOORSTEP</p>
           
<!--   <script type="text/javascript">
      function onSignIn(googleUser) {
       
      var profile = googleUser.getBasicProfile();
      var imagurl=profile.getImageUrl();
      var name=profile.getName();
      var email=profile.getEmail();
      //document.getElementById("myImg").src = imagurl;
      //document.getElementById("name").innerHTML = name;
      //document.getElementById("myP").style.visibility = "hidden";
        console.log(imagurl);
        console.log(name);
        console.log(email);
//        document.getElementById("status").innerHTML = 'Welcome '+name+'!<a href=menu.jsp?email='+email+'&name='+name+'/>Continue with Google login</a></p>'
         if (window.confirm('If you click "ok" you would be redirected . Cancel will load this website ')) 
{
window.location.href='menu.jsp';
};
//      window.location.href='menu.jsp';  
    }
   </script>
   <button onclick="myFunction()">Sign Out</button>
   <script>
      function myFunction() {
      gapi.auth2.getAuthInstance().disconnect();
      location.reload();
   }
   </script>-->


        <div style="border:inset;width:300px;height:500px;background-color: black;margin-left:1000px;margin-top: -250px;margin-bottom: 200px;opacity:0.9 ">
            <form action ="" method="POST">
                <table align="center" border="0" cellspacing="7" cellpadding="7">
                    <br>

                    <p1>Sign Up</p1>

                    <br>
                    <br>
                    <tr align='center' style="color:white">
                        <td>Full Name</td>
                    </tr>


                    <tr align ="center" >
                        <td>
                            <input type ="text" placeholder ="enter name here" required name="fnm" style="width:200px; height:30px; border-radius: 4px">
                        </td>
                    </tr>  
                    <tr align='center' style="color:white">
                        <td>ID</td>
                    </tr>


                    <tr align ="center">
                        <td>
                            <input type ="text" placeholder ="enter id here" name="id1" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="must be in the following order: characters@characters.domain" required style="width:200px; height:30px; border-radius: 4px">
                        </td>
                    </tr>  

                    <tr align="center" style="color:white">
                        <td>Password</td>
                    </tr>
                    <br>
                    <tr align ="center">
                        <td>
                            <input type ="password" placeholder ="enter password here" id="myInput" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required style="width:200px; height:30px; border-radius: 4px">
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
                    <label style="font-size: 18px;margin-left: 40px;color:white">Register as:</label>
                    <select name="type" id="type">
                        <option>User</option>
                        <option>Petrol pump owner</option>

                    </select>

                    <!--      <tr align="center">
                              <td>
                                  <button class="button button1" type="submit" value="Verify" name="btn">Verify your email</button>      
                                  <input type="submit" value="Register" name="btn" style="width:80px; height:30px ;border-radius: 30px;background-color: #39e600;color: white ">
                              </td>
                          </tr>-->
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
                            <button class="button button1" type="submit" value="Register" name="btn" >Register</button>      
                            <!--<input type="submit" value="Register" name="btn" style="width:80px; height:30px ;border-radius: 30px;background-color: #39e600;color: white ">-->
                        </td>
                    </tr>
<!--                    <tr align="center">
                        <td>
                            <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="590779205854-odc9jf59f598srmh1kaoegakonj7smjf.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <div class="g-signin2" data-onsuccess="onSignIn" id="myP"></div>
      <img id="myImg"><br>
      <p id="name"></p>
      <div id="status">
   </div>
                        </td>
                    </tr>-->
                </table>
        </div>
      

            </form>
    </td>
</tr>
</table>


</body>
</html>




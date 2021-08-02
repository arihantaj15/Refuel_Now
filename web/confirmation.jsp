<%--<%@include file="security.jsp" %>--%>
<html>
    <body>
        <style>
            p{
                text-align: center;
                font-family: serif;
                font-size: 50px;
                margin-top: 100px;
            }
            
            .tdtheme{
                
                width: 15%;
                font-size:20px;
                font-family: serif;
                
            }
            
            .tdtheme:hover{
                
                width:15%;
                
            }
            a{
                text-decoration: none;
                color: black;
            }
        </style>
          <div style="width: 45%;height: 60px;padding-left: 850px" >
            <table  width="90%" style="border-radius:30px;height: 60px;color: white;font-family: serif;">
                <tr align="center" >
                     <td class="tdtheme"><a href="resetpwd.jsp">Reset Password</a></td>
                     <td class="tdtheme"><a href="mailto:jain.ari15@gmail.com">Complain</a></td>
                     <td class="tdtheme"><a href="mailto:jain.ari15@gmail.com">Feedback</a></td>
        <td class="tdtheme"><a href='destroysession.jsp'>Logout</a></td>
              
                </tr>
            </table>
        </div>
      
       
        <p>Thank you for your order.<br>Our operator will contact you soon.</p>
        <marquee behavior="scroll" direction="right" scrollamount="40">
         <img src="petrol5.jpg" float="center" width="300" height="222">
        </marquee>
    </body>
</html>
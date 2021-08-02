 package newpackage;



import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserVerify extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            //User user= (User) session.getAttribute("authcode");
            //Object name = session.getAttribute("name");
           // String code = request.getParameter("authcode");
            //System.out.println(name);
            String name = (String)session.getAttribute("name");
            String email = (String)session.getAttribute("email");
            String password = (String)session.getAttribute("password");
            String type = (String)session.getAttribute("type");
            //feth form value
//           String name = request.getParameter("fnm");
//           String email = request.getParameter("id1");
//           String password = request.getParameter("password");
//    //session.setAttribute("email",id);
//    String type= request.getParameter("type");
           //session.setAttribute("email",id);
//           String password = request.getParameter("password");
//           out.println(name);
//           out.println(email);          
//           out.println(password);
      		//create instance object of the SendEmail Class
           SendEmail sm = new SendEmail();
      		//get the 6-digit code
           String code = sm.getRandom();
           
      		//craete new user using all information
           User user = new User(name,email,code);
           
           //call the send email method
           boolean test = sm.sendEmail(user);
           
      		//check if the email send successfully
           if(test){
            // HttpSession session  = request.getSession();
               session.setAttribute("authcode", user);
               session.setAttribute("name" , name);
               session.setAttribute("email" , email);
               session.setAttribute("password" ,password);
               session.setAttribute("type" , type);
               
               response.sendRedirect("verify.jsp");
           }else{
      		  out.println("Failed to send verification email");
      	   }
           
        }
    }

     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
  

}

package newpackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class VerifyCode extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            HttpSession session = request.getSession();
            User user= (User) session.getAttribute("authcode");
            //Object name = session.getAttribute("name");
            String code = request.getParameter("authcode");
            //System.out.println(name);
            String name = (String)session.getAttribute("name");
            String email = (String)session.getAttribute("email");
            String password = (String)session.getAttribute("password");
            String type = (String)session.getAttribute("type");
            if(code.equals(user.getCode())){
                //out.println("Verification Done");
                try{
                if(type.equals("User"))
    {
        Class.forName("com.mysql.jdbc.Driver");
            Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            PreparedStatement st = con1.prepareStatement("insert into usertab values(?,?,?)");
            st.setString(1,name);
            st.setString(2,email);
            st.setString(3,password);
            st.executeUpdate();
            response.sendRedirect("login.jsp");
    }
    else
    {
        
    
    
        
            Class.forName("com.mysql.jdbc.Driver");
            Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            PreparedStatement st = con1.prepareStatement("insert into ownertab values(?,?,?)");
            st.setString(1,name);
            st.setString(2,email);
            st.setString(3,password);
            st.executeUpdate();
            response.sendRedirect("login.jsp");
    
    }
    
    }
                catch(Exception ex){}
               // response.sendRedirect("login.jsp");
            }else{
                out.println("Incorrect verification code");
            }
            
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}

    
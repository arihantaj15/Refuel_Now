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

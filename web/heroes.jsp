<%-- 
    Document   : heroes
    Created on : 14.04.2016, 6:46:58
    Author     : Алексей
--%>

<%@page import="heroesbd.Entity.Universes"%>
<%@page import="java.util.List"%>
<%@page import="heroesbd.Entity.Heroes"%>
<%@page import="heroesbd.DAO.UniversesDAO"%>
<%@page import="heroesbd.DAO.HeroicAbilitiesDAO"%>
<%@page import="heroesbd.DAO.HeroesDAO"%>
<%@page import="heroesbd.DAO.AbilitiesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%!
    private AbilitiesDAO abdao = new AbilitiesDAO();
    private HeroesDAO hdao = new HeroesDAO();
    private HeroicAbilitiesDAO habdao = new HeroicAbilitiesDAO();
    private UniversesDAO undao = new UniversesDAO();
%>

<%
   //удаление
   String delId = request.getParameter("delId");
   if(delId != null)
   {
       Heroes deleteHeroes = hdao.getById(Integer.parseInt(delId));
       try {
           hdao.delete(deleteHeroes);
       } catch (Exception e) {
           System.err.print(e);
       }
       
       response.sendRedirect("");   //отправленный запрос обрабатывается браузером
       return;
   }
%>

<%
    //получение сссылки на редактируемый объект
    Heroes heroes = null;
    String idStr = request.getParameter("editid");
    
    if(idStr != null){
        try {
            int id = Integer.parseInt(idStr);
            heroes = hdao.getById(id);
        } catch (Exception e){
            System.err.print(e);
        }
    }

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="=text/html; charset = UTF-8">
        <title>Heroes among us</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <h1>Heroes</h1>
        <h2><%
            if(heroes != null)
                out.write("Change Hero");
            else
                out.write("Creation Hero");
            %>
        </h2>
        
        <p>
            <% boolean isOk = true;
               //сохранение героя при подтверждении формы
               if(request.getParameter("save") != null)
               {
                   if (heroes == null)
                       heroes = new Heroes();
                   
                   String param;
                   
                   param = request.getParameter("age");
                   if (!param.isEmpty()){
                       heroes.setAge(Short.parseShort(param));
                   }
                   
                   param = request.getParameter("name");
                   if (!param.isEmpty()){
                       heroes.setName(new String(request.getParameter("name").getBytes("iso-8859-1"),"UTF-8"));
                   } else {
                       heroes.setName("");
                       out.write("<p class = 'err'>Is not given a name</p>");
                       isOk = false;
                   }
                   
                   param = request.getParameter("gender");
                   if (!param.isEmpty()){
                       heroes.setGender(new String(request.getParameter("gender").getBytes("iso-8859-1"),"UTF-8"));
                   } else {
                       heroes.setGender("");
                       out.write("<p class = 'err'>Is not given a gender</p>");
                       isOk = false;
                   }
                   
                   param = request.getParameter("body_type");
                   if (!param.isEmpty()){
                       heroes.setBodyType(new String(request.getParameter("body_type").getBytes("iso-8859-1"),"UTF-8"));
                   } else {
                       heroes.setBodyType("");
                       out.write("<p class = 'err'>Is not given a body_type</p>");
                       isOk = false;
                   }
                   
                   param = request.getParameter("location");
                   if (!param.isEmpty()){
                       heroes.setLocation(new String(request.getParameter("location").getBytes("iso-8859-1"),"UTF-8"));
                   } else {
                       heroes.setLocation("");
                       out.write("<p class = 'err'>Is not given a location</p>");
                       isOk = false;
                   }
                   
                   param = request.getParameter("idUniverse");
                   if (!param.isEmpty()){
                       heroes.setIdUniverse(undao.getById(Integer.parseInt(param)));
                   }
                   
                   if(isOk) {
                       hdao.save(heroes);
                       out.write("<p class = 'msg'>Saved</p>");
                   }
                   
                }
               
               %>
        </p> 
        
        <form method = "post">
            Age hero<br>
            <input type="number" name="age" value="<%=(heroes != null) ? heroes.getAge(): ""%>"/><br>
            
            Name hero<br>
            <input type="text" name="name" value="<%=(heroes != null) ? heroes.getName() : ""%>"/><br>
            
            Gender hero<br>
            <input type="text" name="gender" value="<%=(heroes != null) ? heroes.getGender(): ""%>"/><br>
            
            Body_type hero<br>
            <input type="text" name="body_type" value="<%=(heroes != null) ? heroes.getBodyType(): ""%>"/><br>
            
            Location hero<br>
            <input type="text" name="location" value="<%=(heroes != null) ? heroes.getLocation(): ""%>"/><br>
            
            Universe hero<br>
            <select name="id_universe">
                <%
                    List<Universes> un = undao.findAll();
                    for(Universes u: un)
                    {
                        out.write("<option ");
                        if (heroes != null && heroes.getIdUniverse() == u)
                        {
                            out.write("selected ");
                        }
                        
                        out.write("value =" + u.getIdUniverse() + ">" + u.getTitle() + " " + u.getType() + "\n");
                    }
                %>
            </select><br>
            
             <input type="submit" value="Save" name="save" />
             
        </form>
            <div class="foot">
                <a class="home" href ="heroeslist.jsp">Back to the list of heroes</a>
            </div>
        </body>
</html>

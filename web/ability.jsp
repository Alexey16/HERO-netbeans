<%-- 
    Document   : ability
    Created on : 14.04.2016, 12:26:05
    Author     : Алексей
--%>

<%@page import="heroesbd.Entity.Abilities"%>
<%@page import="heroesbd.DAO.UniversesDAO"%>
<%@page import="heroesbd.DAO.HeroicAbilitiesDAO"%>
<%@page import="heroesbd.DAO.HeroesDAO"%>
<%@page import="heroesbd.DAO.AbilitiesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
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
       Abilities deleteAvility = abdao.getById(Integer.parseInt(delId));
       try {
           abdao.delete(deleteAvility);
       } catch (Exception e) {
           System.err.print(e);
       }
       
       response.sendRedirect("");   //отправленный запрос обрабатывается браузером
       return;
   }
%>

<%
    //получение сссылки на редактируемый объект
    Abilities ability = null;
    String idStr = request.getParameter("editid");
    
    if(idStr != null){
        try {
            int id = Integer.parseInt(idStr);
            ability = abdao.getById(id);
        } catch (Exception e){
            System.err.print(e);
        }
    }

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="=text/html; charset = UTF-8">
        <title>Ability Heroes</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <h1>Ability</h1>
        <h2><%
            if(ability != null)
                out.write("Change Ability");
            else
                out.write("Creation Ability");
            %>
        </h2>
        
        <p>
            <% boolean isOk = true;
               //сохранение героя при подтверждении формы
               if(request.getParameter("save") != null)
               {
                   if (ability == null)
                       ability = new Abilities();
                   
                   String param;
                   
                   param = request.getParameter("name");
                   if (!param.isEmpty()){
                       ability.setName(new String(request.getParameter("name").getBytes("iso-8859-1"),"UTF-8"));
                   } else {
                       ability.setName("");
                       out.write("<p class = 'err'>Is not given a name</p>");
                       isOk = false;
                   }
                   
                   param = request.getParameter("restrictions");
                   if (!param.isEmpty()){
                       ability.setRestrictions(new String(request.getParameter("gender").getBytes("iso-8859-1"),"UTF-8"));
                   } else {
                       ability.setRestrictions("");
                       out.write("<p class = 'err'>Is not given a restrictions</p>");
                       isOk = false;
                   } 
                   
                   if(isOk) {
                       abdao.save(ability);
                       out.write("<p class = 'msg'>Saved</p>");
                   }
                   
                }
               
               %>
        </p> 
        
        <form method = "post">
            Name ability<br>
            <input type="number" name="age" value="<%=(ability != null) ? ability.getName(): ""%>"/><br>
            
            Ability restrictions<br>
            <input type="text" name="name" value="<%=(ability != null) ? ability.getName() : ""%>"/><br>
        <br>
        
         <input type="submit" value="Save" name="save" />
         
        </form>
            <div class="foot">
                <a class="home" href ="abilities.jsp">Back to the list of abilities</a>
            </div>
        </body>
</html>

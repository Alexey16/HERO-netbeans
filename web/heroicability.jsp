<%-- 
    Document   : heroability
    Created on : 24.04.2016, 15:16:01
    Author     : Алексей
--%>

<%@page import="heroesbd.Entity.Abilities"%>
<%@page import="heroesbd.Entity.Heroes"%>
<%@page import="java.util.List"%>
<%@page import="heroesbd.Entity.HeroicAbilities"%>
<%@page import="heroesbd.DAO.AbilitiesDAO"%>
<%@page import="heroesbd.DAO.HeroesDAO"%>
<%@page import="heroesbd.DAO.HeroicAbilitiesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.sun.javafx.image.impl.IntArgb"%>

<%!
    HeroicAbilitiesDAO hadao = new HeroicAbilitiesDAO();
    HeroesDAO hdao = new HeroesDAO();
    AbilitiesDAO adao = new AbilitiesDAO();
%>

<%
   //удаление
   String delId = request.getParameter("delId");
   if(delId != null)
   {
       HeroicAbilities delHA = hadao.getById(Integer.parseInt(delId));
       try {
           hadao.delete(delHA);
       } catch (Exception e) {
           System.err.print(e);
       }
       
       response.sendRedirect("heroicabilities.jsp");
       return;
   }
%>

<%
    //получение сссылки на редактируемый объект
    HeroicAbilities habil = null;
    String idStr = request.getParameter("editId");
    
    if(idStr != null){
        try {
            int id = Integer.parseInt(idStr);
            habil = hadao.getById(id);
        } catch (Exception e){
            System.err.print(e);
        }
    }

%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Abilities of Hero</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <h1>abilities of heroes</h1>
        <h2>
            <%
                if(habil != null)
                    out.write("Change ability of hero");
                else
                    out.write("Creation Ability of Hero");
            %>
        </h2>
        
            <p>
            <% 

               if(request.getParameter("save") != null)
               {
                   if (habil == null)
                       habil = new HeroicAbilities();
                   
                   String param;
                   
                   param = request.getParameter("specific_features");
                   if (!param.isEmpty()){
                       habil.setSpecificFeatures(new String(request.getParameter("specific_features").getBytes("iso-8859-1"),"UTF-8"));
                   } else {
                       habil.setSpecificFeatures("");
                       out.write("<p class = 'err'>Is not given a location</p>");
                   }
                   
                   param = request.getParameter("id_hero");
                   if (!param.isEmpty()){
                       habil.setHeroes(hdao.getById(Integer.parseInt(param)));
                   }
                   
                   param = request.getParameter("id_ability");
                   if (!param.isEmpty()){
                       habil.setAbilities(adao.getById(Integer.parseInt(param)));
                   }
                   
                   hadao.save(habil);
                   response.sendRedirect("");
                   return;
               }
            %>
        </p>
        
        <form method = "post">
            Specific Features<br>
            <input type="text" name="specific_features" value="<%=(habil != null) ? habil.getSpecificFeatures(): ""%>"/><br>
            
            Hero<br>
            <select name="id_hero">
                <%
                    List<Heroes> hl = hdao.findAll();
                    for(Heroes h: hl)
                    {
                        out.write("<option ");
                        if (habil != null && habil.getHeroes().getIdHero()== h.getIdHero())
                        {
                            out.write("selected ");
                        }
                        
                        out.write("value =" + h.getIdHero()+ ">" + h.getName() + "\n");
                    }
                %>
            </select><br>
            
            Ability<br>
            <select name="id_ability">
                <%
                    List<Abilities> al = adao.findAll();
                    for(Abilities a: al)
                    {
                        out.write("<option ");
                        if (habil != null && habil.getAbilities().getIdAbility()== a.getIdAbility())
                        {
                            out.write("selected ");
                        }
                        
                        out.write("value =" + a.getIdAbility()+ ">" + a.getName() + "\n");
                    }
                %>
            </select><br>
            
             <input type="submit" value="Save" name="save" />
             
        </form>
            <div class="foot">
                <a class="home" href ="heroicabilities.jsp">Back to the list Abilities of Heroes</a>
            </div>
    </body>
</html>

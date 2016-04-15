<%-- 
    Document   : abilities
    Created on : 14.04.2016, 12:29:13
    Author     : Алексей
--%>

<%@page import="heroesbd.Entity.Abilities"%>
<%@page import="java.util.List"%>
<%@page import="heroesbd.DAO.AbilitiesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!
    AbilitiesDAO adao = new AbilitiesDAO();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ability of Heroes</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <h1>Abilities of Heroes</h1>
        <h2>A list of ability</h2>
        <table>
            <tr><th>Name ability</th><th>Restriction</th><th>Actions</th></tr>
            <%
                List<Abilities> al = adao.findAll();
                for (Abilities a: al){
                     out.write("<tr>");
                    out.write("<td>" + a.getName().toString() + "</td>");
                    out.write("<td>" + a.getRestrictions().toString() + "</td>");
                    out.write("<td>");
                    out.write("<a href = 'heroes.jsp?editid="+ a.getIdAbility() +"'><img class = 'action' src = 'imgs/edit.png'></a>");
                    out.write("<a href = 'heroes.jsp?delid="+ a.getIdAbility() +"'><img class = 'action' src = 'imgs/delete.png'></a>");
                    out.write("</td>");
                    out.write("</tr>");
                }
            %>
        </table>
        <div class="foot">
            <a class ="home" href = "ability.jsp">New Ability</a>
            <a class ="home" href = "heroeslist.jsp">A list of Heroes</a>  
    </body>
</html>

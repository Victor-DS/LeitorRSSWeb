<%-- 
    Document   : index
    Created on : May 12, 2016, 3:24:33 PM
    Author     : victor
--%>
<%@page import="leitor.feed.rss.lpiii.model.Publication"%>
<%@page import="leitor.feed.rss.lpiii.model.User"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="leitor.feed.rss.lpiii.model.service.RSSServiceRemote"%>
<%@page import="javax.ejb.EJB"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        final User user = new User(request.getParameter("username"), null);
        final String url = request.getParameter("feedURL");
                
        RSSServiceRemote rssRemote = (RSSServiceRemote) InitialContext.doLookup("RSSService");
        
        if(url != null)
                rssRemote.registerFeed(url, user);
        
        ArrayList<Publication> publications = rssRemote.getPublications(user);
%>
<!DOCTYPE html>
<html>
        <head>
                <title>Leitor de Feeds RSS</title>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <link rel="stylesheet" href="js/jqueryMobile/jquery.mobile-1.4.5.css">
                <link rel="stylesheet" href="css/style.css">
                <script src="js/jQuery/jquery-2.2.3.js"></script>
                <script src="js/jqueryMobile/jquery.mobile-1.4.5.js"></script>
        </head>
        <body>
                <div data-role="page" class="ui-responsive-panel">
                        <header>
                                <div data-role="header" style="overflow:hidden;">
                                        <a href="#painelLateral" data-icon="bars" class="ui-btn-left" data-iconpos="notext"></a>
                                        <h1>Leitor de Feeds RSS</h1>
                                </div>
                                
                                <div data-role="controlgroup" data-type="horizontal" style="padding: 10px;">
                                        <form action="index.jsp" method="POST">
                                                <input type="hidden" name="username" id="username" 
                                                       value="<%= user.getNome() %>" 
                                                       data-wrapper-class="controlgroup-textinput ui-btn" 
                                                       placeholder="Henry Chinaski">
                                                <input type="text" name="feedURL" id="feedURL" value="" 
                                                       data-wrapper-class="controlgroup-textinput ui-btn" 
                                                       placeholder="http://www.site.com.br/feed" >
                                                <input type="submit" value="Adicionar">
                                        </form>
                                </div>
                        </header>

                        <!-- PAINEL LATERAL -->
                        <div data-role="panel" id="painelLateral" data-display="overlay" >
                                <ul data-role="listview" data-divider-theme="a">
                                        <li data-role="list-divider" >Principal</li>
                                        <li><a href="#" data-rel="close">Início</a></li>
                                        <li><a href="#">Sobre</a></li>
                                        <li data-role="list-divider">Filtros</li>
                                        <li><a href="#">Filtro A</a></li>
                                        <li><a href="#">Filtro B</a></li>
                                </ul>
                        </div>
                        <!-- PAINEL LATERAL -->
                        
                        <div data-role="content" style="padding: 5px;">
                                <!-- Conteúdo da lista dos posts vem aqui -->   
                                <%
        
                                        for(Publication p : publications)
                                                out.println(p);
        
                                %>
                        </div>
                </div>                
        </body>
</html>

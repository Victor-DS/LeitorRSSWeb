<%-- 
    Document   : login
    Created on : 13/05/2016, 22:05:02
    Author     : 41357205
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <title>Login - Leitor de Feeds RSS</title>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <link rel="stylesheet" href="js/jqueryMobile/jquery.mobile-1.4.5.css">
                <link rel="stylesheet" href="css/style.css">
                <script src="js/jQuery/jquery-2.2.3.js"></script>
                <script src="js/jqueryMobile/jquery.mobile-1.4.5.js"></script>
                
                <script>
                    window.fbAsyncInit = function() {
                      FB.init({
                        appId      : '243333575853708', //Temporário < Mudar depois
                        xfbml      : true,
                        version    : 'v2.5'
                      });
                    };

                    (function(d, s, id){
                       var js, fjs = d.getElementsByTagName(s)[0];
                       if (d.getElementById(id)) {return;}
                       js = d.createElement(s); js.id = id;
                       js.src = "//connect.facebook.net/en_US/sdk.js";
                       fjs.parentNode.insertBefore(js, fjs);
                     }(document, 'script', 'facebook-jssdk'));
                     
                     FB.getLoginStatus(function(response) {
                        if (response.status === 'connected') {
                          console.log('Logged in.');
                        }
                        else {
                          FB.login();
                        }
                      });
                </script>
        </head>
        <body>
            <div id="fb-root"></div>
            <script>(function(d, s, id) {
              var js, fjs = d.getElementsByTagName(s)[0];
              if (d.getElementById(id)) return;
              js = d.createElement(s); js.id = id;
              js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.6&appId=243333575853708";
              fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>
            
                <div data-role="page" class="ui-responsive-panel">
                    <header>
                            <div data-role="header" style="overflow:hidden;">
                                <h1>Login</h1>
                            </div>
                    </header>
                    
                    <section>
                        <div style="vertical-align: middle;" 
                             class="fb-login-button" data-max-rows="1" 
                             data-size="xlarge" data-show-faces="false" 
                             data-auto-logout-link="false"></div>
                    </section>
                    
                </div>                
        </body>
</html>


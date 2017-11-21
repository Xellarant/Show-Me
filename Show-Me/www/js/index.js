/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
 var session;
 var app = {
    // Application Constructor
    initialize: function() {
        document.addEventListener('deviceready', this.onDeviceReady.bind(this), false);
    },

    // deviceready Event Handler
    //
    // Bind any cordova events here. Common events are:
    // 'pause', 'resume', etc.
    onDeviceReady: function() {
        this.receivedEvent('deviceready');
    },

    // Update DOM on a Received Event
    receivedEvent: function(id) {
        var parentElement = document.getElementById(id);
        var listeningElement = parentElement.querySelector('.listening');
        var receivedElement = parentElement.querySelector('.received');

        listeningElement.setAttribute('style', 'display:none;');
        receivedElement.setAttribute('style', 'display:block;');

        console.log('Received Event: ' + id);
    }
};

function logCheck() { // also handles anchor checking
    $(".title").text(document.title);
    var title = document.title.toLowerCase();
                // first change the links for login if they're already logged in.
                $("a").each(function(i, field){ //go through each anchor tag to check if we need to change them.
                    var currentHref = $(this).attr("href");
                    var title = document.title.toLowerCase();
                    // console.log("document title: " + title);
                    // console.log("currentHref: " + currentHref);
                    // console.log("href includes title? " + currentHref.includes(title));
                    // if(currentHref.toString().includes(title))
                    // {
                    //     // if this IS the home page, and we found a link to home, just remove it.
                    //     if (title.includes("home")) {
                    //         $(this).remove();
                    //     }
                    //     // otherwise, change the link to this page to be a link to home.
                    //     else if ($("#homeNav").length == 0) {
                    //         console.log("replacing " + $(this).attr("href") + "with a link to home.");
                    //         $(this).attr("href", "index.html");
                    //         $(this).text("Home");
                    //     }
                    // }
                    if (localStorage.login && localStorage.getItem("login") == "true" && $(this).attr("href") == "login.html") {
                        // if the user is logged in, and we have tags that direct them to log in, flip them to log out.
                        $(this).attr("id", "logout");
                        $(this).attr("href", "#");
                        $(this).text("Logout");
                    }
                });
                // next change the header message for logins.
                if (localStorage.login && localStorage.getItem("login") == "true")
                {
                    document.getElementById("message").innerHTML="<h1>Welcome Back!</h1>";
                    // $("#login").remove();
                }
                else
                {
                    document.getElementById("message").innerHTML="<h1>Please Login (or Sign Up)</h1>";
                    // $("#logout").remove();
                }
                $("#logout").click(function(){
                    localStorage.setItem("login", "false");
                    window.location.href = "index.html";
                });
            } // end logCheck

            /* Set the width of the side navigation to 250px */
            function openNav() {
                document.getElementById("mySidenav").style.width = "250px";
            }

            /* Set the width of the side navigation to 0 */
            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
            }

            var domainString = "http://sandbox.xellarant.com";

            app.initialize();

            $(document).ready(function()
            {    
                mainNav();    


                function mainNav() {
          // contains the code for the navigation menu(s)
          var navHead = ''
          + '<!-- Use any element to open the sidenav -->'
          + '<!-- <span onclick="openNav()">Menu</span> -->'

          + '<!-- Add all page content inside this div if you want the side nav to push page content to the right (not used if you only want the sidenav to sit on top of the page -->'
          + '<div id="main"> </div>';
          var navTail = ''
          + '<div class="bar bar-header bar-positive" style="margin-bottom:80px;">'
          + '<h2><a id="homeNav" class="button button-clear" href="index.html">Home</a></h2>'
          + '<h2><a id="signupNav" class="button button-clear" href="signup.html">Signup</a></h2>'
          + '<h2><a class="button button-clear" href="insert.html">Insert</a></h2>'
          + '<h2><a class="button button-clear" href="readjson.html">Update</a></h2>'
          + '<h2><a class="button button-clear" href="chatbot.html">Show-Me Bot</a></h2>'
          + '<!-- <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; menu</span> -->'
          + '<h1 class="title">Test Index Page</h1>'
          // + '<a id="logout" class="button button-clear" href="#">Logout</a>'
          + '<a id="login" class="button button-clear" href="login.html">Login</a>'
          + '</div>'
          + '<br/><br/><h2 class="" id="message" style="text-align: center;"></h2>';
        // Add remainder of navigation links
        $("body").prepend(navHead);
        $("#main").prepend(navTail); // important because "#main" is created when navHead prepended.
    }

    // Update document title dynamically and configure/change login messages/
    $(".title").text(document.title);
    if (localStorage.login && localStorage.getItem("login") == "true")
    {
        document.getElementById("message").innerHTML="<h1>Welcome Back!</h1>";
        //$("#login").remove();
        $("#signupNav").remove();
    }
    else
    {
        document.getElementById("message").innerHTML="<h1>Please Login (or Sign Up)</h1>";
        //$("#logout").remove();
    }
    $("#logout").click(function(){
        localStorage.setItem("login", "false");
        window.location.href = "index.html";
    });

        logCheck(); // defined outside of document.ready        

}); // closes document.ready
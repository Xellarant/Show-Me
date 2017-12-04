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
 var session = null;
 // domainString must be changed for app deployment!
 var domainString = "http://" + window.location.hostname;
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

    app.initialize();

    function headerFiles() {
        var ionicStuff = ''
        + '<script type="text/javascript" src="js/angular.js"></script>'
        + '<script type="text/javascript" src="js/geturi.js"></script>'
        + '<script type="text/javascript" src="js/ionic.js"></script>'
        + '<script type="text/javascript" src="js/ionic-angular.js"></script>'

        + '<link rel="stylesheet" type="text/css" href="css/ionic.css">'
        //+ '<link rel="stylesheet" type="text/css" href="css/index.css">'
        + '<link rel="stylesheet" type="text/css" href="css/overrides.css">'
        + '<link rel="stylesheet" type="text/css" href="css/style.css">';

        $("head").append(ionicStuff);
    }

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
          + '<h2><a id="signupNav" class="button button-clear" href="register.html">Register</a></h2>'
          + '<h2><a class="button button-clear" href="favorites.html">Favorites</a></h2>'          
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

    $(document).ready(function()
    {    
        mainNav();
        headerFiles();

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

function setCookie(cName, cValue) { // currently set to one day expiry
    var days = new Date();
    days.setTime(days.getTime() + (1 * 24*60*60*1000));
    var expires = "expires=" + days.toUTCString();
    document.cookie = cname+"="+cValue+";"+expires+";path=/";
}

function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

async function getSession() {    
    var response;
    $.ajaxSetup({cache: false});
    function getData() {
        $.get(domainString + "/php/getSession.php", function(data) {
        sessionStorage.setItem("session", JSON.parse(data));
        response = data;
    });
    }
    getData();
    return response;
    //alert(session);

    // localStorage.setItem("session", session);    
    
    // localStorage.setItem("session", session);
    //return sessionStorage.getItem("session");
} // end getSession

function getUserID() {    
    var userID = null;
    $.ajaxSetup({cache: false});
    function getData() {
        $.get(domainString + "/php/getUserID.php", function(data) {
        userID = data;
        console.log("getUserID returned: " +userID);
        });
    }
    getData();
    
    if (userID == null) {
        console.log("error grabbing user ID!");
    }
    else {
        
        localStorage.setItem("userID", userID);
    }    
}

function getUsername() {    
    var username = null;
    $.ajaxSetup({cache: false});
    function getData() {
        $.get(domainString + "/php/getUsername.php", function(data) {
        username = data;
        console.log("getUsername returned: " +username);
        });
    }
    getData();
    
    if (username == null) {
        console.log("error grabbing username!");
    }
    else {        
        localStorage.setItem("username", userID);
    }
}

/*
*  Secure Hash Algorithm (SHA512)
*  http://www.happycode.info/
*/

function SHA512(str) {
  function int64(msint_32, lsint_32) {
    this.highOrder = msint_32;
    this.lowOrder = lsint_32;
  }

  var H = [new int64(0x6a09e667, 0xf3bcc908), new int64(0xbb67ae85, 0x84caa73b),
      new int64(0x3c6ef372, 0xfe94f82b), new int64(0xa54ff53a, 0x5f1d36f1),
      new int64(0x510e527f, 0xade682d1), new int64(0x9b05688c, 0x2b3e6c1f),
      new int64(0x1f83d9ab, 0xfb41bd6b), new int64(0x5be0cd19, 0x137e2179)];

  var K = [new int64(0x428a2f98, 0xd728ae22), new int64(0x71374491, 0x23ef65cd),
      new int64(0xb5c0fbcf, 0xec4d3b2f), new int64(0xe9b5dba5, 0x8189dbbc),
      new int64(0x3956c25b, 0xf348b538), new int64(0x59f111f1, 0xb605d019),
      new int64(0x923f82a4, 0xaf194f9b), new int64(0xab1c5ed5, 0xda6d8118),
      new int64(0xd807aa98, 0xa3030242), new int64(0x12835b01, 0x45706fbe),
      new int64(0x243185be, 0x4ee4b28c), new int64(0x550c7dc3, 0xd5ffb4e2),
      new int64(0x72be5d74, 0xf27b896f), new int64(0x80deb1fe, 0x3b1696b1),
      new int64(0x9bdc06a7, 0x25c71235), new int64(0xc19bf174, 0xcf692694),
      new int64(0xe49b69c1, 0x9ef14ad2), new int64(0xefbe4786, 0x384f25e3),
      new int64(0x0fc19dc6, 0x8b8cd5b5), new int64(0x240ca1cc, 0x77ac9c65),
      new int64(0x2de92c6f, 0x592b0275), new int64(0x4a7484aa, 0x6ea6e483),
      new int64(0x5cb0a9dc, 0xbd41fbd4), new int64(0x76f988da, 0x831153b5),
      new int64(0x983e5152, 0xee66dfab), new int64(0xa831c66d, 0x2db43210),
      new int64(0xb00327c8, 0x98fb213f), new int64(0xbf597fc7, 0xbeef0ee4),
      new int64(0xc6e00bf3, 0x3da88fc2), new int64(0xd5a79147, 0x930aa725),
      new int64(0x06ca6351, 0xe003826f), new int64(0x14292967, 0x0a0e6e70),
      new int64(0x27b70a85, 0x46d22ffc), new int64(0x2e1b2138, 0x5c26c926),
      new int64(0x4d2c6dfc, 0x5ac42aed), new int64(0x53380d13, 0x9d95b3df),
      new int64(0x650a7354, 0x8baf63de), new int64(0x766a0abb, 0x3c77b2a8),
      new int64(0x81c2c92e, 0x47edaee6), new int64(0x92722c85, 0x1482353b),
      new int64(0xa2bfe8a1, 0x4cf10364), new int64(0xa81a664b, 0xbc423001),
      new int64(0xc24b8b70, 0xd0f89791), new int64(0xc76c51a3, 0x0654be30),
      new int64(0xd192e819, 0xd6ef5218), new int64(0xd6990624, 0x5565a910),
      new int64(0xf40e3585, 0x5771202a), new int64(0x106aa070, 0x32bbd1b8),
      new int64(0x19a4c116, 0xb8d2d0c8), new int64(0x1e376c08, 0x5141ab53),
      new int64(0x2748774c, 0xdf8eeb99), new int64(0x34b0bcb5, 0xe19b48a8),
      new int64(0x391c0cb3, 0xc5c95a63), new int64(0x4ed8aa4a, 0xe3418acb),
      new int64(0x5b9cca4f, 0x7763e373), new int64(0x682e6ff3, 0xd6b2b8a3),
      new int64(0x748f82ee, 0x5defb2fc), new int64(0x78a5636f, 0x43172f60),
      new int64(0x84c87814, 0xa1f0ab72), new int64(0x8cc70208, 0x1a6439ec),
      new int64(0x90befffa, 0x23631e28), new int64(0xa4506ceb, 0xde82bde9),
      new int64(0xbef9a3f7, 0xb2c67915), new int64(0xc67178f2, 0xe372532b),
      new int64(0xca273ece, 0xea26619c), new int64(0xd186b8c7, 0x21c0c207),
      new int64(0xeada7dd6, 0xcde0eb1e), new int64(0xf57d4f7f, 0xee6ed178),
      new int64(0x06f067aa, 0x72176fba), new int64(0x0a637dc5, 0xa2c898a6),
      new int64(0x113f9804, 0xbef90dae), new int64(0x1b710b35, 0x131c471b),
      new int64(0x28db77f5, 0x23047d84), new int64(0x32caab7b, 0x40c72493),
      new int64(0x3c9ebe0a, 0x15c9bebc), new int64(0x431d67c4, 0x9c100d4c),
      new int64(0x4cc5d4be, 0xcb3e42b6), new int64(0x597f299c, 0xfc657e2a),
      new int64(0x5fcb6fab, 0x3ad6faec), new int64(0x6c44198c, 0x4a475817)];

  var W = new Array(64);
  var a, b, c, d, e, f, g, h, i, j;
  var T1, T2;
  var charsize = 8;

  function utf8_encode(str) {
    return unescape(encodeURIComponent(str));
  }

  function str2binb(str) {
    var bin = [];
    var mask = (1 << charsize) - 1;
    var len = str.length * charsize;

    for (var i = 0; i < len; i += charsize) {
      bin[i >> 5] |= (str.charCodeAt(i / charsize) & mask) << (32 - charsize - (i % 32));
    }

    return bin;
  }

  function binb2hex(binarray) {
    var hex_tab = "0123456789abcdef";
    var str = "";
    var length = binarray.length * 4;
    var srcByte;

    for (var i = 0; i < length; i += 1) {
      srcByte = binarray[i >> 2] >> ((3 - (i % 4)) * 8);
      str += hex_tab.charAt((srcByte >> 4) & 0xF) + hex_tab.charAt(srcByte & 0xF);
    }

    return str;
  }

  function safe_add_2(x, y) {
    var lsw, msw, lowOrder, highOrder;

    lsw = (x.lowOrder & 0xFFFF) + (y.lowOrder & 0xFFFF);
    msw = (x.lowOrder >>> 16) + (y.lowOrder >>> 16) + (lsw >>> 16);
    lowOrder = ((msw & 0xFFFF) << 16) | (lsw & 0xFFFF);

    lsw = (x.highOrder & 0xFFFF) + (y.highOrder & 0xFFFF) + (msw >>> 16);
    msw = (x.highOrder >>> 16) + (y.highOrder >>> 16) + (lsw >>> 16);
    highOrder = ((msw & 0xFFFF) << 16) | (lsw & 0xFFFF);

    return new int64(highOrder, lowOrder);
  }

  function safe_add_4(a, b, c, d) {
    var lsw, msw, lowOrder, highOrder;

    lsw = (a.lowOrder & 0xFFFF) + (b.lowOrder & 0xFFFF) + (c.lowOrder & 0xFFFF) + (d.lowOrder & 0xFFFF);
    msw = (a.lowOrder >>> 16) + (b.lowOrder >>> 16) + (c.lowOrder >>> 16) + (d.lowOrder >>> 16) + (lsw >>> 16);
    lowOrder = ((msw & 0xFFFF) << 16) | (lsw & 0xFFFF);

    lsw = (a.highOrder & 0xFFFF) + (b.highOrder & 0xFFFF) + (c.highOrder & 0xFFFF) + (d.highOrder & 0xFFFF) + (msw >>> 16);
    msw = (a.highOrder >>> 16) + (b.highOrder >>> 16) + (c.highOrder >>> 16) + (d.highOrder >>> 16) + (lsw >>> 16);
    highOrder = ((msw & 0xFFFF) << 16) | (lsw & 0xFFFF);

    return new int64(highOrder, lowOrder);
  }

  function safe_add_5(a, b, c, d, e) {
    var lsw, msw, lowOrder, highOrder;

    lsw = (a.lowOrder & 0xFFFF) + (b.lowOrder & 0xFFFF) + (c.lowOrder & 0xFFFF) + (d.lowOrder & 0xFFFF) + (e.lowOrder & 0xFFFF);
    msw = (a.lowOrder >>> 16) + (b.lowOrder >>> 16) + (c.lowOrder >>> 16) + (d.lowOrder >>> 16) + (e.lowOrder >>> 16) + (lsw >>> 16);
    lowOrder = ((msw & 0xFFFF) << 16) | (lsw & 0xFFFF);

    lsw = (a.highOrder & 0xFFFF) + (b.highOrder & 0xFFFF) + (c.highOrder & 0xFFFF) + (d.highOrder & 0xFFFF) + (e.highOrder & 0xFFFF) + (msw >>> 16);
    msw = (a.highOrder >>> 16) + (b.highOrder >>> 16) + (c.highOrder >>> 16) + (d.highOrder >>> 16) + (e.highOrder >>> 16) + (lsw >>> 16);
    highOrder = ((msw & 0xFFFF) << 16) | (lsw & 0xFFFF);

    return new int64(highOrder, lowOrder);
  }

  function maj(x, y, z) {
    return new int64(
      (x.highOrder & y.highOrder) ^ (x.highOrder & z.highOrder) ^ (y.highOrder & z.highOrder),
      (x.lowOrder & y.lowOrder) ^ (x.lowOrder & z.lowOrder) ^ (y.lowOrder & z.lowOrder)
    );
  }

  function ch(x, y, z) {
    return new int64(
      (x.highOrder & y.highOrder) ^ (~x.highOrder & z.highOrder),
      (x.lowOrder & y.lowOrder) ^ (~x.lowOrder & z.lowOrder)
    );
  }

  function rotr(x, n) {
    if (n <= 32) {
      return new int64(
       (x.highOrder >>> n) | (x.lowOrder << (32 - n)),
       (x.lowOrder >>> n) | (x.highOrder << (32 - n))
      );
    } else {
      return new int64(
       (x.lowOrder >>> n) | (x.highOrder << (32 - n)),
       (x.highOrder >>> n) | (x.lowOrder << (32 - n))
      );
    }
  }

  function sigma0(x) {
    var rotr28 = rotr(x, 28);
    var rotr34 = rotr(x, 34);
    var rotr39 = rotr(x, 39);

    return new int64(
      rotr28.highOrder ^ rotr34.highOrder ^ rotr39.highOrder,
      rotr28.lowOrder ^ rotr34.lowOrder ^ rotr39.lowOrder
    );
  }

  function sigma1(x) {
    var rotr14 = rotr(x, 14);
    var rotr18 = rotr(x, 18);
    var rotr41 = rotr(x, 41);

    return new int64(
      rotr14.highOrder ^ rotr18.highOrder ^ rotr41.highOrder,
      rotr14.lowOrder ^ rotr18.lowOrder ^ rotr41.lowOrder
    );
  }

  function gamma0(x) {
    var rotr1 = rotr(x, 1), rotr8 = rotr(x, 8), shr7 = shr(x, 7);

    return new int64(
      rotr1.highOrder ^ rotr8.highOrder ^ shr7.highOrder,
      rotr1.lowOrder ^ rotr8.lowOrder ^ shr7.lowOrder
    );
  }

  function gamma1(x) {
    var rotr19 = rotr(x, 19);
    var rotr61 = rotr(x, 61);
    var shr6 = shr(x, 6);

    return new int64(
      rotr19.highOrder ^ rotr61.highOrder ^ shr6.highOrder,
      rotr19.lowOrder ^ rotr61.lowOrder ^ shr6.lowOrder
    );
  }

  function shr(x, n) {
    if (n <= 32) {
      return new int64(
       x.highOrder >>> n,
       x.lowOrder >>> n | (x.highOrder << (32 - n))
      );
    } else {
      return new int64(
       0,
       x.highOrder << (32 - n)
      );
    }
  }

  str = utf8_encode(str);
  strlen = str.length*charsize;
  str = str2binb(str);

  str[strlen >> 5] |= 0x80 << (24 - strlen % 32);
  str[(((strlen + 128) >> 10) << 5) + 31] = strlen;

  for (var i = 0; i < str.length; i += 32) {
    a = H[0];
    b = H[1];
    c = H[2];
    d = H[3];
    e = H[4];
    f = H[5];
    g = H[6];
    h = H[7];

    for (var j = 0; j < 80; j++) {
      if (j < 16) {
       W[j] = new int64(str[j*2 + i], str[j*2 + i + 1]);
      } else {
       W[j] = safe_add_4(gamma1(W[j - 2]), W[j - 7], gamma0(W[j - 15]), W[j - 16]);
      }

      T1 = safe_add_5(h, sigma1(e), ch(e, f, g), K[j], W[j]);
      T2 = safe_add_2(sigma0(a), maj(a, b, c));
      h = g;
      g = f;
      f = e;
      e = safe_add_2(d, T1);
      d = c;
      c = b;
      b = a;
      a = safe_add_2(T1, T2);
    }

    H[0] = safe_add_2(a, H[0]);
    H[1] = safe_add_2(b, H[1]);
    H[2] = safe_add_2(c, H[2]);
    H[3] = safe_add_2(d, H[3]);
    H[4] = safe_add_2(e, H[4]);
    H[5] = safe_add_2(f, H[5]);
    H[6] = safe_add_2(g, H[6]);
    H[7] = safe_add_2(h, H[7]);
  }

  var binarray = [];
  for (var i = 0; i < H.length; i++) {
    binarray.push(H[i].highOrder);
    binarray.push(H[i].lowOrder);
  }
  return binb2hex(binarray);
}
/*- Usage:
1. Copy the SHA512() function into your JavaScript script.
2. To get the SHA512 hash of a string, calls the SHA512() function:   SHA512('string'); .

- Example. The string entered into an input text field will be encrypted with SHA512, and added into another input form field.
<form action="#" method="post">
Enter a text:<br/>
<input type="text" name="strex" id="strex" size="20" /> <button id="cryptstr">Encrypt</button><br/>
SHA512 hash string:<br/>
<input type="text" name="strcrypt" id="strcrypt" size="33" />
</form>
<script type="text/javascript">
// Here add the code of SHA512 function

// register onclick events for Encrypt button
document.getElementById('cryptstr').onclick = function() {
var txt_string = document.getElementById('strex').value;    // gets data from input text

// encrypts data and adds it in #strcrypt element
document.getElementById('strcrypt').value = SHA512(txt_string);
return false;
}
</script>
*/

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}
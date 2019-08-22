<%-- 
    Document   : signupModel
    Created on : Jul 17, 2019, 12:14:23 PM
    Author     : burakzengin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script>

    $(document).ready(function () {
//        $("#signupButton").on('click', function () {
//            var email = $("#email").val();
//            $.get('checkUsername', {email: email}, function (response) {
//                console.log(response);
//                if (response === "SUCCESS") {
//                    $('#signupForm').modal('hide');
//                    $('#signupEmail').modal('show');
//                } else {
//                    console.log("failed");
//                }
//            });
//        });
    });

</script>
<!-- Modal -->
<div class="modal fade" id="signupForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <!--Content-->
        <div class="modal-content form-elegant">
            <!--Header-->
            <div class="modal-header text-center">
                <h3 class="modal-title w-100 dark-grey-text font-weight-bold my-3" id="myModalLabel" style="margin-left: 25px;"><strong>Sign up</strong></h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <!--Body-->
            <div class="modal-body mx-4">
                <!--Body-->
                <form action="sendConfirmationMail" method="POST">
                    <div class="md-form mb-5">
                        <input placeholder="Name" type="text" name="name" id="signupname" required class="form-control validate">
                        <label data-error="wrong" data-success="false"></label>
                    </div>
                    <div class="md-form mb-5">
                        <input placeholder="Surname" type="text" name="surname" id="signupsurname" required class="form-control validate">
                        <label data-error="wrong" data-success="right"></label>
                    </div>
                    <div class="md-form mb-5">
                        <input placeholder="Your email" type="email" id="email" name="email" class="form-control validate">
                        <label data-error="wrong" data-success="right"></label>
                    </div>
                    <div class="md-form mb-5">
                        <input placeholder="Your Password" type="password" name="password" class="form-control validate">
                        <label data-error="wrong" data-success="right" ></label>
                    </div>
                    <div class="md-form mb-5">
                        <input placeholder="Confirmation Password" type="password" name="repassword" class="form-control validate">
                        <label data-error="wrong" data-success="right"></label>
                    </div>
                    <div class="text-center mb-3">
                        <button type="submit" name="signupButton" id="signupButton" class="btn blue-gradient btn-block btn-rounded z-depth-1a" style="font-weight: 500; border-radius: 20px;">Sign up</button>
                    </div>
                    <p class="font-small dark-grey-text text-right d-flex justify-content-center mb-3 pt-2"> or Sign up
                        with:</p>

                    <div class="row my-3 d-flex justify-content-center">
                    <input type="hidden" value="" id="picurl">
                      

                <script>
                window.fbAsyncInit = function() {
                // FB JavaScript SDK configuration and setup
                FB.init({
                appId      : '390663498119602', // FB App ID
                cookie     : true,  // enable cookies to allow the server to access the session
                xfbml      : true,  // parse social plugins on this page
                version    : 'v4.0' // use graph api version 2.8
                });
    
    // Check whether the user already logged in
                FB.getLoginStatus(function(response) {
                if (response.status === 'connected') {
            //display user data
                getFbUserData();
                }
                });
                };

// Load the JavaScript SDK asynchronously
                (function(d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) return;
                js = d.createElement(s); js.id = id;
                js.src = "//connect.facebook.net/en_US/sdk.js";
                fjs.parentNode.insertBefore(js, fjs);
                }(document, 'script', 'facebook-jssdk'));

// Facebook login with JavaScript SDK
                function fbLogin() {
                FB.login(function (response) {
                if (response.authResponse) {
            // Get and display the user profile data
                getFbUserData();
                } else {
                document.getElementById('status').innerHTML = 'User cancelled login or did not fully authorize.';
                }
                }, {scope: 'email'});
                }

                    function fbsecLogin() {
                    FB.login(function (response) {
                    if (response.authResponse) {
            // Get and display the user profile data
                    getFbsecUserData();
                    } else {
                    document.getElementById('status').innerHTML = 'User cancelled login or did not fully authorize.';
                    }
                    }, {scope: 'email'});
                    }


                // Fetch the user profile data from facebook
                    function getFbsecUserData(){
                    FB.api('/me', {locale: 'en_US', fields: 'id,first_name,last_name,email,link,gender,locale,picture'},
                    function (response) {
                    $.ajax({
                            type:"POST",
                    url:"http://localhost:8009/BookingPetz/sociallogin",
                            data:"email="+response.email+"",
                            success:function(data){
                                
                                  $("#ajaxResponsegoogle").html(data);

                             }
                          });
                    });  
                    }

                    // Fetch the user profile data from facebook
                    function getFbUserData(){
                    FB.api('/me', {locale: 'en_US', fields: 'id,first_name,last_name,email,link,gender,locale,picture'},
                    function (response) {
  
                    document.getElementById('signupname').value = response.first_name;
                    document.getElementById('signupsurname').value = response.last_name;
                    document.getElementById('email').value = response.email;
                    document.getElementById('picurl').value = encodeURIComponent(response.picture.data.url);
    
                    });   
                    }

                        // Logout from facebook
                    function fbLogout() {
                    FB.logout(function() {
                    document.getElementById('fbLink').setAttribute("onclick","fbLogin()");
                    document.getElementById('fbLink').innerHTML = '<img src="fblogin.png"/>';
                    document.getElementById('userData').innerHTML = '';
                    document.getElementById('status').innerHTML = 'You have successfully logout from Facebook.';
                    });
                    }
                    </script>

  

                    <!-- Display login status -->
                    <div id="status"></div>


                    <!-- Display user profile data -->
                    <div id="userData"></div>

                        <!--Facebook-->
                    <button type="button" onclick="fbLogin()" id="fbLink" class="btn btn-white btn-rounded mr-md-3 z-depth-1a"><i class="fab fa-facebook-f text-center"></i></button>
                                   
                        <!--Googles +-->
                         
                    <div id="customSignup" >
                    <button type="button" class="btn btn-white btn-rounded z-depth-1a"><i class="fab fa-google-plus-g"></i></button> 
                    </div>

           <script>
            function insta() {
            // Initialize with your OAuth.io app public key
            OAuth.initialize('7qivXVDmuBtv_cOISTvoknm4aF4');
            // Use popup for OAuth
            OAuth.popup('instagram').then(instagram => {
            console.log('instagram:', instagram);
            // Prompts 'welcome' message with User's name on successful login
            // #me() is a convenient method to retrieve user data without requiring you
            // to know which OAuth provider url to call
            instagram.me().then(data => {
            console.log('me data:', data);
            alert('Instagram says your name is ' + data.name + ".\nView browser 'Console Log' for more details");
            });
            // Retrieves user data from OAuth provider by using #get() and
            // OAuth provider url
            instagram.get('/v1/users/self').then(data => {
            console.log('self data:', data);

            })
               
            var instagramnames=instagram['user']['full_name'].split(" ");
            document.getElementById('signupname').value = instagramnames[0];
            document.getElementById('signupsurname').value = instagramnames[1];   
            document.getElementById('picurl').value = encodeURIComponent(instagram['user']['profile_picture']);
            });
        };
    </script>
    <button type="button" id="instagramsignup" onclick="insta()" class="btn btn-white btn-rounded z-depth-1a"><i class="fab fa-instagram"></i></button>     
                        

    
    
    <div id="signupname"></div>
    <script>startSignupApp();</script>
                    </div>
                </form>

            </div>
            <!--Footer-->
            <div class="modal-footer mx-5 pt-3 mb-1">
                <p class="font-small grey-text d-flex justify-content-end">Do you already have an account? <a href="home" data-dismiss="modal" data-toggle="modal" data-target="#signupEmail" class="modelClose blue-text ml-1">
                        Sign In</a></p>
            </div>
        </div>
        <!--/.Content-->
    </div>
</div>
<!-- Modal -->

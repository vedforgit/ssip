<%-- 
    Document   : account
    Created on : 20 Jan, 2020, 8:54:09 PM
    Author     : vedant
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session = request.getSession();
    
    String username =(String) session.getAttribute("username");
    System.out.println(username);
    String sql = "Select * from detail where username='"+username+"'";
//    String uname = "";
    String fname = "";
    String lname = "";
    String address = "";
    String number = "";
    String email = "";
    String gender = "";
    String district = "";
    String tehsil = "";
    String li = "";
    
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/doctor","root","root");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql);
        while(rs.next())
        {
            fname = rs.getString(2);
            lname = rs.getString(3);
            gender = rs.getString(6);
            number = rs.getString(7);
            email = rs.getString(8);
            address = rs.getString(9);
            district = rs.getString(10);
            tehsil = rs.getString(11);
            li = rs.getInt(12)+"";
            
        }
        System.out.println(fname);
    }
    catch(Exception e)
    {
        out.print(e);
    }
    
    
%>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Account</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/libs/css/style.css">
    <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <style>
    html,
    body {
        height: 100%;
    }

    body {
        display: -ms-flexbox;
        display: flex;
        -ms-flex-align: center;
        align-items: center;
        padding-top: 40px;
        padding-bottom: 40px;
    }
    </style>
    <script>
        function goback()
        {
            window.location.href="http://localhost:8084/WebApplication1/sch/dashboard.html";
        }
        
         function myload()
            {
                xyz();
                alert();
            }
            function xyz() // taluka   option
            {
                var dis=""
                var req=new XMLHttpRequest();
                req.open("get","fetch_distric.jsp?",true);
                req.send();
                req.onreadystatechange=function(){
                    if(req.readyState==4 && req.status==200)
                    {
                        dis="<select name='district' id='district' onchange='abc()'><option>select district</option>"+req.responseText+"</select>";
                    }
                    $("#dis").append(dis);
                };
            }
            
            function abc() //tehsil option
            {
                alert(document.getElementById('district').value);
                $("#dis1").empty();
                var dis=""
                var req=new XMLHttpRequest();
                req.open("get","fetch_taluka.jsp?district="+document.getElementById('district').value,true);
                req.send();
                req.onreadystatechange=function(){
                    if(req.readyState==4 && req.status==200)
                    {
                        dis="<select name='taluka' id='taluka' >"+req.responseText+"</select>";
                    }
                    $("#dis1").append(dis);
                };
            }
        </script>
         <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <script src="assets/libs/js/main-js.js"></script>
    
</head>
<!-- ============================================================== -->
<!-- signup form  -->
<!-- ============================================================== -->

<body >
    <!-- ============================================================== -->
    <!-- signup form  -->
    <!-- ============================================================== -->
    <div class="splash-container">
        <div class="card">
            <div class="card-header">
                <h3 class="mb-1">Account Details</h3>
                <!--<p>Fill out the form carefully for registration</p>-->
            </div>
            <div class="card-body">
                <div class="form-group">
                    <label for="inputText3" class="col-form-label">Login Detail *</label>
                    <input class="form-control form-control-lg" type="text" name="un" required="" readonly="readonly" value="<%=username%>">
<!--<input class="form-control form-control-lg" type="text" name="pwd" required="" placeholder="Password" autocomplete="off">-->

                </div>
                <div class="form-group">
    <label for="inputText3" class="col-form-label">Name *</label>
                   <input class="form-control form-control-lg" type="text" name="fn" readonly="readonly" required="" readonly="readonly" value="<%=fname%>">
    <input class="form-control form-control-lg" type="text" name="ln" required="" readonly="readonly" value="<%=lname%>">
                </div>
<div class="form-group">
                    <label for="inputText3" class="col-form-label">Contact Details *</label>
<input class="form-control form-control-lg" type="text" name="phone" required="" readonly="readonly" value="<%=number%>">

<input class="form-control form-control-lg" type="email" name="email" required="" readonly="readonly" value="<%=email%>">
                </div>
                <div class="form-group">
                    <label for="inputText3" class="col-form-label">Gender *</label>
<!--<label class="custom-control custom-radio custom-control-inline">
    <input type="radio" id="gender" name="gender" value="male" checked="" class="custom-control-input"><span class="custom-control-label">Male</span>
                                            </label>

<label class="custom-control custom-radio custom-control-inline">
                                                <input type="radio" id="gender" name="gender" value="male" class="custom-control-input"><span class="custom-control-label">Female</span>
                                            </label> 
                </div>-->
<input class="form-control form-control-lg" type="email" name="email" required="" readonly="readonly" value="<%=gender%>">
                <div class="form-group">
                    <label for="inputText3" class="col-form-label">Hospital Address</label>
                    <input class="form-control form-control-lg" type="text" name="address" required="" readonly="readonly" value="<%=address%>">
<!--                    <label for="inputText3" class="col-form-label">District</label>
                    <span id="dis"><%=district%></span>-->
<input class="form-control form-control-lg" type="email" name="email" required="" readonly="readonly" value="<%=tehsil%>">
                

<input class="form-control form-control-lg" type="email" name="email" required="" readonly="readonly" value="<%=district%>">
                </div>
        

<!--&nbsp; &nbsp; &nbsp;-->
                    <!--<label for="inputText3" class="col-form-label">Select Tehsil</label>-->
                    <!--<span id="dis1"></span>-->

<div class="form-group">
                    <label for="inputText3" class="col-form-label">Licence Number</label><input class="form-control form-control-lg" type="text" name="li" required="" readonly="readonly" value="<%=li%>"></div>
<!--
 <div class="custom-file mb-3">
                    <label for="inputText3" class="col-form-label">Upload degree</label>
-->
   
<!--                                                <input type="file" name="degree" class="custom-file-input" id="customFile">
                                                <label class="custom-file-label" for="customFile">Upload Degree</label>
                                            </div>-->
<!--                <div class="form-group">
                    <label class="custom-control custom-checkbox">
                        <input class="custom-control-input" type="checkbox"><span class="custom-control-label">By creating an account, you agree the <a href="file:///C:/Users/Riddhesh-pc/Desktop/vedant%20project/concept-master/sign-up.html#">terms and conditions</a></span>
                    </label>
                </div>-->
            <div class="form-group pt-2">
                <button class="btn btn-block btn-primary" onclick="goback()">Close</button>
    <!--<button class="btn btn-block btn-primary" type="reset">Reset</button>-->
                </div>
                
                <!--<div class="form-group row pt-0">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb-2">
                        <button class="btn btn-block btn-social btn-facebook " type="button">Facebook</button>
                    </div>
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <button class="btn  btn-block btn-social btn-twitter" type="button">Twitter</button>
                    </div>
                </div>-->
            </div>
            <div class="card-footer bg-white">
                
            </div>
        </div>
        </div>


 
</body></html>

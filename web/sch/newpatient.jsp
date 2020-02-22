<%@page import="java.sql.*"%>
<!doctype html>
<html lang="en">
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>New Patient</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/libs/css/style.css">
    <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    
    <script>
        
        function findpatient()
        {
               var val = document.getElementById("id").value;
//               var go = "";
//                var req=new XMLHttpRequest();
//                req.open("get","fetchid.jsp?id="+val,true);
//                req.send();
//                req.onreadystatechange=function()
//                {
//                    if(req.readyState==4 && req.status==200)
//                    {
//                        go = req.responseText;
//                      //  alert(go);
//                    }
//                    if(go=="error" || go=="not found")
//                    {
//                        alert("Something went wrong.....");
//                    }
//                    else
//                    {
//                       var ps=confirm("Your Number :"+go);
//                       if(ps==true)
//                       {
//                           alert("go");
//                       }
//                       else
//                       {
//                           alert("samepage");
//                       }
//                    }
//                };
                 $.ajax({
                        type: "GET",
                        url: "fetchid.jsp?id="+val,
                        async: true,
                        contentType: "text/html",
                        processData: false,
                        success: function(msg)
                        {   var x=msg.trim();
                            if(x=="")
                            {
                                alert("not found");
                            }
                            else
                            {
                                var y=confirm("Your Number:"+msg);
                                if(y==true)
                                {
                                    //alert("redirect");
                                    window.location.href="http://localhost:8081/WebApplication1/sch/profile.jsp?patientid="+val;
                                }
                                if(y==false)
                                {
                                    alert("same page");
                                    
                                }

                            }
                        },
                        error:function(msg) {
                            alert("error");
                        }
                     });


                
        }
        </script>
</head>
<%!
    String find(String id)
    {
        System.out.println("function start123");
        try
        {
            System.out.println(id);
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/patient","root","root");
            String sql = "select phone from detail where id='"+id+"'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if(rs.next())
            {
                return rs.getString(1);
            }
            
        }
        catch(Exception e)
        {
            return "error";
        }
        
        return "not found";
    }
%>
<body>
    
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
         <!-- ============================================================== -->
        <!-- navbar -->
        <!-- ============================================================== -->
         <div class="dashboard-header">
            <nav class="navbar navbar-expand-lg bg-white fixed-top">
                <a class="navbar-brand" href="../index.html">Medico</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto navbar-right-top">
                        
                        <li class="nav-item dropdown notification">
                            <a class="nav-link nav-icons" href="#" id="navbarDropdownMenuLink1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-fw fa-bell"></i> <span class="indicator"></span></a>
                            <ul class="dropdown-menu dropdown-menu-right notification-dropdown">
                                <li>
                                    <div class="notification-title"> Notification</div>
                                    <div class="notification-list">
                                        <div class="list-group">
                                            <a href="#" class="list-group-item list-group-item-action active">
                                                <div class="notification-info">
                                                    <div class="notification-list-user-img"><img src="assets/images/avatar-2.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                    <div class="notification-list-user-block"><span class="notification-list-user-name">Jeremy Rakestraw</span>accepted your invitation to join the team.
                                                        <div class="notification-date">2 min ago</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" class="list-group-item list-group-item-action">
                                                <div class="notification-info">
                                                    <div class="notification-list-user-img"><img src="assets/images/avatar-3.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                    <div class="notification-list-user-block"><span class="notification-list-user-name">
John Abraham</span>is now following you
                                                        <div class="notification-date">2 days ago</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" class="list-group-item list-group-item-action">
                                                <div class="notification-info">
                                                    <div class="notification-list-user-img"><img src="assets/images/avatar-4.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                    <div class="notification-list-user-block"><span class="notification-list-user-name">Monaan Pechi</span> is watching your main repository
                                                        <div class="notification-date">2 min ago</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" class="list-group-item list-group-item-action">
                                                <div class="notification-info">
                                                    <div class="notification-list-user-img"><img src="assets/images/avatar-5.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                    <div class="notification-list-user-block"><span class="notification-list-user-name">Jessica Caruso</span>accepted your invitation to join the team.
                                                        <div class="notification-date">2 min ago</div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="list-footer"> <a href="#">View all notifications</a></div>
                                </li>
                            </ul>
                        </li>
                                                <li class="nav-item dropdown nav-user">
                            <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="assets/images/avatar-1.jpg" alt="" class="user-avatar-md rounded-circle"></a>
                            <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                                 <a class="dropdown-item" href="#"><i class="fas fa-user mr-2"></i>Account</a>
                                <a class="dropdown-item" href="#"><i class="fas fa-power-off mr-2"></i>Logout</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <!-- ============================================================== -->
        <!-- end navbar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- left sidebar -->
        <!-- ============================================================== -->
     <div class="nav-left-sidebar sidebar-dark">
            <div class="menu-list">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="d-xl-none d-lg-none" href="#">Dashboard</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav flex-column">
                            <li class="nav-divider">
                                Menu
                            </li>
							<li class="nav-item ">
                                <a class="nav-link active collapsed" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1" aria-controls="submenu-1"><i class="fa fa-fw fa-user-circle"></i>Patient <span class="badge badge-success">6</span></a>
                                <div id="submenu-1" class="submenu collapse" style="">
                                    <ul class="nav flex-column">
                                        
                                        <li class="nav-item">
                                            <a class="nav-link" href="addpatient.html">Register Patient</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="newpatient.html">New Patient</a>
                                        </li>
                                        
                                    </ul>
                                </div>
                            </li>
							
							
							<li class="nav-item ">
                                <a class="nav-link collapsed" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-4" aria-controls="submenu-4"><i class="fab fa-fw fa-wpforms"></i>Appoinment</a>
                                <div id="submenu-4" class="submenu collapse" style="">
                                    <ul class="nav flex-column">
                                    
										<li class="nav-item">
                                            <a class="nav-link" href="#">Appoinment Request</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">Checked In</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">Emergency/Police Case</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
							
							
							<li class="nav-item">
                                <a class="nav-link collapsed" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-2" aria-controls="submenu-2"><i class="fa fa-fw fa-rocket"></i>Information</a>
                                <div id="submenu-2" class="submenu collapse" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">Circular<span class="badge badge-secondary">New</span></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">Message</a>
                                        </li>
                                        
                                       
                                    </ul>
                                </div>
                            </li>
							
							
							<li class="nav-item">
                                <a class="nav-link" href="dashboard.html" data-toggle="collapse" aria-expanded="false" data-target="#submenu-3" aria-controls="submenu-3"><i class="fas fa-fw fa-chart-pie"></i>Dashboard</a>
                                <div id="submenu-3" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="dashboard.html">main</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="chart-chartist.html">Chartist Charts</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="chart-charts.html">Chart</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="chart-morris.html">Morris</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="chart-sparkline.html">Sparkline</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="chart-gauge.html">Guage</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
							
                            
                           
                </nav>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- end left sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="container-fluid dashboard-content">
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <h3 class="text-center">New patient!</h3>
                    </div>
                </div>
				
			                			
												

						<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="section-block">
                                <h5 class="section-title">Find patient</h5>
								
								
								<div class="tab-pane fade active show" id="pills-msg" role="tabpanel" aria-labelledby="pills-msg-tab">
                                        <div class="card">
                                            <h5 class="card-header">Detail</h5>
                                            <div class="card-body">
                                                <!--<form>-->
                                                    <div class="row">
                                                        <div class="offset-xl-3 col-xl-6 offset-lg-3 col-lg-3 col-md-12 col-sm-12 col-12 p-4">
                                                            <div class="form-group">
                                                                <label for="name">Id:</label>
                                                                <input type="text" class="form-control form-control-lg" id="id" name="name1" placeholder="">
                                                            </div>
<!--                                                            <div class="form-group">
                                                                <label for="email">Name:</label>
                                                                <input type="email" class="form-control form-control-lg" id="email" placeholder="">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="subject">Phone Number:</label>
                                                                <input type="text" class="form-control form-control-lg" id="subject" placeholder="">
                                                            </div>-->
<button class="btn btn-primary float-right" onclick="findpatient()">Find	</button>
                                                        </div>
                                                    </div>
                                             
                                            </div>
                                        </div>
                                    </div>
								
								
                                
                            </div>
							
							
													

											
                
				
            </div>
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <div class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                            Copyright © 2018 Concept. All rights reserved. Dashboard by <a href="https://colorlib.com/wp/">Colorlib</a>.
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="text-md-right footer-links d-none d-sm-block">
                                <a href="javascript: void(0);">About</a>
                                <a href="javascript: void(0);">Support</a>
                                <a href="javascript: void(0);">Contact Us</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- end footer -->
            <!-- ============================================================== -->
        </div>
    </div>
        
    <!-- ============================================================== -->
    <!-- end main wrapper -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <script src="assets/libs/js/main-js.js"></script>
</body>
 
</html>
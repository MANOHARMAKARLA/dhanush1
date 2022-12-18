<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dhanush 2K22</title>
    <!--<link href="https://fonts.googleapis.com/css?family=Allura|Rock+Salt|Leckerli+One" rel="stylesheet">-->
    <link rel="shortcut icon" type="image/icon" href="assets/images/logo.ico"/>
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/slick.css" rel="stylesheet">
    <link id="switcher" href="assets/css/theme-color/default-theme.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <!--<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,400i,600,700,800" rel="stylesheet">-->
    <!--<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">-->
</head>
<body style="background:black;">
        <div class="row" align="right">
            <a href="index.jsp"><button class="mu-reg-submit-btn">HOME</button></a>
            &nbsp;&nbsp;&nbsp;&nbsp;
        </div>
        <div class="row" align="center">
            <font color="white">
                <table align="center">
                    <tr>
                        <td style="color:white;">BRANCH</td>
                        <td style="color:white;">:</td>
                        <td>
                            <select name="sel_branch" id="sel_branch" required>
                                <option value="">Select Branch</option>
                                <option value="CIV">CIVIL ENGINEERING</option>
                                <option value="EEE">ELECTRICAL & ELECTRONICS ENGINEERING</option>
                                <option value="MEC">MECHANICAL ENGINEERING</option>
                                <option value="ECE">ELECTRONICS & COMMUNICATIONS ENGINEERING</option>
                                <option value="CSE">COMPUTER SCIENCE & ENGINEERING</option>
                                 <option value="CSM">COMPUTER SCIENCE & ENGINEERING AL & ML</option>
                                <option value="IT">INFORMATION TECHNOLOGY</option>
                                <option value="EIE">ELECTRONICS & INSTRUMENTATION ENGINEERING</option>
                                <option value="ECS">ELECTRONICS CONTROL SYSTEMS ENGINEERING</option>
                            </select>
                        </td>    
                    </tr>
                </table>  
            </font>
        </div><br><br>
        <div id="s_eve" style="color: white;">
            
        </div>
</body>
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
    $("#sel_branch").change(function(){
        var sel_branch=document.getElementById("sel_branch").value;
        $.ajax({
           url : "sel_events.jsp",
           data : {sel_branch:sel_branch},
           method : "POST",
           success : function(data)
           {
               $("#s_eve").html(data);
           }
        });
        
        
    });
});
</script>
</script> 
</html>

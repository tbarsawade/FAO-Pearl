<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible"  charset="utf-8" name="viewport" content="width=device-width, initial-scale=1"  />
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href='https://fonts.googleapis.com/css?family=Raleway:400,600,700' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" />
    <link href="kendu/content/integration/bootstrap-integration/css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/mstyle.css" rel="stylesheet" />
    <script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />

    <title></title>
    <style type="text/css">
        .loader {
            border: 16px solid #f3f3f3;
            border-radius: 50%;
            border-top: 16px solid #3498db;
            width: 100px;
            height: 100px;
            -webkit-animation: spin 2s linear infinite; /* Safari */
            animation: spin 2s linear infinite;
            margin: 40px auto;
            
        }

        /* Safari */
        @-webkit-keyframes spin {
            0% {
                -webkit-transform: rotate(0deg);
            }

            100% {
                -webkit-transform: rotate(360deg);
            }
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }
    </style>
</head>
<body>
    <form id="form1" autocomplete="off" runat="server">
       <div id="divProgress" style="text-align:center;">
            <div class="loader"></div>
       </div>
        <div class="container-fluid">
            <div class="row" style="background: #ffffff;">
                <div class="col-sm-12 col-md-12 mg pd">
                    <div class="col-sm-2 col-md-2 mg-top8">
                        <img class="img-responsive lg" id="lblLogo" style="width: 100%" />
                    </div>
                    <div class="col-sm-10 col-md-10 heading">
                        <h3 id="lblmsgName">  </h3>
                    </div>
                </div>
            </div>
            <div class="row" style="background: #f7f7f7;">
                <div class="col-sm-8 col-md-8">
                    <img class="img-responsive bpm-pic"  id="lblHeaderLogo" style="width: 100%" />
                </div>
                <div class="col-sm-4 col-md-4">
                    <div id="wrapper">
                        <section class="login_content">
                            <h5>
                                <label class="HeaderFont" id="errorr1"></label>
                            </h5>
                            <div class="form-group">
                                <h1>Login Here</h1>
                                <input type="text" class="form-control form-group-box"  onfocus="$(this).removeAttr('readonly');" onkeypress="EnterEvent(event);" placeholder="UserID" id="txtUserID" />
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control form-group-box" readonly="true" autocomplete="off" onfocus="$(this).removeAttr('readonly');" onkeypress="EnterEvent(event);" placeholder="Password" id="txtPwd" />

                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control form-group-box"  onfocus="$(this).removeAttr('readonly');" onkeypress="EnterEvent(event);" placeholder="Customer Code" id="txtEntityName" />
                                <span class="help-block" id="lbltopmsg"></span>
                            </div>
                            <div id="dvOTP" class="form-group" style="display:none;">
                                <input type="text" class="form-control form-group-box" onkeypress="EnterEventOTP(event);" placeholder="Enter OTP" id="txtOTP" />
                                <a id="aResendOTP" href="javascript:void(0);" style="float:right;">Resend OTP</a>
                                <span class="help-block" id="lblOTP" style="margin-top: 20px;"></span>
                            </div>
                            <div class="clear10"></div>
                            <div id="dvLoginbutton" class="form-group">
                                <button type="button" id="btnlogin" class="btn btn-success submit" style=" width: 100px;" value="Login">Login</button>
                                <button type="button" class="btn btn-primary submit" onclick="ClearAllFields();" style="width: 100px;" value="Login">Reset</button>
                            </div>
                            <div id="dvOTPVerification" class="form-group" style="display:none;">
                                <button type="button" id="btnOTPVerification" class="btn btn-success submit" style="height: 30px; width: 100px;" value="Login">Submit OTP</button>
                                <button id="btnOTPReset" type="button" class="btn btn-primary submit" onclick="ClearOTPFields();" style="height: 30px; width: 100px;" value="Login">Reset</button>
                            </div>
                            <div class="forgotcontent">
                                <a id="Forgotpswd"  href="#" onclick="popup();">Forgot Password?</a>
                            </div>
                        </section>
                    </div>
                </div>
            </div>

        </div>
        <div id="modal_dialog" style="display: none">
           <div class="col-md-4 col-sm-4" style="color:#333;margin-top:18px;"> <label class="">UserID :</label></div>
           <div class="col-md-8 col-sm-8"><input type="text" class="form-control form-group-box" readonly="true" autocomplete="off" onfocus="$(this).removeAttr('readonly');" onkeypress="ForgotEnterEvent(event);" placeholder="UserID" id="txtEmailName" />
            </div>
               <div id="lblcustcode" class="col-md-4 col-sm-4" style="color:#333;margin-top:25px; ""> <label class="">Customer Code :</label></div>
              <div id="divcustcode" class="col-md-8 col-sm-8" style="margin-top:20px;"><input type="text" class="form-control form-group-box" readonly="true" autocomplete="off" onfocus="$(this).removeAttr('readonly');" onkeypress="ForgotEnterEvent(event);" placeholder="Customer Code" id="txtFEntityName" />
            </div>
             <div id="lblcaptcha" class="col-md-4 col-sm-4" style="color:#333;margin-top:25px;" >

            </div>
             <div id="divcaptcha" class="col-md-8 col-sm-8" style="margin-top:20px;"> 
                 <div id="ReCaptchContainer"  style="color:#333;margin-top:25px;">
                </div>
                <label id="lblMessage" runat="server" clientidmode="static"></label>  
                <br />  
            </div>
             <span class="help-block" id="lblMsgAddFolder"></span>
            <div class="form-group drop pull-right">
                   <button type="button" id="btnSubmit" class="btn btn-success submit" runat="server" style="height: 30px; width: 100px;" value="Login">Submit</button>
                    <button type="button" class="btn btn-primary submit" onclick="ClearAllFields();" style="height: 30px; width: 100px;" value="Login">Reset</button>
            </div>
           </div>
         <div id="success_modal_dialog" style="display: none">
              <div class="topheading-list2">Email sent to <span id="spnUserId"></span>  shortly, containing a link that enables you to reset your password .</div>
             <div class="topheading-list1">If you don't see an email from us within couple of minutes, it may be because: </div>
            
            <ul class="differentimage">
                 <li class="one"><a href="#">The email is in your junk/spam folder</a></li>
                 <li class="two"><a href="#">You do not have an account with us</a></li>
                 <li class="three"><a href="#">Our system does not allow you to reset your Password</a></li>
            </ul>
         </div>
        <footer>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <div class="ftr">
                            <%--<strong>Copyright © 2013-2017, Mynd Solutions Pvt. Ltd. All rights reserved.</strong>--%>
                            Copyright © <span id="lblYear" runat="server"></span> Mynd Integrated Solutions Pvt. Ltd. All rights reserved.
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </form>
</body>
</html>
<script src="https://www.google.com/recaptcha/api.js?onload=renderRecaptcha&render=explicit" async defer></script>
 <script type="text/javascript">
        var your_site_key = '6Lf-LY0UAAAAAH_LcClWa7H3UfXdJ6rFJfXZmU_P';
     var renderRecaptcha = function () {
            grecaptcha.render('ReCaptchContainer', {
                'sitekey': your_site_key,
                'callback': reCaptchaCallback,
                theme: 'light', //light or dark  
                type: 'image',// image or audio  
                size: 'normal'//normal or compact  
            });
        };

        var reCaptchaCallback = function (response) {
            if (response !== '') {
                jQuery('#lblMessage').css('color', 'green').html('Success');
            }
        };
    </script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#divProgress").hide();
        $("#txtUserID").focus();
        GetRequest();
        $("#btnSubmit").unbind("click").bind("click", function (event) {
              var message = 'Please checck the checkbox';
            if (typeof (grecaptcha) != 'undefined') {
                var response = grecaptcha.getResponse();
                if (response.length === 0)
                {
                    (response.length === 0) ? (message = 'Captcha verification failed') : (message = 'Success!');
                    jQuery('#lblMessage').html(message);
                    jQuery('#lblMessage').css('color', (message.toLowerCase() == 'success!') ? "green" : "red");
                    return;
                }
            }
            var IsPopValidation = PopupValidation();
            if (IsPopValidation == false) {
                event.preventDefault();
                $("#divProgress").dialog("close");
            }
            else {
                progressPopup();
                var userid = $("#txtEmailName").val();
                var customercode = $("#txtFEntityName").val();
                $.ajax({
                    type: "POST",
                    url: "Default.aspx/ForgotPassword",
                    data: '{userid:"' + userid + '",customercode:"' + customercode + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnSuccessForgotPassword,
                    failure: function (response) {
                        alert(response.d);
                    }
                });
                function OnSuccessForgotPassword(response) {
                    var objData = JSON.parse(response.d);
                    $.each(objData, function (key, value) {
                        if (key == "SUCCESS") {
                            $("#spnUserId").text('' + value + '');
                            $("#modal_dialog").dialog("close");
                            $("#divProgress").dialog("close");
                            successpopup();
                        }
                        else {
                            $("#lblMsgAddFolder").text('' + value + '')
                            $("#modal_dialog").dialog("open");
                            $("#success_modal_dialog").dialog("close");
                            $("#divProgress").dialog("close");
                        }
                    });
                }
            }
        });
        $("#aResendOTP").unbind().bind('click', function () {
            $("#lblOTP").text("");
            progressPopup();
            var IsValidation = FormValidation();
            if (IsValidation == false) {
                event.preventDefault();
                $("#divProgress").dialog("close");
            }
            else {
                var username = $("#txtUserID").val();
                var password = $("#txtPwd").val();
                var entityname = $("#txtEntityName").val();
                $.ajax({
                    type: "POST",
                    url: "Default.aspx/ResendOTP",
                    data: '{username:"' + username + '",password:"' + password + '",entityname:"' + entityname + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var objData = JSON.parse(response.d);
                        var count = 0
                        $.each(objData, function (key, value) {
                            if (count == 0) {
                                if (key == 0) {
                                    $("#lblOTP").text('Your credential not valid. ');
                                    $("#divProgress").dialog("close");
                                }
                                if (key == 1) {
                                    if (value == "OTP SENT") {

                                        $("#lblOTP").text("OTP (One Time Password) has been sent to your register mail id.");
                                        $("#divProgress").dialog("close");
                                        $("#dvOTP,#dvOTPVerification").show();
                                        $("#dvOTPVerification").show();
                                        $("#dvLoginbutton").hide();
                                    }
                                    else if (value == "OTP NOT SENT") {

                                    }
                                    else if (value =="You not authorize") {
                                        $("#lblOTP").text('You are not authorize.');
                                        $("#divProgress").dialog("close");
                                    }
                                }
                                count += 1;
                            }
                        });
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }
        });
        $("#btnlogin").unbind("click").bind("click", function (event) {
            $("#txtUserID,#txtPwd,#txtEntityName").removeAttr('disabled');
            $("#lbltopmsg").text("");
            progressPopup();
            var IsValidation = FormValidation();
            if (IsValidation == false) {
                event.preventDefault();
                $("#divProgress").dialog("close");
            }
            else {
                var username = $("#txtUserID").val();
                var password = $("#txtPwd").val();
                var entityname = $("#txtEntityName").val();
                $.ajax({
                    type: "POST",
                    url: "Default.aspx/ValidateUser",
                    data: '{username:"' + username + '",password:"' + password + '",entityname:"' + entityname + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnSuccessValidateUser,
                    failure: function (response) {
                        alert(response.d);
                    }

                });
                function OnSuccessValidateUser(response) {
                    var objData = JSON.parse(response.d);
                    var count = 0
                    $.each(objData, function (key, value) {
                        if (count == 0) {
                            if (key == 1 && value != "Please SET the default page for login  or contact to the super user")
                            {
                                if (value == "OTP SENT") {
                                    $("#lblOTP").text('OTP (One Time Password) has been sent to your register mail id.');
                                    $("#divProgress").dialog("close");
                                    $("#dvOTP,#dvOTPVerification").show();
                                    $("#dvOTPVerification").show();
                                    $("#txtUserID,#txtPwd,#txtEntityName").attr('disabled','disabled');
                                    $("#dvLoginbutton").hide();
                                    $("#btnOTPVerification").unbind().bind('click', function () {
                                        progressPopup();
                                        var username = $("#txtUserID").val();
                                        var password = $("#txtPwd").val();
                                        var entityname = $("#txtEntityName").val();
                                        var OTP = $("#txtOTP").val();
                                        $.ajax({
                                            type: "POST",
                                            url: "Default.aspx/ValidateOTP",
                                            data: '{username:"' + username + '",password:"' + password + '",entityname:"' + entityname + '",OTP:"' + OTP + '"}',
                                            contentType: "application/json; charset=utf-8",
                                            dataType: "json",
                                            success: OnSuccessValidateUserOTP,
                                            failure: function (response) {
                                                alert(response.d);
                                            }

                                        });

                                    });

                                }
                                else if (value == "OTP NOT SENT") {

                                }
                                else {
                                    $("#txtUserID,#txtPwd,#txtEntityName").removeAttr('disabled');
                                    window.location.href = value;
                                    $("#divProgress").dialog("close");
                                }
                            }
                            else {
                                $("#txtUserID,#txtPwd,#txtEntityName").removeAttr('disabled');
                                $("#lbltopmsg").text('' + value + '');
                                $("#divProgress").dialog("close");
                            }
                            count += 1;
                        }
                    });
                }

                function OnSuccessValidateUserOTP(response) {
                    var objData = JSON.parse(response.d);
                    var count = 0
                    $.each(objData, function (key, value) {
                        if (count == 0) {
                            if (key == 111) {
                                $("#lblOTP").text('' + value + '');
                            }
                            if (key == 1 && value != "Please SET the default page for login  or contact to the super user") {
                                window.location.href = value;
                                $("#divProgress").dialog("close");
                            }
                            else {
                                $("#lblOTP").text('' + value + '');
                                $("#divProgress").dialog("close");
                            }
                            count += 1;
                        }
                    });
                }
            }
        });
    });
    function GetRequest() {

        $.ajax({
            type: "POST",
            url: "Default.aspx/GetRequest",
            data: '{url: "' + window.location.href + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: OnGetRequestSuccess,
            failure: function (response) {
                alert(response.d);
            }
        });
    }
    function OnGetRequestSuccess(response) {
        var obj = JSON.parse(response.d);
        $("#lblLogo").attr("src", "logo/" + obj[2]);
        $("#lblHeaderLogo").attr("src", "logo/" + obj[3]);
        $("#lblmsgName").text('' + obj[1] + '');
        if (obj["EntityName"] == 'VISIBLE') {
            $("#txtEntityName").show();
            $("#txtFEntityName").show();
            $("#divcustcode").show()
            $("#lblcustcode").show()
        }
        else {
            $("#txtEntityName").hide();
            $("#txtEntityName").val(obj["EntityCode"]);
            $("#txtFEntityName").hide();
            $("#txtFEntityName").val(obj["EntityCode"]);
            $("#divcustcode").hide()
            $("#lblcustcode").hide()
            if (obj["EntityCode"] == "QWIKCILVER" || obj["EntityCode"] == "CHARGEBEE" || obj["EntityCode"] == "TESTCHARGEBEE" || obj["EntityCode"]=="NOON") {
                window.location.href = obj["SSOURL"];
                return;
            }

        }
    }
    //function EnterEvent(e) {
    //    var key = e.which;
    //    if (key == 13)  // the enter key code
    //        $("#btnlogin").click();
    //    return false;
    //}
    function EnterEvent(e) {
        var key = e.which;
        if (key == 13) {
            $("#btnlogin").click();
        }
    }
    
    function EnterEventOTP(e) {
        var key = e.which;
        if (key == 13) {
            $("#btnOTPVerification").click();
        }
    }

    function EnterEvent122(e) {
        var key = e.which;
        if (key == 13)  // the enter key code
            // $("#btnlogin").click();
        {
            var IsValidation = FormValidation();
            if (IsValidation == false) {
                event.preventDefault();
                $("#divProgress").dialog("close");
            }
            else {
                var username = $("#txtUserID").val();
                var password = $("#txtPwd").val();
                var entityname = $("#txtEntityName").val();
                $.ajax({
                    type: "POST",
                    url: "Default.aspx/ValidateUser",
                    data: '{username:"' + username + '",password:"' + password + '",entityname:"' + entityname + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnSuccessValidateUser,
                    failure: function (response) {
                        alert(response.d);
                    }

                });
                function OnSuccessValidateUser(response) {
                    var objData = JSON.parse(response.d);
                    var count = 0
                    $.each(objData, function (key, value) {
                        if (count == 0) {
                            if (key == 1 && value != "Please SET the default page for login  or contact to the super user") {
                                window.location.href = value;
                                $("#divProgress").dialog("close");
                            }
                            else {
                                $("#lbltopmsg").text('' + value + '');
                                $("#divProgress").dialog("close");
                            }
                            count += 1;
                        }
                    });
                }
            }
            return false;
        }
    }
    function ForgotEnterEvent(e) {
        var key = e.which;
        if (key == 13)  // the enter key code
            $("#btnSubmit").click();
        return false;
    }
    function PopupValidation() {
        if ($("#txtEmailName").val() == '') {
            $("#lblMsgAddFolder").text("Kindly Enter User Id");
            $("#txtEmailName").focus();
            return false;
        }
        else if ($("#txtFEntityName").is(":visible")) {
            if ($("#txtFEntityName").val() == '') {
                $("#lblMsgAddFolder").text("Kindly Enter Customer Code");
                $("#txtFEntityName").focus();
                return false;
            }
        }
         //else if($("#txtCaptcha").val() == null || ("#txtCaptcha").val() == '') { 
         //       $("#lblMsgAddFolder").text("Kindly Code");
         //       $("#txtCaptcha").focus();
         //       return false;
         //   }

    }

    function FormValidation() {
        $("#txtFEntityName").show();
        if ($("#txtUserID").val() == '') {
            $("#lbltopmsg").text("Kindly Enter UserID ");
            $("#txtUserID").focus();
            return false;
        }
        else if ($("#txtPwd").val() == '') {
            $("#lbltopmsg").text("Kindly Enter Password ");
            $("#txtPwd").focus();
            IsValidation = false;
            return IsValidation;
        }
        else if ($("#txtEntityName").is(":visible")) {
            $("#txtFEntityName").hide();
            if ($("#txtEntityName").val() == '') {
                $("#lbltopmsg").text("Kindly Fill Customer Code ");
                $("#txtEntityName").focus();
                return false;
            }
        }
    }
    function ClearAllFields() {
        $("input:text").val("");
        $("input:password").val("");
        $("#txtUserID").focus();
    }
    function ClearOTPFields() {
        $("#txtOTP").val("");
        $("#txtOTP").focus();
    }

    function popup() {
        $("#txtEmailName").val("");
        $("#lblMsgAddFolder").text("");
        $("#modal_dialog").dialog({
            title: "Forgot Password",
            width: 500,
            buttons: {
                Close: function () {
                    $(this).dialog('close');
                }
            },
            modal: true
        });
    }

    function successpopup() {
        $("#success_modal_dialog").dialog({
            title: "Forgot Password Status",
            width: 550,
            buttons: {
                Close: function () {
                    $(this).dialog('close');
                }
            },
            modal: true
        });
    }
    function progressPopup() {		
                $("#divProgress").dialog({		
        	            width: 250,		
        	            height:200,		
        	            modal: true		
                });		
   }

</script>

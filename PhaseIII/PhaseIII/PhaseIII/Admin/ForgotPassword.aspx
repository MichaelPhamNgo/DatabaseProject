<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="PhaseIII.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/bootstrap.min.css" rel="stylesheet" />
    <title>Reset your password</title>
    <style type="text/css">
        .auto-style1 {
            margin-top:50px;
            width: 400px;
            align-content:center;
            background: #4B2E83;
            border-right: 1px solid rgb(230,239,234);
        }       
        .auto-style2{
            padding: 5px 0;
        }
        .auto-style4 {
            display: block;
            font-size: 1rem;
            line-height: 1.5;
            color: #495057;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #ced4da;
            border-radius: .25rem;
            transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
        }
        .auto-style5 {
            height: 26px;
        }
        .auto-style7 {
            width: 165px;
            height: 26px;
        }
        .auto-style8 {
            font-size: x-large;
            color: #FFFFFF;
            text-align: center;
        }
        .auto-style9 {
            padding: 5px 0;
            color: #FFFFFF;
        }
        .auto-style10 {
            padding: 5px 0;
            text-align: center;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1" align="center">
            <tr class="form-group">
                <td width="30" class="auto-style5"></td>
                <td class="auto-style7"></td>
                <td width="30" class="auto-style5"></td>
            </tr>
            <tr class="form-group">
                <td width="30">&nbsp;</td>
                <td class="auto-style8">Reset your password</td>
                <td width="30">&nbsp;</td>
            </tr>
            <tr class="form-group">
                <td width="30">&nbsp;</td>
                <td class="auto-style9">
                    Enter your user account&#39;s verified email address and we will send you a password reset link</td>
                <td width="30">&nbsp;</td>
            </tr>
            <tr>
                <td width="30">&nbsp;</td>
                <td class="auto-style10">
                    <asp:TextBox ID="Password1" runat="server" CssClass="auto-style4" Width="100%" TextMode="Password"></asp:TextBox>
                </td>
                <td width="30">&nbsp;</td>
            </tr>           
            <tr>
                <td width="30">&nbsp;</td>
                <td class="auto-style2">
                    <asp:Button ID="Button1" runat="server" Text="Send password reset email"  CssClass="btn btn-primary btn-block"/>
&nbsp;</td>
                <td width="30">&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>

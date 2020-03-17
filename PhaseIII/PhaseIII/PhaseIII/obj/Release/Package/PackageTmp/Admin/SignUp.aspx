<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="PhaseIII.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create New Account</title>
    <link href="Css/bootstrap.min.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            margin-top:50px;
            width: 500px;
            align-content:center;
            background: #4B2E83;
            border-right: 1px solid rgb(230,239,234);
        }       
        .auto-style2{
            padding: 5px 0;
        }
        .auto-style3 {
            width: 100px;
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
        .auto-style6 {
            width: 100px;
            height: 26px;
        }
        .auto-style7 {
            width: 165px;
            height: 26px;
        }
        .auto-style8 {
            font-size: x-large;
            color: #FFFFFF;
        }
        .auto-style9 {
            width: 100px;
            color: #FFFFFF;
        }
        .auto-style10 {
            color: #FF0000;
        }
        .auto-style11 {
            color: #33CC33;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1" align="center">
            <tr class="form-group">
                <td width="30" class="auto-style5"></td>
                <td class="auto-style6"></td>
                <td class="auto-style7"></td>
                <td width="30" class="auto-style5"></td>
            </tr>
            <tr class="form-group">
                <td width="30">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style8">Create New Account</td>
                <td width="30">&nbsp;</td>
            </tr>
            <tr class="form-group">
                <td width="30">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="lbError" runat="server" style="color: #FF0000"></asp:Label>
                    <asp:Label ID="lbSuccess" runat="server" CssClass="auto-style11"></asp:Label>
                </td>
                <td width="30">&nbsp;</td>
            </tr>
            <tr class="form-group">
                <td width="30">&nbsp;</td>
                <td class="auto-style9">First Name</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtFName" runat="server" CssClass="auto-style4" Width="300px"></asp:TextBox>
                </td>
                <td width="30" class="auto-style10"><strong>(*)</strong></td>
            </tr>
            <tr class="form-group">
                <td width="30">&nbsp;</td>
                <td class="auto-style9">Last Name</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtLName" runat="server" CssClass="auto-style4" Width="300px"></asp:TextBox>
                </td>
                <td width="30" class="auto-style10"><strong>(*)</strong></td>
            </tr
            <tr class="form-group">
                <td width="30">&nbsp;</td>
                <td class="auto-style9">Email</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="auto-style4" Width="300px"></asp:TextBox>
                </td>
                <td width="30" class="auto-style10"><strong>(*)</strong></td>
            </tr>
            <tr>
                <td width="30">&nbsp;</td>
                <td class="auto-style9">Password</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="auto-style4" Width="300px" TextMode="Password"></asp:TextBox>
                </td>
                <td width="30" class="auto-style10"><strong>(*)</strong></td>
            </tr>
            <tr>
                <td width="30">&nbsp;</td>
                <td class="auto-style9">Confirm Password</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtConfirmpassword" runat="server" CssClass="auto-style4" Width="300px" TextMode="Password"></asp:TextBox>
                </td>
                <td width="30" class="auto-style10"><strong>(*)</strong></td>
            </tr>
            <tr>
                <td width="30">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2">
                    <asp:Button ID="btnSignUp" runat="server" Text="Sign Up"  CssClass="btn btn-primary" OnClick="btnSignUp_Click"/>
&nbsp;<asp:Button ID="Button2" runat="server" Text="Cancel" CssClass="btn btn-secondary" />
                </td>
                <td width="30">&nbsp;</td>
            </tr>
            <tr>
                <td width="30">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td width="30">&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>

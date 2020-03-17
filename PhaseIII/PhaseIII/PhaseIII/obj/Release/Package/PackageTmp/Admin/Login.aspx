<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PhaseIII.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/bootstrap.min.css" rel="stylesheet" />
    <title>Login Page</title>
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
                <td class="auto-style8">Sign in to Barber App</td>
                <td width="30">&nbsp;</td>
            </tr>
            <tr class="form-group">
                <td width="30">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="lbError" runat="server" CssClass="auto-style10"></asp:Label>
                </td>
                <td width="30">&nbsp;</td>
            </tr>
            <tr class="form-group">
                <td width="30">&nbsp;</td>
                <td class="auto-style9">Email</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="auto-style4" Width="320px"></asp:TextBox>
                </td>
                <td width="30">&nbsp;</td>
            </tr>
            <tr>
                <td width="30">&nbsp;</td>
                <td class="auto-style9">Password</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="auto-style4" Width="320px" TextMode="Password"></asp:TextBox>
                </td>
                <td width="30">&nbsp;</td>
            </tr>
            <tr>
                <td width="30">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2">
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Admin/ForgotPassword.aspx">Forgot password?</asp:HyperLink>
                </td>
                <td width="30">&nbsp;</td>
            </tr>
            <tr>
                <td width="30">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2">
                    <asp:Button ID="btnLogin" runat="server" Text="Sign In"  CssClass="btn btn-primary" OnClick="btnLogin_Click"/>
&nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" />
                </td>
                <td width="30">&nbsp;</td>
            </tr>
            <tr>
                <td width="30">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2"><span class="text-white">New to Barber App?</span> <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/SignUp.aspx">Create an account</asp:HyperLink>
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

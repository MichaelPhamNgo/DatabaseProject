<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FindBarbers.aspx.cs" Inherits="PhaseIII.FindBarbers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
    .coll-1{
        width:50px;
    }

    .coll-2{
        display: inline-block;
        color: #4B2E83;
        padding:10px;
        width:150px;
        font-weight:600;
    }
    .coll-3 {
        padding:10px;
        font-size:20px;
        color: #4B2E83;
        font-weight:bold;
    }

    </style>
    <table class="table-borderless">
        <tr>
            <td class="coll-1"></td>
            <td class="coll-2"></td>
            <td class="coll-3">Find Barbers With Options</td>
            <td class="coll-1"></td>
        </tr>
        <tr class="form-group">
            <td class="coll-1"></td>
            <td class="coll-2">Price</td>
            <td class="coll-3">
                <select id="Select1" name="D1">
                    <option></option>
                </select></td>
            <td class="col-1"></td>
        </tr>
         <tr class="form-group">
            <td class="coll-1"></td>
            <td class="coll-2">Barber&#39;s Name</td>
            <td class="coll-3">
                <asp:TextBox ID="TextBox2" runat="server" Width="600px" CssClass="form-control"></asp:TextBox>
            </td>
            <td class="col-1"></td>
        </tr>
         <tr class="form-group">
            <td class="coll-1">&nbsp;</td>
            <td class="coll-2">Service</td>
            <td class="coll-3">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="ServiceName" DataValueField="ServiceId" CssClass="form-control">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Services]"></asp:SqlDataSource>
            </td>
            <td class="col-1">&nbsp;</td>
        </tr>
        <tr>
            <td class="coll-1">&nbsp;</td>
            <td class="coll-2">&nbsp;</td>
            <td class="coll-3">
                <asp:Button ID="Button1" runat="server" Text="Search" CssClass="btn btn-primary"/>
&nbsp;<asp:Button ID="Button2" runat="server" Text="Clear" CssClass="btn btn-secondary"/>
            </td>
            <td class="coll-1">&nbsp;</td>
        </tr>
        <tr>
            <td class="coll-1">&nbsp;</td>
            <td class="coll-2">&nbsp;</td>
            <td class="coll-3">&nbsp;</td>
            <td class="coll-1">&nbsp;</td>
        </tr>
        <tr>
            <td class="coll-1">&nbsp;</td>
            <td class="coll-2">&nbsp;</td>
            <td class="coll-3">&nbsp;</td>
            <td class="coll-1">&nbsp;</td>
        </tr>
    </table>
</asp:Content>

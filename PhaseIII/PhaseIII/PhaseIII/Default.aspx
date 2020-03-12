<%@ Page Async="true" Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PhaseIII.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" >
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
            <td class="coll-3">Find Barbers Nearby</td>
            <td class="coll-1"></td>
        </tr>
        <tr class="form-group">
            <td class="coll-1"></td>
            <td class="coll-2">Your current zip code</td>
            <td class="coll-3">
                <asp:TextBox ID="txtSearchZip" runat="server" Width="600px" CssClass="form-control"></asp:TextBox>
            </td>
            <td class="col-1">
                <asp:DropDownList ID="dropDownListRange" runat="server">
                    <asp:ListItem Value="10">Less than 10 miles away</asp:ListItem>
                    <asp:ListItem Value="20">Less than 20 miles away</asp:ListItem>
                    <asp:ListItem Value="30">Less than 30 miles away</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="coll-1">&nbsp;</td>
            <td class="coll-2">&nbsp;</td>
            <td class="coll-3">
                <asp:Button ID="btnSearchZip" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearchZip_Click"/>
&nbsp;<asp:Button ID="Button2" runat="server" Text="Clear" CssClass="btn btn-secondary"/>
            </td>
            <td class="coll-1">&nbsp;</td>
        </tr>
        <tr>
            <td class="coll-1">&nbsp;</td>
            <td class="coll-2" colspan="2">
                <asp:GridView ID="grdViewZip" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <EditRowStyle Wrap="False" />
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" Wrap="False" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"></asp:ObjectDataSource>
            </td>
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

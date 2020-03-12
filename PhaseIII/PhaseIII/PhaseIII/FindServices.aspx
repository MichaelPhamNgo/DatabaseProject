<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FindServices.aspx.cs" Inherits="PhaseIII.FindServices" %>
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

    	.auto-style12 {
			display: inline-block;
			color: #4B2E83;
			padding: 10px;
			width: 98px;
			font-weight: 600;
		}
		.auto-style13 {
			width: 50px;
			height: 50px;
		}
		.auto-style14 {
			display: inline-block;
			color: #4B2E83;
			padding: 10px;
			width: 98px;
			font-weight: 600;
			height: 50px;
		}
		.auto-style15 {
			padding: 10px;
			font-size: 20px;
			color: #4B2E83;
			font-weight: bold;
			height: 50px;
		}

    </style>
    <table class="table-borderless">
        <tr>
            <td class="coll-1"></td>
            <td class="auto-style12"></td>
            <td class="coll-Find Barbers With Options"></td>
            <td class="coll-1"></td>
        </tr>
        <tr class="form-group">
            <td class="coll-1"></td>
            <td class="auto-style12">Maximum Price</td>
            <td class="coll-3">
                <asp:TextBox ID="MaximumPriceBox" runat="server" Width="600px" CssClass="form-control"></asp:TextBox>
            </td>
            <td class="col-1"></td>
        </tr>
         <tr class="form-group">
            <td class="coll-1"></td>
            <td class="auto-style12">Minimum Price</td>
            <td class="coll-3">
                <asp:TextBox ID="MinimumPriceBox" runat="server" Width="600px" CssClass="form-control"></asp:TextBox>
            </td>
            <td class="col-1"></td>
        </tr>
         <tr class="form-group">
            <td class="coll-1">&nbsp;</td>
            <td class="auto-style12">Service Type</td>
            <td class="coll-3">
                <asp:DropDownList ID="ServiceList" runat="server" DataSourceID="SqlDataSource1" DataTextField="ServiceName" DataValueField="ServiceId" CssClass="form-control">
					<asp:ListItem Value="-1">Any</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Services]"></asp:SqlDataSource>
            </td>
            <td class="col-1">&nbsp;</td>
        </tr>
        <tr>
            <td class="coll-1">&nbsp;</td>
            <td class="auto-style12">&nbsp;</td>
            <td class="coll-3">
                <asp:Button ID="SearchButton" OnClick="SearchButton_Click" runat="server" Text="Search" CssClass="btn btn-primary"/>
&nbsp;<asp:Button ID="ClearButton" OnClick="ClearButton_Click" runat="server" Text="Clear" CssClass="btn btn-secondary"/>
            </td>
            <td class="coll-1">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13"></td>
            <td class="auto-style14"></td>
            <td class="auto-style15">
				<asp:GridView ID="SearchResults" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
					<AlternatingRowStyle BackColor="#F7F7F7" />
					<FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
					<HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
					<PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
					<RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
					<SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
					<SortedAscendingCellStyle BackColor="#F4F4FD" />
					<SortedAscendingHeaderStyle BackColor="#5A4C9D" />
					<SortedDescendingCellStyle BackColor="#D8D8F0" />
					<SortedDescendingHeaderStyle BackColor="#3E3277" />
				</asp:GridView>
			</td>
            <td class="auto-style13"></td>
        </tr>
        <tr>
            <td class="coll-1">&nbsp;</td>
            <td class="auto-style12">&nbsp;</td>
            <td class="coll-3">&nbsp;</td>
            <td class="coll-1">&nbsp;</td>
        </tr>
    </table>
</asp:Content>

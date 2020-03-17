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

    	.auto-style12 {
			display: inline-block;
			color: #4B2E83;
			padding: 10px;
			width: 98px;
			font-weight: 600;
		}
				
    </style>
    <table class="table-borderless">
        <tr>
            <td class="coll-1"></td>
            <td class="coll-2"></td>
            <td class="coll-3">Find Barbers Nearby With Price And Service Amount</td>
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
            <td class="auto-style12">Maximum Service Amount</td>
            <td class="coll-3">
                <asp:TextBox ID="MaximumServiceBox" runat="server" Width="600px" CssClass="form-control"></asp:TextBox>
            </td>
            <td class="col-1">&nbsp;</td>
        </tr>
         <tr class="form-group">
            <td class="coll-1">&nbsp;</td>
            <td class="auto-style12">Minimum Service Amount</td>
            <td class="coll-3">
                <asp:TextBox ID="MinimumServiceBox" runat="server" Width="600px" CssClass="form-control"></asp:TextBox>
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
            <td colspan="4">
				<asp:GridView ID="SearchResults" runat="server" AutoGenerateColumns="False" CellPadding="3" GridLines="Horizontal" Width="100%" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px">
					<AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>                        
                    <asp:TemplateField HeaderText="First Name">
                        <ItemTemplate>  
                            <asp:Label runat="server" Text='<%# Eval("FName") %>'></asp:Label>  
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="FName" runat="server" Text='<%# Eval("FName") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Name">
                        <ItemTemplate>  
                            <asp:Label runat="server" Text='<%# Eval("LName") %>'></asp:Label>  
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="LName" runat="server" Text='<%# Eval("LName") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>                    
                    <asp:TemplateField HeaderText="Services Offered">
                        <ItemTemplate>  
                            <asp:Label runat="server" Text='<%# Eval("ServicesOffered") %>'></asp:Label>  
                        </ItemTemplate>    
                        <EditItemTemplate>
                            <asp:TextBox ID="ServicesOffered" runat="server" Text='<%# Eval("ServicesOffered") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Average Price">
                        <ItemTemplate>  
                            <asp:Label runat="server" Text='<%# Eval("AveragePrice") %>'></asp:Label>  
                        </ItemTemplate>    
                        <EditItemTemplate>
                            <asp:TextBox ID="AveragePrice" runat="server" Text='<%# Eval("AveragePrice") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                        <asp:CommandField HeaderText="Select Barber" ShowSelectButton="True" />
                    </Columns>
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
        </tr>
        <tr>
            <td class="coll-1">&nbsp;</td>
            <td class="auto-style12">&nbsp;</td>
            <td class="coll-3">&nbsp;</td>
            <td class="coll-1">&nbsp;</td>
        </tr>
    </table>
</asp:Content>

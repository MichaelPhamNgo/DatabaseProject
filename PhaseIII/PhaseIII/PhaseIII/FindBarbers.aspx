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
		.auto-style13 {
			width: 50px;
			height: 50px;
		}
		.auto-style14 {
			display: inline-block;
			color: #4B2E83;
			padding: 10px;
			font-weight: 600;
			height: 50px;
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
            <td colspan="4">
				<asp:GridView ID="SearchResults" runat="server" AutoGenerateColumns="False" CellPadding="3" GridLines="Horizontal" Width="100%" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px">
					<AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="BarBerID" runat="server" Text='<%# Eval("UserId") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>
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
                    <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>  
                        <asp:Label runat="server" Text='<%# Eval("Email") %>'></asp:Label>  
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="Phone" runat="server" Text='<%# Eval("Email") %>'></asp:TextBox>
                    </EditItemTemplate>
                    </asp:TemplateField>    
                    <asp:TemplateField HeaderText="Phone">
                        <ItemTemplate>  
                            <asp:Label runat="server" Text='<%# Eval("Phone") %>'></asp:Label>  
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Phone" runat="server" Text='<%# Eval("Phone") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>   
                    <asp:TemplateField HeaderText="Style" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
                        <EditItemTemplate>
                            <asp:FileUpload ID="URL" runat="server" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ImageUrl='<%# "Admin/Pictures/" + (Eval("URL").ToString().Length == 0 ? "NoImage.png" : Eval("URL").ToString()) %>' runat="server" Height = "50" Width = "50" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Service Length">
                        <ItemTemplate>  
                            <asp:Label runat="server" Text='<%# Eval("ServiceLength") %>'></asp:Label>  
                        </ItemTemplate>    
                        <EditItemTemplate>
                            <asp:TextBox ID="Latitude" runat="server" Text='<%# Eval("ServiceLength") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Price">
                        <ItemTemplate>  
                            <asp:Label runat="server" Text='<%# Eval("Price") %>'></asp:Label>  
                        </ItemTemplate>    
                        <EditItemTemplate>
                            <asp:TextBox ID="Longtitude" runat="server" Text='<%# Eval("Price") %>'></asp:TextBox>
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

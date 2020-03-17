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
        width: 150px;
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
            font-weight: 600;
        }
        .auto-style13 {
            color: #FF0000;
        }

    </style>
    <table class="table-borderless">
        <tr>
            <td class="coll-1"></td>
            <td class="coll-2"></td>
            <td class="coll-3">Find Barbers Nearby</td>
            <td class="coll-1"></td>
        </tr>
        <tr>
            <td class="coll-1">&nbsp;</td>
            <td>&nbsp;</td>
            <td><asp:Label ID="lbError" runat="server" CssClass="auto-style13"></asp:Label></td>
            <td class="coll-1">&nbsp;</td>
        </tr>
        <tr class="form-group">
            <td class="coll-1"></td>
            <td class="coll-2">Your current zip code</td>
            <td class="coll-3">
                <asp:TextBox ID="txtSearchZip" runat="server" Width="600px" CssClass="form-control"></asp:TextBox>
            </td>
            <td class="col-1">
                &nbsp;</td>
        </tr>
        <tr class="form-group">
            <td class="coll-1">&nbsp;</td>
            <td class="coll-2">Distance</td>
            <td class="coll-3">
                <asp:DropDownList ID="dropDownListRange" runat="server" CssClass="form-control">
                    <asp:ListItem Value="100">--- Select the distance ---</asp:ListItem>
                    <asp:ListItem Value="10">Less than 10 miles away</asp:ListItem>
                    <asp:ListItem Value="20">Less than 20 miles away</asp:ListItem>
                    <asp:ListItem Value="30">Less than 30 miles away</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="col-1">
                &nbsp;</td>
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
            <td colspan="4">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="3" GridLines="Horizontal" Width="100%" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px">
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
                    <asp:TemplateField HeaderText="Phone">
                        <ItemTemplate>  
                            <asp:Label runat="server" Text='<%# Eval("Phone") %>'></asp:Label>  
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Phone" runat="server" Text='<%# Eval("Phone") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>                   
                    <asp:TemplateField HeaderText="Latitude">
                        <ItemTemplate>  
                            <asp:Label runat="server" Text='<%# Eval("Lat") %>'></asp:Label>  
                        </ItemTemplate>    
                        <EditItemTemplate>
                            <asp:TextBox ID="Latitude" runat="server" Text='<%# Eval("Lat") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Longtitude">
                        <ItemTemplate>  
                            <asp:Label runat="server" Text='<%# Eval("Lon") %>'></asp:Label>  
                        </ItemTemplate>    
                        <EditItemTemplate>
                            <asp:TextBox ID="Longtitude" runat="server" Text='<%# Eval("Lon") %>'></asp:TextBox>
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
            <td class="coll-2">&nbsp;</td>
            <td class="coll-3">&nbsp;</td>
            <td class="coll-1">&nbsp;</td>
        </tr>
    </table>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="PhaseIII.Admin.User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style16 {
            width: 565px;
            padding: 5px 10px;
        }
    .auto-style12 {
        width: 126px;
    }
        .auto-style13 {
            width: 126px;
            background: #4B2E83;
            height: 38px;
            padding: 10px;
            font-weight: 600;
            border: 1px solid #ffffff;
        }
    
    .btn-primary {
        background: #4B2E83;
        border:1px solid #4B2E83;
    }

        .auto-style17 {
            width: 565px;
            padding: 5px 10px;
            height: 38px;
        }

        .auto-style18 {
            width: 260px;
        }
        .auto-style19 {
            width: 260px;
            height: 20px;
        }
        .auto-style20 {
            height: 20px;
        }

        .auto-style21 {
            color: #33CC33;
        }

        .auto-style22 {
            color: red;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="w-100">
    
    <tr>
        <td>            
            <table>
                <tr>
                    <td style="width:20px;">&nbsp;</td>
                    <td>
            <table>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lbError" runat="server" CssClass="auto-style22"></asp:Label>
                        <asp:Label ID="lbSubmitSuccess" runat="server" CssClass="auto-style21"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13">First Name</td>
                    <td class="auto-style17">
                        <asp:TextBox ID="txtFName" class="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13">Last name</td>
                    <td class="auto-style16">
                        <asp:TextBox ID="txtLName" class="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13">Email</td>
                    <td class="auto-style16">
                        <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13">Password</td>
                    <td class="auto-style16">
                        <asp:TextBox ID="txtPassword" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13">Confirm Password</td>
                    <td class="auto-style16">
                        <asp:TextBox ID="txtConfirmpassword" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13">Picture</td>
                    <td class="auto-style16">
                        <asp:FileUpload ID="textFile" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13">Phone</td>
                    <td class="auto-style16">
                        <asp:TextBox ID="txtPhone" class="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13">Group Name</td>
                    <td class="auto-style16"><asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="GroupID" CssClass="form-control">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [GroupID], [Name] FROM [Groups]"></asp:SqlDataSource>
                        </td>
                </tr>
                <tr>
                    <td class="auto-style12">&nbsp;</td>
                    <td class="auto-style16">
                        <asp:Button ID="btnSubmit" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSubmit_Click"/>&nbsp;&nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary"/>
                    </td>
                </tr>
            </table>


                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>

            <table class="w-100">
                <tr>
                    <td class="auto-style18">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style19">
                        <asp:TextBox ID="txtSearch" runat="server" class="form-control"></asp:TextBox>
                    </td>
                    <td class="auto-style20">
                        &nbsp;&nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-success" OnClick="btnSearch_Click"/></td>
                </tr>
                <tr>
                    <td class="auto-style18">
                        <asp:Label ID="lbSuccess" runat="server" CssClass="auto-style21"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>

        </td>
    </tr>    
    <tr>
        <td>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="UserId" GridLines="Horizontal" Width="100%" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDataBound="GridView1_RowDataBound">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="UserId" runat="server" Text='<%# Eval("UserId") %>'></asp:Label>
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
                            <asp:TextBox ID="Email" runat="server" Text='<%# Eval("Email") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Picture" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
                        <EditItemTemplate>
                            <asp:FileUpload ID="URL" runat="server" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ImageUrl='<%# "Pictures/" + (Eval("URL").ToString().Length == 0 ? "NoImage.png" : Eval("URL").ToString()) %>' runat="server" Height = "50" Width = "50" />
                        </ItemTemplate>
<ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone">
                        <ItemTemplate>  
                            <asp:Label runat="server" Text='<%# Eval("Phone") %>'></asp:Label>  
                        </ItemTemplate>    
                        <EditItemTemplate>
                            <asp:TextBox ID="Phone" runat="server" Text='<%# Eval("Phone") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Group Name">
                        <EditItemTemplate>
                            <asp:DropDownList ID="GroupName" runat="server">  
                        </asp:DropDownList>  
                        </EditItemTemplate>
                        <ItemTemplate>  
                            <asp:Label runat="server" Text='<%# Eval("GroupName") %>'></asp:Label>  
                        </ItemTemplate>
                        
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Image" CancelImageUrl="~/Admin/Images/canel.png" EditImageUrl="~/Admin/Images/edit.png" ShowEditButton="True" UpdateImageUrl="~/Admin/Images/Save.png" />
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Admin/Images/remove.png" ShowDeleteButton="True" />
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
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>

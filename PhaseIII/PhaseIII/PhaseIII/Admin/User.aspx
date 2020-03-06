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
                    <td class="auto-style13">First Name</td>
                    <td class="auto-style16">
                        <input id="Text1" class="form-control" type="text" /></td>
                </tr>
                <tr>
                    <td class="auto-style13">Last name</td>
                    <td class="auto-style16">
                        <input id="Text2" class="form-control" type="text" /></td>
                </tr>
                <tr>
                    <td class="auto-style13">Email</td>
                    <td class="auto-style16">
                        <input id="Text3" class="form-control" type="text" /></td>
                </tr>
                <tr>
                    <td class="auto-style13">Password</td>
                    <td class="auto-style16">
                        <input id="Text4" class="form-control" type="text" /></td>
                </tr>
                <tr>
                    <td class="auto-style13">Confirm Password</td>
                    <td class="auto-style16">
                        <input id="Text5" class="form-control" type="text" /></td>
                </tr>
                <tr>
                    <td class="auto-style13">Picture</td>
                    <td class="auto-style16">
                        <input id="Text6" class="form-control-file" type="file" /></td>
                </tr>
                <tr>
                    <td class="auto-style13">Phone</td>
                    <td class="auto-style16">
                        <input id="Text7" class="form-control" type="text" />
                        
                        </td>
                </tr>
                <tr>
                    <td class="auto-style13">Group Name</td>
                    <td class="auto-style16"><asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="GroupID" CssClass="form-control">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Groups]"></asp:SqlDataSource>
                        </td>
                </tr>
                <tr>
                    <td class="auto-style13">Current Location</td>
                    <td class="auto-style16">
                        <input id="Text8" class="form-control" type="text" /></td>
                </tr>
                <tr>
                    <td class="auto-style12">&nbsp;</td>
                    <td class="auto-style16">
                        <asp:Button ID="btnSubmit" runat="server" Text="Save" CssClass="btn btn-primary"/>
&nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary"/>
&nbsp;&nbsp;</td>
                </tr>
            </table>


                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style="width:20px;">&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ID" DataSourceID="SqlDataSource2" GridLines="Horizontal" Width="790px" AllowPaging="True" HorizontalAlign="Center" OnRowEditing="GridView1_RowEditing">
                <AlternatingRowStyle BackColor="#F7F7F7"/>
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="First Name" HeaderText="First Name" SortExpression="First Name" />
                    <asp:BoundField DataField="Last Name" HeaderText="Last Name" SortExpression="Last Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="URL" HeaderText="URL" SortExpression="URL" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Group Name" HeaderText="Group Name" SortExpression="Group Name" />
                    <asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude" />
                    <asp:BoundField DataField="Longtitude" HeaderText="Longtitude" SortExpression="Longtitude" />
                    <asp:CommandField ButtonType="Image" CancelImageUrl="~/Admin/Images/canel.png" EditImageUrl="~/Admin/Images/edit.png" ShowEditButton="True" UpdateImageUrl="~/Admin/Images/Save.png" />
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Admin/Images/delete.png" ShowDeleteButton="True" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Users.UserId AS ID, Users.FName AS 'First Name', Users.LName As 'Last Name', Users.Email, Users.URL, Users.Phone, Groups.Name AS 'Group Name', Locations.Latitude, Locations.Longtitude FROM Users INNER JOIN Groups ON Users.GroupId = Groups.GroupID INNER JOIN Locations ON Users.CurrentLocation = Locations.LocationId"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>

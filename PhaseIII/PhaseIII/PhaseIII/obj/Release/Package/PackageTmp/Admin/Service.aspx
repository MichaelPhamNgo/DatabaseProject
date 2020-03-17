<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Service.aspx.cs" Inherits="PhaseIII.Admin.Service" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
    <table class="w-100">
    
    <tr>
        <td>            
            <table>
                <tr>
                    <td style="width:20px;">&nbsp;</td>
                    <td>
            <table>
                <tr>
                    <td class="auto-style13">Group Name</td>
                    <td class="auto-style16">
                        <input id="Text8" class="form-control" type="text" /></td>
                </tr>
                <tr>
                    <td class="auto-style13">Description</td>
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
           
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ServiceId" DataSourceID="SqlDataSource1" GridLines="Horizontal" Width="790px">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="ServiceId" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ServiceId" />
                    <asp:BoundField DataField="ServiceName" HeaderText="Service Name" SortExpression="ServiceName" />
                    <asp:TemplateField HeaderText="Style" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
                        <EditItemTemplate>
                            <asp:FileUpload ID="URL" runat="server" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ImageUrl='<%# "Pictures/" + (Eval("URL").ToString().Length == 0 ? "NoImage.png" : Eval("URL").ToString()) %>' runat="server" Height = "50" Width = "50" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ServiceLength" HeaderText="Service Length (Hours)" SortExpression="ServiceLength" />
                    <asp:CommandField ButtonType="Image" CancelImageUrl="~/Admin/Images/canel.png" DeleteImageUrl="~/Admin/Images/delete.png" EditImageUrl="~/Admin/Images/edit.png" ShowEditButton="True" UpdateImageUrl="~/Admin/Images/Save.png" />
                    <asp:CommandField ButtonType="Image" CancelImageUrl="~/Admin/Images/canel.png" DeleteImageUrl="~/Admin/Images/delete.png" ShowDeleteButton="True" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Services]"></asp:SqlDataSource>
           
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>

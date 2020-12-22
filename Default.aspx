<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="userid" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="userid" HeaderText="userid" ReadOnly="True" SortExpression="userid" />
                    <asp:BoundField DataField="pwd" HeaderText="pwd" SortExpression="pwd" />
                    <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                    <asp:BoundField DataField="phone_agency" HeaderText="phone_agency" SortExpression="phone_agency" />
                    <asp:BoundField DataField="phone_num" HeaderText="phone_num" SortExpression="phone_num" />
                    <asp:BoundField DataField="add_num" HeaderText="add_num" SortExpression="add_num" />
                    <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyDBConnectionString %>" DeleteCommand="DELETE FROM [join_member] WHERE [userid] = @userid" InsertCommand="INSERT INTO [join_member] ([userid], [pwd], [username], [phone_agency], [phone_num], [add_num], [address], [email]) VALUES (@userid, @pwd, @username, @phone_agency, @phone_num, @add_num, @address, @email)" SelectCommand="SELECT * FROM [join_member]" UpdateCommand="UPDATE [join_member] SET [pwd] = @pwd, [username] = @username, [phone_agency] = @phone_agency, [phone_num] = @phone_num, [add_num] = @add_num, [address] = @address, [email] = @email WHERE [userid] = @userid">
                <DeleteParameters>
                    <asp:Parameter Name="userid" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="userid" Type="String" />
                    <asp:Parameter Name="pwd" Type="String" />
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter Name="phone_agency" Type="String" />
                    <asp:Parameter Name="phone_num" Type="String" />
                    <asp:Parameter Name="add_num" Type="Int32" />
                    <asp:Parameter Name="address" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="pwd" Type="String" />
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter Name="phone_agency" Type="String" />
                    <asp:Parameter Name="phone_num" Type="String" />
                    <asp:Parameter Name="add_num" Type="Int32" />
                    <asp:Parameter Name="address" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="userid" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>

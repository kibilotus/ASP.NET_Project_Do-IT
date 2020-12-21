
﻿<%@ Page Language="C#"%>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>
<script runat="server">
    protected void login_Click(object sender, EventArgs e)
    {
        this.login.PostBackUrl = "~/login.aspx";
    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Do IT - IT 교육의 시작</title>
    <style>
        body {
            background-color:whitesmoke;
        }
        #logo {
            width:300px;
            display:block;
            margin-right:auto;
            margin-left:auto;
        
        }

        #list {
            width:90%;
            height:50px;
            font-size:30px;
            text-align:center;
            background:#CCCCCC;
            border-radius:30px 30px 30px 30px;
            margin-top:20px;
            margin-left:auto;
            margin-right:auto;
            border-width:1px;
            
        }

        .login {
            width:300px;
            height:50px;
            margin-top:10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-top:300px;">
            <asp:Table ID="Table1" runat="server" width="500px" height="450px" BackColor="White" align="center" BorderWidth="2">
                <asp:TableRow Height="100px">
                    <asp:TableCell>
                        <div id="header">
                            <asp:ImageButton ID="logo" runat="server" PostBackUrl="~/Main.aspx" ImageUrl="~/imgs/logo1.jpg" />
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow Height="200px">
                    <asp:TableCell HorizontalAlign="Center">
                            <asp:Label ID="Label1" runat="server" Text="회원가입을 축하드립니다" ForeColor="navy" Font-Size="25px"></asp:Label><br /><br />
                            <asp:Button ID="login" runat="server" Text="로그인 페이지로 이동하시겠습니까?" style="background-color:navy; color:white;" CssClass="login" OnClick="login_Click" /><br /><br />
                            
                            <a href="main.aspx">메인으로 이동</a><br /><br /><br /><br />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
</body>

﻿<%@ Page Language="C#"%>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>
<script runat="server">
    protected void login_Click(object sender, EventArgs e)
    {
        this.login.PostBackUrl = "~/login.aspx";
    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Do IT - IT 교육의 시작</title>
    <style>
        body {
            background-color:whitesmoke;
        }
        #logo {
            width:300px;
            display:block;
            margin-right:auto;
            margin-left:auto;
        
        }

        #list {
            width:90%;
            height:50px;
            font-size:30px;
            text-align:center;
            background:#CCCCCC;
            border-radius:30px 30px 30px 30px;
            margin-top:20px;
            margin-left:auto;
            margin-right:auto;
            border-width:1px;
            
        }

        .login {
            width:300px;
            height:50px;
            margin-top:10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-top:300px;">
            <asp:Table ID="Table1" runat="server" width="500px" height="450px" BackColor="White" align="center" BorderWidth="2">
                <asp:TableRow Height="100px">
                    <asp:TableCell>
                        <div id="header">
                            <asp:ImageButton ID="logo" runat="server" PostBackUrl="~/Main.aspx" ImageUrl="~/imgs/logo1.jpg" />
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow Height="200px">
                    <asp:TableCell HorizontalAlign="Center">
                            <asp:Label ID="Label1" runat="server" Text="회원가입을 축하드립니다" ForeColor="navy" Font-Size="25px"></asp:Label><br /><br />
                            <asp:Button ID="login" runat="server" Text="로그인 페이지로 이동하시겠습니까?" style="background-color:navy; color:white;" CssClass="login" OnClick="login_Click" /><br /><br />
                            
                            <a href="main.aspx">메인으로 이동</a><br /><br /><br /><br />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>
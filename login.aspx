<%@ Page Language="C#"%>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>
<script runat="server">
    SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS; Initial Catalog=MyDB; Integrated Security = False; uid=nayeon; pwd=201807038;");// sqlConnection 개체 생성
    
    protected void login_Click(object sender, EventArgs e)
    {
        if (IsAuthenticated(UserID.Text, Pwd.Text))
        {
            
            FormsAuthentication.RedirectFromLoginPage(UserID.Text,CheckBox1.Checked);
        }
        else {
            Label1.Text = "아이디와 암호가 일치하지 않습니다.";
            Label1.ForeColor =System.Drawing.Color.Red;
        }
    }
    bool IsAuthenticated(string UserID, string Pwd) {
        string sql = "select count(UserID) From join_member where UserID=@UserID and Pwd=@Pwd";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@UserID", UserID);
        cmd.Parameters.AddWithValue("@Pwd", Pwd);
        con.Open();
        int count = (int)cmd.ExecuteScalar();
        con.Close();

        return count >0;
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
                <asp:TableRow>
                    <asp:TableCell>
                        <div id="header" >
                            <asp:ImageButton ID="logo" runat="server" PostBackUrl="~/Main.aspx" ImageUrl="~/imgs/logo1.jpg" />
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Center">
                            <asp:TextBox ID="UserID" runat="server" CssClass="login" placeholder="아이디" /><br />
                            <asp:TextBox ID="Pwd" runat="server"  CssClass="login"  placeholder="비밀번호" TextMode="Password"/><br /><br />
                            <asp:CheckBox ID="CheckBox1" runat="server" />로그인 상태 유지<br />
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                            <asp:Button ID="login" runat="server" Text="로그인"  CssClass="login" OnClick="login_Click" /><br /><br />
                            아직 DoIT 회원이 아니신가요?
                            <a href="join_main.aspx">회원가입하기</a>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>
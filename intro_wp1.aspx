<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<script runat="server">
     SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS; Initial Catalog=MyDB; Integrated Security = True;");

    protected void Page_Load(Object sender, EventArgs e) {
        if(Page.User.Identity.IsAuthenticated)
        {
            Label1.Text= Page.User.Identity.Name + "님 환영합니다!";
            Label1.Visible = true;
            logout_btn.Visible = true;
            login_btn.Visible = false;
            join_btn.Visible = false;

            
        }
        else{
            Label1.Visible = false;
            logout_btn.Visible = false;
            login_btn.Visible = true;
            join_btn.Visible = true;
        }
    }

    protected void login_btn_click(Object sender,EventArgs e){
        this.login_btn.PostBackUrl = "~/login.aspx";
    }

    protected void join_btn_click(Object sender,EventArgs e){
        this.join_btn.PostBackUrl = "~/join_main.aspx";
    }

    protected void logout_btn_click(Object sender,EventArgs e){
        FormsAuthentication.SignOut();
        Response.Redirect(FormsAuthentication.LoginUrl);
    }

    protected void join_class_click(Object sender,EventArgs e){
        if (Page.User.Identity.IsAuthenticated)
        {
            string sql = "Insert into application(userid,classnum,applidate,classcomple)Values(@userid,20200201,@applidate,@classcomple)";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@userid", Page.User.Identity.Name);
            cmd.Parameters.AddWithValue("@applidate", DateTime.Now.ToShortDateString());
            cmd.Parameters.AddWithValue("@classcomple", "수강중");

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            sql = "update class set peoplecount+=1 where classnum=20200201";
            cmd = new SqlCommand(sql, con);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/myPage.aspx");
        }
        else {
            Response.Redirect("~/login.aspx");
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Do IT - IT 교육의 시작</title>
    <link href="DoIT.css" rel="stylesheet" />
    <style>
        .class_name {
            width:110px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Table ID="Table1" runat="server" Width="80%" HorizontalAlign="Center">
                <asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                        <div id="login" style="float: right; ">
                            <asp:Button ID="login_btn" runat="server" Text="로그인   /" OnClick="login_btn_click" />  <asp:Button ID="join_btn" runat="server" Text="회원가입" OnClick="join_btn_click" /> 
                        </div>
                        <div id="logout" style="float: right;">
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label><asp:Button ID="logout_btn" runat="server" Text="로그아웃" OnClick="logout_btn_click" />
                        </div>
                </asp:TableCell>
            </asp:TableRow>
                <asp:TableRow >
                    <asp:TableCell ColumnSpan="2">
                        <asp:ImageButton ID="logo" runat="server" PostBackUrl="~/Main.aspx" ImageUrl="~/imgs/logo1.jpg" /></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center" ColumnSpan="3">
                            <div id="list" >
                                <asp:Menu ID="Mainmenu" runat="server" Orientation="Horizontal" 
                                    StaticMenuItemStyle-HorizontalPadding="50px" StaticMenuStyle-HorizontalPadding="230px" DynamicMenuItemStyle-HorizontalPadding="70px" 
                                    DynamicHoverStyle-ForeColor="White" DynamicMenuItemStyle-ForeColor="Gray" StaticHoverStyle-ForeColor="White" StaticMenuItemStyle-ForeColor="Gray">
                                    <Items>
                                            <asp:MenuItem NavigateUrl="~/intro_wp1.aspx" Text="웹 프로그래밍" Value="웹 프로그래밍">
                                                <asp:MenuItem NavigateUrl="~/intro_wp1.aspx" Text="자바스크립트" Value="자바스크립트"></asp:MenuItem>
                                                <asp:MenuItem NavigateUrl="~/intro_wp2.aspx" Text="CSS" Value="CSS"></asp:MenuItem>
                                                <asp:MenuItem NavigateUrl="~/intro_wp3.aspx" Text="ASP.NET" Value="ASP.NET"></asp:MenuItem>
                                            </asp:MenuItem>
                                            <asp:MenuItem NavigateUrl="~/intro_pl1.aspx" Text="프로그래밍 언어" Value="프로그래밍 언어">
                                                <asp:MenuItem NavigateUrl="~/intro_pl1.aspx" Text="파이썬" Value="파이썬"></asp:MenuItem>
                                                <asp:MenuItem NavigateUrl="~/intro_pl2.aspx" Text="C언어" Value="C언어"></asp:MenuItem>
                                                <asp:MenuItem NavigateUrl="~/intro_pl3.aspx" Text="자바" Value="자바"></asp:MenuItem>
                                            </asp:MenuItem>
                                            <asp:MenuItem NavigateUrl="list.aspx" Text="공지사항" Value="공지사항"></asp:MenuItem>
                                
                                        <asp:MenuItem NavigateUrl="myPage.aspx" Text="내 강의실" Value="내 강의실"></asp:MenuItem>
                                    </Items>
                                </asp:Menu>
                             </div>
                         </asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell style="background-color:whitesmoke;" HorizontalAlign="Right" >
                        <div style="margin-right:30px;">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/imgs/WP1.jpg"  Width="500px" Height="350px"/>
                        </div>
                        
                    </asp:TableCell>
                    <asp:TableCell style="width:50%; height:500px; background-color:whitesmoke;" >
                        <div>
                            <div style=" margin-left:30px;">
                                    <b style="font-size:40px">Lv.1 Intro to Web Programming</b> <br /> <br />
                                    <div class="class_name">#JavaScript</div><br />
                                    웹 프로그래밍이 처음이라면, 여기서부터 시작하세요!<br /> 기본 문법을 통한 자바스크립트 기본에 대해 배울 수 있습니다.<br />
                                    JavaScript를 활용한 코딩 프로젝트를 통하여 누구나 시작할 수 있습니다.
                            </div>
                            <div>
                                <asp:Button ID="join_class" runat="server" Text="내 강의실에 담기" />
                            </div>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2" HorizontalAlign="center">
		                <div class="sub1">
			                <ul>
				                <li><a href="#a">강의 소개</a></li>
				                <li><a href="#b">교육 과정</a></li>
				                <li><a href="#c">수강 후기</a></li>
				                <li><a href="#d">질문 & 답변</a></li>
			                </ul>
		                </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow >
                    <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                        <a name="a"></a>
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/imgs/intro_wp1.jpg" width="1500px"/>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>

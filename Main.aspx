<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e) {
        if (Page.User.Identity.IsAuthenticated)
        {
            Label1.Text= Page.User.Identity.Name + "님 환영합니다!";
            Label1.Visible = true;
            logout_btn.Visible = true;
            login_btn.Visible = false;
            join_btn.Visible = false;
        }
        else {
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



</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Do IT - IT 교육의 시작</title>
<link href="DoIT.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:Table ID="Table1" runat="server" width="90%" align="center">
            <asp:TableRow>
                <asp:TableCell ColumnSpan="3">
                        <div id="login" style="float: right; ">
                            <asp:Button ID="login_btn" runat="server" Text="로그인   /" OnClick="login_btn_click" />  <asp:Button ID="join_btn" runat="server" Text="회원가입" OnClick="join_btn_click" /> 
                        </div>
                        <div id="logout" style="float: right;">
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label><asp:Button ID="logout_btn" runat="server" Text="로그아웃" OnClick="logout_btn_click" />
                        </div>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="3">
                    <div id="header" >
                        <asp:ImageButton ID="logo" runat="server" PostBackUrl="~/Main.aspx" ImageUrl="~/imgs/logo1.jpg" />
                    </div>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Center" ColumnSpan="3">
                    <div id="list" >
                        <asp:Menu ID="Mainmenu" runat="server" Orientation="Horizontal" 
                            StaticMenuItemStyle-HorizontalPadding="80px" StaticMenuStyle-HorizontalPadding="250px" DynamicMenuItemStyle-HorizontalPadding="100px" 
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
                <asp:TableCell HorizontalAlign="Center" ColumnSpan="3">
                            <asp:Image ImageUrl="imgs/banner.gif" runat="server" Width="90%" style="margin-top:30px"/>
                 </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <div style="margin-left:100px; margin-top:50px;">
                        <h1>BEST 강의</h1>
                    </div>
                 </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell>
                    <div>
                        <a href="intro_wp1.aspx"><asp:Image ImageUrl="imgs/WP1.jpg" runat="server"/></a><br /><br />
                        <a href="intro_wp1.aspx">웹 브라우저 Javascript</a>
                    </div>
                </asp:TableCell>
                <asp:TableCell>
                    <div>
                        <a href="intro_wp2.aspx"><asp:Image ImageUrl="imgs/WP2.jpg" runat="server"/></a><br /><br />
                        <a href="intro_wp2.aspx">처음 시작하는 CSS Tutorials</a>
                    </div>
                </asp:TableCell>
                <asp:TableCell>
                    <div>
                        <a href="intro_wp3.aspx"><asp:Image ImageUrl="imgs/WP3.jpg" runat="server"/></a><br /><br />
                        <a href="intro_wp3.aspx">ASP.NET 웹 개발 기본 강좌</a>
                    </div>
                 </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell>
                    <div>
                        <a href="intro_pl1.aspx"><asp:Image ImageUrl="imgs/PL1.jpg" runat="server"/></a><br /><br />
                        <a href="intro_pl1.aspx">입문자를 위한 파이썬 기초 따라잡기</a>
                    </div>
                </asp:TableCell>
                <asp:TableCell>
                    <div>
                        <a href="intro_pl2.aspx"><asp:Image runat="server" ImageUrl="imgs/PL2.jpg"/></a><br /><br />
                        <a href="intro_pl2.aspx">처음 시작하는 C언어</a>
                    </div>
                </asp:TableCell>
                <asp:TableCell>
                    <div>
                        <a href="intro_pl3.aspx"><asp:Image ImageUrl="imgs/PL3.jpg" runat="server"/></a><br /><br />
                        <a href="intro_pl3.aspx">자바 프로그래밍 입문 강좌-<br />초보부터 개발자 취업까지!</a>
                    </div>
                 </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                        <asp:TableCell ColumnSpan="3" BackColor="LightGray" Height="200px" HorizontalAlign="Center">
                                
                                    <asp:Image ImageUrl="~/imgs/logo.png" runat="server" Width="300px" style="margin-left:-400px"/>
                                
			                        <div class="footer-msg">
				                        (주)두잇 대표이사 서나연 사업자 등록번호 2018-070-38 <br/>
				                        (14780)경기도 부천시 경인로 590(괴안동) 나눔관 4층 | Tel. 02-2610-0778 | Fax. 02-2610-0778 <br/>
				                        Copyright(c) Seocurity Corp. AllRights Reserved
			                        </div>
                                
                         </asp:TableCell>
            </asp:TableRow>
            </asp:Table>
    </form>
</body>
</html>


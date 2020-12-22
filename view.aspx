<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<script runat="server">
    SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS; Initial Catalog=MyDB; Integrated Security =true");// sqlConnection 개체 생성

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
         SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS; Initial Catalog=MyDB; Integrated Security = False; uid=nayeon; pwd=201807038;");// sqlConnection 개체 생성
            con.Open();
            string sql = "SELECT * FROM list WHERE num=" + Request["No"];
            SqlCommand cmd = new SqlCommand(sql, con);

            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read()) {
                writer.Text += rd["writer"].ToString();
                title.Text += rd["Title"].ToString();
                content.Text=rd["Content"].ToString();

            }
            rd.Close();
            con.Close();
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Do IT - IT 교육의 시작</title>
 <link href="DoIT.css" rel="stylesheet" />
    <style>
        .class_name {
            width: 110px;
        }
			#table2 td{
			  height:40px;
			  padding:15px;
			  border-top:solid 1px white;
			  border-left:solid 1px white;
			  border-right:solid 1px white;
			  border-bottom:solid 1px #BDBDBD;
			  font-size:15px;
			}
			#table2 th {
				height:40px;
				padding: 15px;
				border-top: solid 1px white;
				border-left: solid 1px white;
				border-right: solid 1px white;
				border-bottom: solid 1px #BDBDBD;
				text-align: left;
			}
			#table2 {
				background-color:whitesmoke;
				border-radius: 5px;
				background-color: whitesmoke;
				border-top: solid 1px;
				border-left: none;
				border-right: none;
				border-bottom: none;
				font-size: 17px;
				height: 700px;
				border: 1px;
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
                        <asp:TableCell HorizontalAlign="Center" ColumnSpan="2">
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
                    <asp:TableRow >
                        <asp:TableCell ColumnSpan="2" style="padding-left:100px;">
                            <p style="color:gainsboro;">HOME>공지사항>글보기</p>
                            <b style="font-size:40px">공지사항</b>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <asp:Table ID="table2" runat="server" Width="40%"  HorizontalAlign="Center" >
						   <asp:TableRow>
								<asp:TableHeaderCell>&middot; 작성자</asp:TableHeaderCell>
								<asp:TableCell>
                                    <asp:Label ID="writer" runat="server" Text=""></asp:Label>
								</asp:TableCell>
						   </asp:TableRow>
						   <asp:TableRow>
								<asp:TableHeaderCell>&middot; 제목</asp:TableHeaderCell><asp:TableCell>
                                    <asp:Label ID="title" runat="server" Text=""></asp:Label>
								</asp:TableCell>
						   </asp:TableRow>
						   <asp:TableRow>
								<asp:TableHeaderCell>&middot; 내용</asp:TableHeaderCell><asp:TableCell>
								<asp:TextBox runat="server" name="content" ID="content"  TextMode="MultiLine" Width="450px" Height="300px"/>
			
								</asp:TableCell>
						   </asp:TableRow>
				</asp:Table>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="2" BackColor="LightGray" Height="200px" HorizontalAlign="Center">
                                
                                    <asp:Image ImageUrl="~/imgs/logo.png" runat="server" Width="300px" style="margin-left:-400px"/>
                                
			                        <div class="footer-msg">
				                        (주)두잇 대표이사 서나연 사업자 등록번호 2018-070-38 <br/>
				                        (14780)경기도 부천시 경인로 590(괴안동) 나눔관 4층 | Tel. 02-2610-0778 | Fax. 02-2610-0778 <br/>
				                        Copyright(c) Seocurity Corp. AllRights Reserved
			                        </div>
                                
                         </asp:TableCell>
                    </asp:TableRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>

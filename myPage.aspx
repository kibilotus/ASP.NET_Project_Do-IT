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
            User_name.Text += Page.User.Identity.Name;

            SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS; Initial Catalog=MyDB; Integrated Security = True;");
            string sql = "select * from join_member where userid='"+Page.User.Identity.Name+"'";
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read()) {
                userid.Text = rd["userid"].ToString();
                member_name.Text = rd["username"].ToString();
                phone_num.Text = rd["phone_num"].ToString();
                user_addrnum.Text = rd["add_num"].ToString();
                user_address.Text = rd["address"].ToString();
                user_email.Text = rd["email"].ToString();
            }

            rd.Close();
            con.Close();
        }
        else{
            Response.Redirect("~/login.aspx");
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

    protected void update_member_click(Object sender,EventArgs e){
        if (Page.User.Identity.IsAuthenticated)
        {
            string sql = "update Join_Member(Pwd,phone_agency,phone_num,add_num,address,email)set(@Pwd,@phone_agency,@phone_num,@add_num,@address,@email)";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@Pwd", user_pwd.Text);
            cmd.Parameters.AddWithValue("@phone_agency", phone_agency.SelectedValue);
            cmd.Parameters.AddWithValue("@phone_num" ,phone_num.Text);
            cmd.Parameters.AddWithValue("@add_num", user_addrnum.Text);
            cmd.Parameters.AddWithValue("@address", user_address.Text);
            cmd.Parameters.AddWithValue("@email", user_email.Text);

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

            #update_member {
                border-radius: 10px;
                background-color: white;
                border: double;
                font-size: 30px;
                width: 300px;
                height: 80px;
                margin-left: 30px;
                margin-top: 30px;
            }

            #update_member:hover {
                color: #4374D9;
                border-left: 2px solid #4374D9;
                border-right: 2px solid #4374D9;
                border-top: 2px solid #4374D9;
                border-bottom: 2px solid #4374D9;
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
                            <p style="color:gainsboro;">HOME>내 강의실</p>
                            <b style="font-size:40px">내 강의실</b>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow style="padding-left:200px;">
                        <asp:TableCell style="background-color:whitesmoke;" HorizontalAlign="Right" >
                            <div style="margin-right:30px;">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/imgs/user_img.jpg"  Width="300px" Height="300px"/>
                            </div>
                        
                        </asp:TableCell>
                        <asp:TableCell style="width:50%; height:500px; background-color:whitesmoke;" >
                            <div>
                                <div style=" margin-left:30px;">
                                        <b style="font-size:25px"><asp:Label ID="User_name" runat="server" Text=""></asp:Label></b>
                                        <div class="class_name">#일반 회원</div><br />
                                </div>
                                <div>
                                    <asp:Button ID="update_member" runat="server" Text="회원정보 수정하기" onClick="update_member_click"/>
                                </div>
                            </div>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <asp:Table ID="table2" runat="server" Width="40%"  HorizontalAlign="Center" >
                    	<asp:TableRow>
									<asp:TableHeaderCell>&middot; 아이디</asp:TableHeaderCell>
									<asp:TableCell>
                                        <asp:Label ID="userid" runat="server" Text=""></asp:Label>
									</asp:TableCell>
	     					</asp:TableRow>
						   <asp:TableRow>
								<asp:TableHeaderCell>&middot; 비밀번호(필수)</asp:TableHeaderCell>
								<asp:TableCell runat="server" class="s2">
								   <asp:TextBox runat="server"  name="user_pwd" ID="user_pwd" required="required" Height="25px" />
								</asp:TableCell>
						   </asp:TableRow>
						   <asp:TableRow>
								<asp:TableHeaderCell>&middot; 이름</asp:TableHeaderCell>
								<asp:TableCell>
                                    <asp:Label ID="member_name" runat="server" Text="Label"></asp:Label>
								</asp:TableCell>
						   </asp:TableRow>
						   <asp:TableRow>
								<asp:TableHeaderCell>&middot; 전화번호</asp:TableHeaderCell>
								<asp:TableCell>
										<asp:DropDownList ID="phone_agency" runat="server">
											<asp:ListItem Value="SKT"></asp:ListItem>
											<asp:ListItem Value="KT"></asp:ListItem>
											<asp:ListItem Value="LG U+"></asp:ListItem>
										</asp:DropDownList>
										<asp:TextBox runat="server" maxlength="15" ID="phone_num" name="phone_num"  Height="25px" />
								</asp:TableCell>
						   </asp:TableRow>
						   <asp:TableRow>
								<asp:TableHeaderCell>&middot; 주소</asp:TableHeaderCell><asp:TableCell>
								<asp:TextBox runat="server" name="user_addrnum" size="10" maxlength="5" placeholder="우편번호" ID="user_addrnum"  Height="25px" /><br/>
								<asp:TextBox runat="server" name="user_address" size="50" ID="user_address"  Height="25px" />
								</asp:TableCell>
						   </asp:TableRow>
						   <asp:TableRow>
								<asp:TableHeaderCell>&middot; 이메일</asp:TableHeaderCell><asp:TableCell>
								<asp:TextBox runat="server" name="user_email" size="30" maxlength="30" ID="user_email"  Height="25px" /> 
								</asp:TableCell>
						   </asp:TableRow>
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

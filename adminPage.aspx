<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<script runat="server">
    SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS; Initial Catalog=MyDB; Integrated Security = True;");
    protected void Page_Load(Object sender, EventArgs e) {
        if(Page.User.Identity.IsAuthenticated)
        {
            if (Page.User.Identity.Name =="admin") { 
            Label1.Text= Page.User.Identity.Name + "님 환영합니다!";
            Label1.Visible = true;
            logout_btn.Visible = true;
            login_btn.Visible = false;
            join_btn.Visible = false;}
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
                            <a href="adminPage.aspx"><asp:Label ID="Label1" runat="server" Text=""></asp:Label></a>
                            <asp:Button ID="logout_btn" runat="server" Text="로그아웃" OnClick="logout_btn_click" />
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
                            <p style="color:gainsboro;">HOME>관리자 페이지</p>
                            <b style="font-size:40px">관리자 페이지</b>
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
                                        <b style="font-size:25px"><asp:Label ID="User_name" runat="server" Text="Admin"></asp:Label></b>
                                        <div class="class_name">#관리자</div><br />
                                </div>
                            </div>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <asp:Table ID="table2" runat="server" Width="40%"  HorizontalAlign="Center" >
                    	<asp:TableRow>
                            <asp:TableCell>
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

<%@ Page Language="C#"%>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<script runat="server">
    SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS; Initial Catalog=MyDB; Integrated Security = True;");// sqlConnection 개체 생성

    protected void id_check_click(object sender, EventArgs e) {
        string sql = "select userid from join_member where userid=@userid";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@UserID", user_id.Text);

        con.Open();
        SqlDataReader rd=cmd.ExecuteReader();
        if (rd.Read())
        {
            Label1.Text = "이미 사용중인 아이디 입니다.";
            Label1.ForeColor =System.Drawing.Color.Red;

        }
        else {
            Label1.Text = "사용 가능한 아이디 입니다.";
            Label1.ForeColor =System.Drawing.Color.Green;
        }
        
    }

    protected void pwd_check_click(object sender, EventArgs e)
    {
        if (string.Equals(user_pwd_ck,user_pwd))
        {
            Label2.Text = "비밀번호가 일치합니다.";
            Label2.ForeColor = System.Drawing.Color.Green;

        }
        else
        {
            Label2.Text = user_pwd.Text+user_pwd_ck.Text+"비밀번호가 일치하지 않습니다.";
            Label2.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void join_click(object sender, EventArgs e){

        string sql = "Insert into Join_Member(UserID,Pwd,UserName,phone_agency,phone_num,add_num,address,email)Values(@UserID,@Pwd,@UserName,@phone_agency,@phone_num,@add_num,@address,@email)";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@UserID", user_id.Text);
        cmd.Parameters.AddWithValue("@Pwd", user_pwd.Text);
        cmd.Parameters.AddWithValue("@UserName", user_name.Text);
        cmd.Parameters.AddWithValue("@phone_agency", phone_agency.SelectedValue);
        cmd.Parameters.AddWithValue("@phone_num" ,phone_num.Text);
        cmd.Parameters.AddWithValue("@add_num", user_addrnum.Text);
        cmd.Parameters.AddWithValue("@address", user_address.Text);
        cmd.Parameters.AddWithValue("@email", user_email.Text+"@"+email_domain.SelectedValue);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

		
        Response.Redirect("~/join_complete.aspx");
        
    }
    protected void cancle_click(object sender, EventArgs e) {
        Response.Redirect("~/Main.aspx");
    }

</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Do IT - IT 교육의 시작</title>
	<link href="DoIT.css" rel="stylesheet" />
	<style>
	    body {
			background-color:whitesmoke;
		}
			.s1{float:right;
			      font-size:12px;}
			a:link{color:black;}
			a:visited{color:black;}
			.s3{
			    padding: 5px 10px 5px 15px;
			}
			td{
			  height:40px;
			  padding:15px;
			  border-top:solid 1px white;
			  border-left:solid 1px white;
			  border-right:solid 1px white;
			  border-bottom:solid 1px #BDBDBD;
			  font-size:15px;
			}
	    th {
			height:40px;
	        padding: 15px;
	        border-top: solid 1px white;
	        border-left: solid 1px white;
	        border-right: solid 1px white;
	        border-bottom: solid 1px #BDBDBD;
	        text-align: left;
	    }
	    table1 {
	        border-radius: 5px;
	        background-color: whitesmoke;
	        margin: 0 0 40px 0;
	        padding: 30px 70px;
	        border-top: solid 1px;
	        border-left: none;
	        border-right: none;
	        border-bottom: none;
	        font-size: 17px;
	        width: 950px;
	        height: 950px;
	        border: 1px;
	    }		
	</style>

</head>
<body>
	
	<div style="margin-top:200px;">
	 			<form runat="server">
	   		
	   				<asp:Table ID="Table1" runat="server" width="900px" height="450px" BackColor="White" align="center" BorderWidth="2">
						   <asp:TableRow HorizontalAlign="Center">
									<asp:TableCell ColumnSpan="2">
										<asp:Image ID="logo" runat="server" ImageUrl="~/imgs/logo1.jpg" />
										<h1>회원가입</h1>
									</asp:TableCell>

						   </asp:TableRow>
						   
	     					<asp:TableRow>
									<asp:TableHeaderCell>&middot; 아이디(필수)</asp:TableHeaderCell>
									<asp:TableCell>
										<asp:TextBox runat="server" id="user_id" name="user_id" MaxLength="15" required="required" Height="25px" />
										<asp:Button ID="id_check" runat="server" Text="ID 중복확인" onClick="id_check_click"/><br />
                                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
									</asp:TableCell>
	     					</asp:TableRow>
						   <asp:TableRow>
								<asp:TableHeaderCell>&middot; 비밀번호(필수)</asp:TableHeaderCell>
								<asp:TableCell runat="server" class="s2">
								   <asp:TextBox runat="server"  name="user_pwd" ID="user_pwd" required="required" Height="25px" />
								</asp:TableCell>
						   </asp:TableRow>
						   <asp:TableRow>
								<asp:TableHeaderCell>&middot; 비밀번호 확인(필수)</asp:TableHeaderCell>
								<asp:TableCell runat="server" class="s2">
								   <asp:TextBox runat="server"  name="user_pwd_ck" ID="user_pwd_ck" required="required" Height="25px" />
									<asp:Button ID="pwd_check" runat="server" Text="비밀번호 확인" onClick="pwd_check_click"/><br />
                                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
								</asp:TableCell>
						   </asp:TableRow>
						   <asp:TableRow>
								<asp:TableHeaderCell>&middot; 이름(필수)</asp:TableHeaderCell>
								<asp:TableCell>
									<asp:TextBox runat="server" name="user_name" ID="user_name" required="required" Height="25px" />
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
								<asp:TextBox runat="server" name="user_email" size="15" maxlength="20" ID="user_email"  Height="25px" /> @
									<asp:DropDownList ID="email_domain" runat="server">
										<asp:ListItem Text="naver.com" value="naver.com"></asp:ListItem>
										<asp:ListItem Text="daum.net" value="daum.net"></asp:ListItem>
										<asp:ListItem Text="gmail.com" value="gmail.com"></asp:ListItem>
									</asp:DropDownList>
			
								</asp:TableCell>
						   </asp:TableRow>
						   <asp:TableRow>
							   <asp:TableCell ColumnSpan="2" HorizontalAlign="Center" BorderStyle="None">
									<asp:CheckBox runat="server" Text="이용약관에 동의합니다."> </asp:CheckBox>
							   </asp:TableCell>
						 </asp:TableRow>
	   					 <asp:TableRow>
								<asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
									 <asp:Button ID="join" runat="server" Text="회원가입" class="btn_style1"  OnClick="join_click"></asp:Button><br />
									 계정이 이미 있으신가요 ? <a href="Main.aspx">돌아가기</a>
								</asp:TableCell>
						</asp:TableRow>
				</asp:Table>
			</form>
		</div>
</body>
</html>

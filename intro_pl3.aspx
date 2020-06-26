<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Do IT - IT 교육의 시작</title>
    <style>
        #logo {
            width:300px;
            display:block;
            margin-right:auto;
            margin-left:auto;
        
        }

        #join_class {
            border-radius:10px;
            background-color: white;
            border: double;
            font-size: 30px;
            width: 300px;
            height: 80px;
            margin-left: 30px;
            margin-top: 30px;
        }

            #join_class:hover {
                color:#4374D9;
		        border-left:2px solid #4374D9;
    	        border-right:2px solid #4374D9;
    	        border-top:2px solid #4374D9;
    	        border-bottom:2px solid #4374D9;
            
            }

        .class_name {
            font-size: 20px;
            border-radius: 50px;
            border: solid;
            border-width: 1px;
            width: 110px;
            padding-left: 5px;
        }

        ul {
            list-style: none;
        }
	.sub1{
		margin-left:200px;
		display: block; 
		width:100%;
		height:100px;
	}
	.sub1 ul li{
		float: left;
		height: 70px;
    	padding-top: 7px;
    	display: list-item;
    	
	}
        .sub1 ul li a {
            display: inline-block;
            position: relative;
            width: 250px;
            margin-top: -1px;
            padding: 15px 29px 0 14px;
            font-size: 30px;
            line-height: 16px;
            text-decoration: none;
            color: #707070;
            height: 40px;
            background: url("img/sub_menu.jpg")no-repeat 0;
            background-size: 250px;
            border-left: 1px solid rgba(112,112,112,0.15);
            border-right: 1px solid rgba(112,112,112,0.15);
            border-top: 1px solid rgba(112,112,112,0.15);
            border-bottom: 1px solid rgba(112,112,112,0.15);
        }
	
	.sub1 >ul > li> a:hover{
		color:#4374D9;
		border-left:2px solid #4374D9;
    	border-right:2px solid #4374D9;
    	border-top:2px solid #4374D9;
    	border-bottom:2px solid #4374D9;
	}
	
	        #list {
            width:90%;
            height:50px;
            font-size:30px;
            background:#CCCCCC;
            border-radius:30px 30px 30px 30px;
            margin-top:20px;
            margin-bottom:20px;
            border-right: 1px solid rgba(255,255,255,0.15);
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Table ID="Table1" runat="server" Width="80%" HorizontalAlign="Center">
                <asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                        <div id="logout" style="float: right;">
                            <a href="login.aspx">로그인</a> / <a href="join_main.aspx">회원가입</a>  
                        </div>
                        <div id="login" style="float: right; display:none;">
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label><asp:Button ID="logout_btn" runat="server" Text="로그아웃" OnClientClick="logout_btn_click" />
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
                                    StaticMenuItemStyle-HorizontalPadding="50px" StaticMenuStyle-HorizontalPadding="280px" DynamicMenuItemStyle-HorizontalPadding="70px" 
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
                                            <asp:MenuItem NavigateUrl="QnA.aspx" Text="Q&A" Value="Q&A"></asp:MenuItem>
                                
                                        <asp:MenuItem NavigateUrl="myPage.aspx" Text="내 강의실" Value="내 강의실"></asp:MenuItem>
                                    </Items>
                                </asp:Menu>
                             </div>
                         </asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell style="background-color:whitesmoke;" HorizontalAlign="Right" >
                        <div style="margin-right:30px;">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/imgs/PL3.jpg"  Width="500px" Height="350px"/>
                        </div>
                        
                    </asp:TableCell>
                    <asp:TableCell style="width:50%; height:500px; background-color:whitesmoke;" >
                        <div>
                            <div style=" margin-left:30px;">
                                    <b style="font-size:40px">Lv.1 Intro to Programming</b> <br /> <br />
                                    <div class="class_name">#JAVA</div><br />
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
				                <li><a href="main.jsp?target=consulting_sub1">강의 소개</a></li>
				                <li><a href="main.jsp?target=consulting_sub2">교육 과정</a></li>
				                <li><a href="main.jsp?target=consulting_sub3">수강 후기</a></li>
				                <li><a href="main.jsp?target=consulting_sub4">질문 & 답변</a></li>
			                </ul>
		                </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow >
                    <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/imgs/intro_pl3.jpg" width="1500px"/>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>

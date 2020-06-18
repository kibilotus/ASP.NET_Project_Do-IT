<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Main.aspx.vb" Inherits="Main" %>

<!DOCTYPE html>

<html>
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

        footer{
				position: relative;
			    margin: auto;
			    padding: 40px 0;
                background:#C0C0C0;
                
			 }
        .footer-msg {
            color: #F6F6F6;
            font-size: 14px;
            opacity: 0.5;
            width: 600px;
            margin-top: -80px;
            margin-left: 850px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Table ID="Table1" runat="server" >
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                        <div style="float: right;">
                            <a href="~/login.aspx">로그인</a> / <a href="~/join.aspx">회원가입</a>  
                        </div>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                    <div id="header" >
                        <asp:Image ID="logo" runat="server" ImageUrl="~/imgs/logo1.jpg" />
                    </div>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <div id="list">
                        <asp:Menu ID="Mainmenu" runat="server" Orientation="Horizontal" DynamicMenuStyle-CssClass="dropdown-menu" >
                            <DynamicMenuStyle CssClass="dropdown-menu" />
                            <Items>
                                <asp:MenuItem Text="About 두잇" Value="About 두잇">
                                    <asp:MenuItem NavigateUrl="~/intro.aspx" Text="홈페이지 소개" Value="홈페이지 소개"></asp:MenuItem>
                                </asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/edu_intro.aspx" Text="강의 소개" Value="강의 소개">
                                    <asp:MenuItem NavigateUrl="~/web_intro.aspx" Text="웹 프로그래밍" Value="웹 프로그래밍"></asp:MenuItem>
                                    <asp:MenuItem NavigateUrl="~/pro_intro.aspx" Text="프로그래밍 언어" Value="프로그래밍 언어"></asp:MenuItem>
                                </asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/edu_intro.aspx" Text="커뮤니티" Value="커뮤니티">
                                    <asp:MenuItem NavigateUrl="~/myPage.aspx" Text="게시판" Value="게시판"></asp:MenuItem>
                                    <asp:MenuItem NavigateUrl="~/QnA.aspx" Text="Q&A" Value="Q&A"></asp:MenuItem>
                                </asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/myPage.aspx" Text="내 강의실" Value="내 강의실"></asp:MenuItem>
                            </Items>
                        </asp:Menu>
                     </div>
                 </asp:TableCell>
            </asp:TableRow>


            <asp:TableRow>
                <asp:TableCell>
                            <asp:Image ImageUrl="imgs/banner1.jpg" runat="server" Width="100%" />
                            <asp:Image ImageUrl="imgs/banner2.jpg" runat="server" Width="100%" />
                            <asp:Image ImageUrl="imgs/banner3.jpg" runat="server" Width="100%" />
                 </asp:TableCell>
            </asp:TableRow>


            <asp:TableRow>
                <asp:TableCell>
                    <div>
                        <h2>BEST 강의</h2>
                    </div>
                 </asp:TableCell>
            </asp:TableRow>


            <asp:TableRow>
                <asp:TableCell>
                    
                        <footer>
                            <asp:Image ImageUrl="imgs/logo.png" runat="server" Width="300px" margin-left="550px"/>
			                <div class="footer-msg">
				                (주)두잇 대표이사 서나연 사업자 등록번호 2018-070-38 <br>
				                (14780)경기도 부천시 경인로 590(괴안동) 나눔관 4층 | Tel. 02-2610-0778 | Fax. 02-2610-0778 <br>
				                Copyright(c) Seocurity Corp. AllRights Reserved
			                </div>
                        </footer>
                    
                 </asp:TableCell>
            </asp:TableRow>
            </asp:Table>
    </form>
</body>
</html>


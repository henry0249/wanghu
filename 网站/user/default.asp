<!--#include file="../Inc/Config.asp" -->
<!--#include file="../Inc/md5VB.asp" -->
<%
  CxGame.IsCheckLogin()
%>
<%CxGame.DbConn("QPGameUserDB")%>
<%
  dim gender,C_idno,c_address,c_email,c_pic
  set rs=conn.execute("select top 1 gender,C_idno,c_address,c_email,c_pic,accounts from AccountsInfo where UserID="&Session("UserID")&" ")
  if not rs.eof then
     gender=int(rs(0))
	 C_idno=rs(1)
	 c_address=rs(2)
	 c_email=rs(3)
	 c_pic=rs(4)
	 session("UserName")=rs(5)
  end if
  'response.Write gender
  rs.close
%>
<%CxGame.DbConn("QPTreasureDB")%>
<%
  Set Rs=Conn.Execute("Select Score From GameScoreInfo Where UserID="& session("userid") &"")
  if not rs.eof then
     session("money")=clng(rs(0))	  
  end if
  rs.close
%>
<link href="images/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.text_td {	font-family: "宋体";
	font-size: 12px;
	font-weight: lighter;
	color: #333333;
	text-decoration: none;
	width: 200px;
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: outset;
	border-right-style: inset;
	border-bottom-style: inset;
	border-left-style: outset;
	border-top-color: #D2D2D2;
	border-right-color: #808080;
	border-bottom-color: #808080;
	border-left-color: #D2D2D2;
}
-->
</style>
<table width="770" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td><!--#include file="Top.asp" --></td>
  </tr>
</table>
<table width="889" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="204" height="469" align="center" valign="top"><table width="160" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="4"></td>
      </tr>
    </table>      
     <!--#include file="left.asp"--></td>
    <td width="665" align="center" valign="top"><table width="583" height="24" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td class="14_px">&nbsp;&nbsp;个人管理中心</td>
      </tr>
    </table>
      <table width="583" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td height="11" colspan="3" align="center"><img src="images/up.gif" width="557" height="11" /></td>
        </tr>
        <tr>
          <td width="14" height="236" class="bg_hui">&nbsp;</td>
          <td width="565" align="center"><table width="530" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="83" height="35" align="right" class="12_pxcu">昵&nbsp;&nbsp;&nbsp; 称：</td>
                <td width="226" class="red_12px"><%=Session("UserName")%></td>
                <td width="221" rowspan="3" align="center"><%if c_pic<>"" then%><img src="<%=c_pic%>" width="116" height="97" /><%else%><img src="images/nullpic.gif" width="116" height="97" /><%end if%></td>
              </tr>
              <tr>
                <td height="35" align="right" class="12_pxcu">性&nbsp;&nbsp;&nbsp; 别：</td>
                <td height="35" class="red_12px"><%if gender=1 then%>男<%else%>女<%end if%></td>
              </tr>
              <tr>
                <td height="35" align="right" class="12_pxcu">所 在 地：</td>
                <td height="35" class="red_12px"><%=c_address%></td>
              </tr>
              <tr>
                <td height="35" align="right" class="12_pxcu">身 份 证：</td>
                <td height="35" class="red_12px"><%=C_idno%></td>
                <td height="35" align="center">
                </td>
              </tr>
              <tr>
                <td height="35" align="right" class="12_pxcu">电子邮件：</td>
                <td height="35" class="red_12px"><%=c_email%></td>
                <td height="35" align="center"><a href="my.asp"><img src="images/up_user.gif" width="126" height="34" border="0" /></a></td>
              </tr>
          </table></td>
          <td width="14" class="bg_huir">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="3" align="center"><img src="images/down.gif" width="557" height="3" /></td>
        </tr>
      </table>
      <table width="583" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="583" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td height="11" colspan="3" align="center"><img src="images/up_d.jpg" width="557" height="11" /></td>
        </tr>
        <tr>
          <td width="14" height="139" class="bg_hui">&nbsp;</td>
          <td width="565" align="center"><table width="530" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="83" height="40" align="right" class="12_pxcu">金币余额：</td>
                <td width="158" class="red_12px"><%=Session("money")%> 币</td>
                <td width="289"><a href="../Paybuy.asp" target="_top"><img src="images/online.gif" width="86" height="29" border="0" /></a></td>
              </tr>
              <tr>
                <td height="40" align="right" class="12_pxcu">魅&nbsp;&nbsp;&nbsp; 力：</td>
                <td class="red_12px">0点</td>
                <td><img src="images/meili.jpg" width="86" height="30" /></td>
              </tr>
          </table></td>
          <td width="14" class="bg_huir">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="3" align="center"><img src="images/down.gif" width="557" height="3" /></td>
        </tr>
    </table>    </td>
  </tr>
</table>

<table width="913" height="85" border="0" align="center" cellpadding="0" cellspacing="0" class="bj">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><!--#include file="../copy.asp"--></td>
  </tr>
</table>
i 
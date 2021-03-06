<%@ page import="cn.edu.nchu.stu.data.model.CardType" %>
<%@ page import="cn.edu.nchu.stu.data.Dao" %>
<%@ page import="java.util.Locale" %>
<%@ page import="cn.edu.nchu.stu.data.model.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>办卡</title>
    <link rel="stylesheet" href="../css/image.css">
    <link rel="stylesheet" href="../css/navBar.css">
    <link rel="stylesheet" href="../css/tableCenter.css">
</head>

<body>
<div class="background2"></div>
<ul class="horizontal gray">
    <li><a href="">校园一卡通</a></li>
    <li><a href="${pageContext.request.contextPath}/Admin/danweizengshangaicha.jsp">单位管理</a></li>
    <li><a href="${pageContext.request.contextPath}/Admin/shuakajizengshanchagai.jsp">刷卡机管理</a></li>
    <li><a href="${pageContext.request.contextPath}/Admin/banka.jsp" class="active">办卡中心</a></li>
    <li><a href="${pageContext.request.contextPath}/Admin/liushuitongji.jsp">统计报表</a></li>
    <li class="rightLi" style="float: right"><a href="${pageContext.request.contextPath}/logout.do">注销</a></li>
</ul>
<ul class="vertical">
    <li><a href="${pageContext.request.contextPath}/Admin/banka.jsp" class="active">办卡</a></li>
    <li><a href="${pageContext.request.contextPath}/Admin/guashi.jsp">挂失</a></li>
    <li><a href="${pageContext.request.contextPath}/Admin/dongjie.jsp">冻结</a></li>
    <li><a href="${pageContext.request.contextPath}/Admin/huifu.jsp">恢复</a></li>
    <li><a href="${pageContext.request.contextPath}/Admin/chongzhi.jsp">充值</a></li>
    <li><a href="${pageContext.request.contextPath}/Admin/buzhufafang.jsp">补助发放</a></li>
</ul>
<div class="leftPanel">
    <% List<User> userList = Dao.getInstance().findAllUser(); %>
    <form action="${pageContext.request.contextPath}/new_card.do" method="post" class="form">
        <input name="redirect" value="Admin/banka.jsp" hidden>
        <table border="0" style="width: 200px;height: 40px;margin: auto;">
            <tr>
                <td style="text-align: right"><label>用户id：</label></td>
                <td><select name="user_id">
                    <% for (User user : userList) { %>
                    <option value="<%= user.getId() %>"><%= user.getUsername() %></option>
                    <% } %>
                </select></td>
            </tr>
            <tr>
                <td style="text-align: right"><label>卡类型：</label></td>
                <td><select name="type">
                    <% for (CardType cardType : Dao.getInstance().findAllCardTypes()) { %>
                    <option value="<%= cardType.getId() %>"><%= cardType.getName() %></option>
                    <% } %>
                </select></td>
            </tr>
        </table>
        <br>
        <input type="submit" name="sure" value="确定">
        &nbsp;&nbsp;
        <input type="reset" name="cancel" value="取消">
    </form>
    <%  Long cardId = (Long) session.getAttribute("card_id");
        String error = (String) session.getAttribute("error");
    %>
    <% if (error != null) { %>
    <h3><%= error %></h3>
    <% session.setAttribute("error",null); %>
    <% } %>
    <% if (cardId != null) { %>
    <h3><%= String.format(Locale.getDefault(), "%06d", cardId) %></h3>
    <% session.setAttribute("card_id", null); } %>
</div>
</body>

</html>
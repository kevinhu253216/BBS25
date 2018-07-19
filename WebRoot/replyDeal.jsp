<%@page language="java"  import ="java.sql.*, java.io.*, com.bjsxt.bbs.*, java.util.*"  pageEncoding="GB18030" %>
<%
request.setCharacterEncoding("GBK");
int pid = Integer.parseInt(request.getParameter("pid"));
int rootId = Integer.parseInt(request.getParameter("rootId"));

String title = request.getParameter("title");
System.out.println(title);

String cont = request.getParameter("cont");
System.out.println(cont);

Connection conn = DB.getConn();
String sql = "insert into article values(null, ?, ?, ?, ?, now(), ? )";
PreparedStatement pstmt = DB.prepareStmt(conn, sql);
pstmt.setInt(1, pid);
pstmt.setInt(2, rootId);
pstmt.setString(3, title);
pstmt.setString(4, cont);
pstmt.setInt(5, 0);

pstmt.executeUpdate();
DB.close(pstmt);
DB.close(conn); 


%>



<script language="JavaScript1.2" type="text/javascript">

function delayURL(url, time) {
    setTimeout("top.location.href='" + url + "'", time);
}

</script>

3秒钟后自动跳转，如果不跳转，请点击下面连接
<a href="article.jsp">主题列表</a>


<script type="text/javascript">
delayURL("article.jsp",3000)
</script>


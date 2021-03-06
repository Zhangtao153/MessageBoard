<%@ page import="com.zth.pojo.Admin" %>
<%@ page import="java.util.List" %>
<%@ page import="com.zth.pojo.Msg" %>
<%@ page import="com.zth.db.PageDiv" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <title>留言板</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css" />
</head>
<body>
<div style="height: 50px;"></div>
<div class="container">
    <div class="panel panel-default ">
        <div class="panel-heading ">
            <h3 class="panel-title ">
                <a href="#" class="btn btn-danger">首页</a>
                <a href="msg?action=msg_add" class="btn btn-success">发布留言</a>
                <a href="../logout" class="btn btn-danger pull-right btn-xs">登出</a>
                <div style="float: right ;margin-right: 20px">
                    <%
                        Admin admin = (Admin)session.getAttribute("loged");
                        out.println(admin.getEmail());
                        out.println("<img src='../ups/"+admin.getPic()+"'  height=30");
                    %>
                </div>
            </h3>
        </div>
        <!-- 以下是表单 -->
        <table class="table table-hover table-striped table-responsive">
            <tr><th>序号</th><th>标题</th><th>作者</th><th>时间</th></tr>
            <%
                PageDiv<Msg> pd = ( PageDiv<Msg>)request.getAttribute("pd");


                if (null != pd && null!= pd.getList() && pd.getList().size() >0){
                    List<Msg> msgs = pd.getList();
                    int index = 1;
                    for (Msg msg:msgs) {
            %>

            <tr><td><%=index++%></td><td><a href="msg?action=showMsg&id=<%=msg.getId()%>"><%=msg.getTitle()%></a></td><td><%=msg.getAdminName()%></td><td><%=msg.getCtime()%></td>
            <td>
                <%
                    if (admin.getUpur().startsWith("100") || msg.getAdmin_id() == admin.getId()){
                       %>

                <a href="msg?action=del&id=<%=msg.getId()%>" class="btn btn-danger btn-xs">删除</a>
                <a href="msg?action=edit&id=<%=msg.getId()%>" class="btn btn-success btn-xs">修改</a>
                <%
                    }
                %>
            </td>

            </tr>
            <%
                    }
                }
            %>

        </table>


        <div>
            <div class="pull-left">
                <nav >
                    <ul class="pagination">
                        <li>
                            <a href="msg?pageNo=<%=pd.getPageNo()-1<1 ? pd.getPageNo():pd.getPageNo()-1%>" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <%
                            for (int i = pd.getStart(); i <=pd.getEnd() ; i++) {
                         %>

                        <li><a href="msg?pageNo=<%=i%> "><%=i%></a></li>
                        <%

                            }
                        %>

                        <li>
                            <a href="msg?pageNo=<%=pd.getPageNo()+1> pd.getTotalPage()? pd.getTotalPage():pd.getPageNo()+1%>" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>

            <div class="pull-right " style="margin-top: 25px ;font-size: 18px">
                当前 <%=pd.getPageNo()%>/<%=pd.getTotalPage()%>页，总共 <%=pd.getTotalCount()%>条
            </div>
        </div>

        <!-- 结束 -->
    </div>
</div>
<%@include file="booter2.jsp" %>
</body>
</html>


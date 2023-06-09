<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script src="/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a>
              <cite>导航元素</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form class="layui-form layui-col-space5">
                        <div class="layui-inline layui-show-xs-block">
                            <select name="termId" lay-verify="required">
                                <c:forEach items="${termList}" var="term">
                                    <option value="${term.id}">${term.year}年${term.season}季</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn" lay-submit="" lay-filter="sreach"><i
                                    class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>
                <div class="layui-card-body ">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th>姓名</th>
                            <th>学号</th>
                            <th>理论成绩（40%）</th>
                            <th>实践成绩（60%）</th>
                            <th>最终成绩</th>
                            <th>操作</th>
                        </thead>

                        <tbody>
                    <c:forEach items="${studentScores}" var="studentScore">
                        <tr>
                            <td>${studentScore.studentName}</td>
                            <%--渲染学生的id作为学号--%>
                            <td>
                              ${studentScore.studentId}
                            </td>

                            <td>
                                <fmt:formatNumber value="${studentScore.getTScore()}" pattern="0.00"></fmt:formatNumber>

                            </td>
                            <td>
                                <fmt:formatNumber value="${studentScore.getPScore()}" pattern="0.00"></fmt:formatNumber>

                            </td>
                            <td>
                                <fmt:formatNumber value="${studentScore.score}" pattern="0.00"></fmt:formatNumber>

                            </td>
                            <td class="td-status">
                                <%--                                传入studentClassId--%>
                                <a title="编辑" onclick="xadmin.open('编辑','/teacher-score-edit.jsp?id=${studentScore.id}',600,400)"
                                   href="javascript:;">
                                    <i class="layui-icon">&#xe642;</i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    layui.use(['laydate', 'form'], function () {
        var laydate = layui.laydate;
        var form = layui.form;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
    });


</script>
<script>var _hmt = _hmt || [];
(function () {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</html>

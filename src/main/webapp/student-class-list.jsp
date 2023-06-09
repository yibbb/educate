<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html class="x-admin-sm">
<head>
    <meta charset="UTF-8"/>
    <title></title>
    <meta name="renderer" content="webkit"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta
            name="viewport"
            content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"
    />
    <link rel="stylesheet" href="/css/font.css"/>
    <link rel="stylesheet" href="/css/xadmin.css"/>
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
        <a href="">演示</a>
        <a> <cite>导航元素</cite></a>
      </span>
    <a
            class="layui-btn layui-btn-small"
            style="line-height: 1.6em; margin-top: 3px; float: right"
            onclick="location.reload()"
            title="刷新"
    >
        <i class="layui-icon layui-icon-refresh" style="line-height: 30px"></i
        ></a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">

                <div class="layui-card-header">
                    当前学期是：${sessionScope.term} 结束选课状态：${sessionScope.close} 结课状态：${sessionScope.end}
                </div>
                <c:if test="${sessionScope.close=='已结束选课'}">
                    <div class="layui-card-body">
                        当前学期已结束选课，敬请期待下一学期...
                    </div>
                </c:if>

                <c:if test="${close == '未结束选课' && end == '未结课'}">
                    <div class="layui-card-body">
                        <table class="layui-table layui-form">
                            <thead>
                            <tr>
                                <th>课程名称</th>
                                <th>培训师姓名</th>
                                <th>学费</th>
                                <th>操作</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach items="${classes}" var="class">
                                <tr>

                                    <td>${class.courseName}</td>
                                    <td>${class.teacherName}</td>
                                    <td>
                                            <%--                                <fmt:formatNumber value=" ${class.courseCost}" pattern="0.00"></fmt:formatNumber>--%>
                                            ${class.courseCost}
                                    </td>
                                    <td>
                                        <button
                                                class="layui-btn"
                                            <%--                                                                        培训班id--%>
                                                onclick="xadmin.open('确认信息','/student/student-class-signup?tClassId=${class.id}',600,400)"
                                        >
                                            <i class="layui-icon"></i>报名
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                </c:if>


            </div>
        </div>
    </div>
</div>
</body>
<script>
    layui.use(["laydate", "form"], function () {
        var laydate = layui.laydate;
        var form = layui.form;

        //执行一个laydate实例
        laydate.render({
            elem: "#start", //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: "#end", //指定元素
        });
    });

    /*用户-删除*/
    function member_del(obj, id) {
        layer.confirm("确认要删除吗？", function (index) {
            //发异步删除数据
            $(obj).parents("tr").remove();
            layer.msg("已删除!", {icon: 1, time: 1000});
        });
    }

    function delAll(argument) {
        var data = tableCheck.getData();

        layer.confirm("确认要删除吗？" + data, function (index) {
            //捉到所有被选中的，发异步进行删除
            layer.msg("删除成功", {icon: 1});
            $(".layui-form-checked").not(".header").parents("tr").remove();
        });
    }
</script>
<script>
    var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
</html>

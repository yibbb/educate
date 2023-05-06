<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8"/>
    <title>新东莞培训机构教学管理系统</title>
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
    <script type="text/javascript" src="/resources/jquery.3.3.1.min.js"></script>
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
                    <button class="layui-btn"
                            onclick="xadmin.open('开启新学期','/admin-term-add.jsp',600,400)">
                        <i class="layui-icon"></i>开启新学期
                    </button>
                    <button class="layui-btn layui-btn-danger"
                            id='closeCurrentSelectCourse'> <!--需要使用ajax发送异步请求到/closeCurrentSelection这个接口上-->
                        <i class="layui-icon"></i>关闭当期培训选课
                    </button>
                    <button class="layui-btn layui-btn-danger"
                            id='endCurrentClasses'> <!--需要使用ajax发送异步请求到/endCurrentClasses这个接口上-->
                        <i class="layui-icon"></i>结束当期培训
                    </button>
                </div>
                <div class="layui-card-body">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th>年份</th>
                            <th>季节</th>
                            <th>是否结束选课</th>
                            <th>是否结课</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${termList}" var="term">
                            <tr>
                                <td>${term.year}</td>
                                <td>${term.season}</td>
                                <c:if test="${term.closed==1}">
                                    <td>已结束选课</td>
                                </c:if>
                                <c:if test="${term.closed==0}">
                                    <td>未结束选课</td>
                                </c:if>
                                <c:if test="${term.ended==1}">
                                    <td>已结课</td>
                                </c:if>
                                <c:if test="${term.ended==0}">
                                    <td>未结课</td>
                                </c:if>
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

    //ajax发送异步请求到/closeCurrentSelection这个接口上
    $("#closeCurrentSelectCourse").click(function () {
        $.ajax({
            url: "/admin/closeCurrentSelection",
            type: "get",
            success: function (json) {
                if (json === 'ok') {
                    setTimeout(function () {
                        xadmin.close();
                        // 可以对父窗口进行刷新
                        // xadmin.father_reload();
                        location.reload()

                    }, 1200)
                    layui.layer.msg("关闭当期培训选课成功", {
                        icon: 1,
                        time: 1200,
                    });

                } else {
                    layui.layer.msg(json, {
                        icon: 2,
                        time: 1500,

                    })
                }
            }
        });
    })

    //ajax发送异步请求到/closeCurrentSelection这个接口上
    $("#endCurrentClasses").click(function () {
        $.ajax({
            url: "/admin/endCurrentClasses",
            type: "get",
            success: function (json) {
                if (json === 'ok') {
                    setTimeout(function () {
                        xadmin.close();
                        // 可以对父窗口进行刷新
                        // xadmin.father_reload();
                        location.reload()

                    }, 1200)
                    layui.layer.msg("结束当期培训成功", {
                        icon: 1,
                        time: 1200,

                    });
                } else {
                    layui.layer.msg(json, {
                        icon: 2,
                        time: 1500,

                    })
                }
            }
        });
    })

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

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>新东莞培训机构教学管理系统</title>
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
            <a href="">演示</a>
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
                    需要补办的听课证：
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th>学生姓名</th>
                            <th>课程名</th>
                            <th>培训师姓名</th>
                            <th>操作</th>
                        </thead>

                        <tbody>
                        <c:forEach items="${studentClasses}" var="studentClass">
                            <tr>
                                <td>${studentClass.studentName}</td>
                                <td>${studentClass.courseName}</td>
                                <td>${studentClass.teacherName}</td>
                                <td>
                                    <button class="layui-btn" onclick="submit(this,'${studentClass.id}')"
                                            lay-filter="add"
                                            lay-submit="">
                                        补办听课证
                                    </button>
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


    function submit(obj, id) {
        console.log(id);
        $.ajax({
            url: "/admin/evidenceReissue",
            data: {'studentClassId': id},
            type: "post",
            success: function (res) {
                if (res === 'ok') {
                    $(obj).parents("tr").remove();
                    layui.layer.msg("确认完毕", {
                        icon: 1,
                        time: 1200,
                        offset: 't',
                    });
                } else {
                    layui.layer.msg(res, {
                        icon: 2,
                        time: 1500,
                        offset: 't',
                    })
                }
            }
        });
    }


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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="layui-col-md12">
    <div class="layui-card">
        <div class="layui-card-header">
            您的个人信息如下：
            <button
                    class="layui-btn"
                    onclick="xadmin.open('个人信息修改','/teacher/teacher-personal-edit',600,400)">
                <i class="layui-icon"></i>个人信息修改
            </button>
            <button
                    class="layui-btn"
                    onclick="xadmin.open('修改密码','/teacher-password-edit.jsp',600,400)">
                <i class="layui-icon"></i>修改密码
            </button>
        </div>
        <div class="layui-card-body">
            <table class="layui-table">
                <tbody>
                <tr>
                    <th>用户名</th>
                    <td>${sessionScope.teacher.username}</td>
                </tr>
                <tr>
                    <th>姓名</th>
                    <td>${sessionScope.teacher.name}</td>
                </tr>
                <tr>
                    <th>手机号</th>
                    <td>${sessionScope.teacher.phone}</td>
                </tr>
                <tr>
                    <th>绑定邮箱</th>
                    <td>${sessionScope.teacher.email}</td>
                </tr>
                </tbody>
            </table>
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

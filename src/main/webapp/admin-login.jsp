<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>新东莞培训机构教学管理系统</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/login.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="/lib/layui/layui.js" charset="utf-8"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="login-bg">

<div class="login layui-anim layui-anim-up">
    <div class="message">管理员登录</div>
    <div id="darkbannerwrap"></div>

    <form method="post" class="layui-form">
        <input name="username" placeholder="请输入您的用户名" type="text" class="layui-input">
        <hr class="hr15">
        <input name="password" placeholder="请输入您的登录密码" type="password" class="layui-input">
        <hr class="hr15">
        <input value="立即登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
        <input value="返回首页" class="return-index" style="width:100%;" id="return-index">
        <hr class="hr20">
    </form>
</div>

<script>

    $("#return-index").click(function (){
        location.href = '/index';
    });

    $(function () {
        layui.use('form', function () {
            var form = layui.form;
            form.on('submit(login)', function (data) {
                $.ajax({
                    url: "/adminLogin",
                    data: (data.field),
                    type: "post",
                    success: function (msg) {
                        if (msg === 'ok') {
                            // 成功立即登录
                            // layui.layer.msg("登录成功", {
                            //     icon: 1,
                            //     time: 1200,
                            // });
                            // setTimeout(function () {
                                location.href = '/admin/admin_index'
                            // }, 1200);
                        } else {
                            layui.layer.msg(msg, {
                                icon: 2,
                                time: 1500,
                            })
                        }
                    }
                });
                return false;
            });
        });

    })
</script>
<!-- 底部结束 -->
<script>
    //百度统计可去掉
    var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
</body>
</html>
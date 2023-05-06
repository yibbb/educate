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
    <script
            type="text/javascript"
            src="/lib/layui/layui.js"
            charset="utf-8"
    ></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space">
        <form class="layui-form">
            <div class="layui-form-item">
                <label for="background" class="layui-form-label">
                   新的名字
                </label>
                <div class="layui-input-inline">
                    <input
                            type="text"
                            placeholder="请输入新的名字"
                            name="name"
                            autocomplete="off"
                            class="layui-input"
                            value="${student.name}"
                    />
                </div>
            </div>
            <div class="layui-form-item">
                <label for="background" class="layui-form-label">
                   新的手机号
                </label>
                <div class="layui-input-inline">
                    <input
                            type="text"
                            id="background"
                            placeholder="请输入新的手机号"
                            name="phone"

                            autocomplete="off"
                            class="layui-input"
                            value="${student.phone}"
                    />
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                   新的邮箱
                </label>
                <div class="layui-input-inline">
                    <input
                            type="text"
                            placeholder="请输入新的邮箱"
                            name="email"
                            required=""
                            autocomplete="off"
                            class="layui-input"
                            value="${student.email}"
                    />
                </div>
            </div>
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label"> </label>
                <button
                        class="layui-btn"
                        id="L_repass"
                        lay-filter="add"
                        lay-submit=""
                >
                    确认修改个人信息
                </button>
            </div>
        </form>
    </div>
</div>
<script>
    layui.use(["form", "layer"], function () {
        $ = layui.jquery;
        var form = layui.form,
            layer = layui.layer;

        //自定义验证规则

        //监听提交
        form.on("submit(add)", function (data) {
            console.log(data);
            $.ajax({
                url: "/student/editStudentInfo",
                data: (data.field),
                type: "post",
                success: function (json) {
                    console.log(json);

                    if (json === 'ok') {

                        setTimeout(function (){
                            xadmin.close();
                            // 可以对父窗口进行刷新
                            xadmin.father_reload();
                        }, 1200)
                        layui.layer.msg("个人信息修改成功", {
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
            return false;
        });
    });
</script>
</body>
</html>

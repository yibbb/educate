<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>欢迎修改学生密码界面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
</head>

<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form class="layui-form layui-col-space5">
                        <div class="layui-fluid">
                            <div class="layui-row">
                                <form class="layui-form">
                                    <div class="layui-form-item">
                                        <label for="L_repass" class="layui-form-label">
                                            <span class="x-red">*</span>原密码
                                        </label>
                                        <div class="layui-input-inline">
                                            <input type="password" name="oldPassword"     lay-verify="required"
                                                   autocomplete="off" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label for="L_pass" class="layui-form-label">
                                            <span class="x-red">*</span>新密码
                                        </label>
                                        <div class="layui-input-inline">
                                            <input type="password" id="L_pass" name="newPassword" required=""
                                                   lay-verify="pass" autocomplete="off" class="layui-input">
                                        </div>
                                        <div class="layui-form-mid layui-word-aux">
                                            6到16个字符
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label for="L_repass" class="layui-form-label">
                                            <span class="x-red">*</span>确认新密码
                                        </label>
                                        <div class="layui-input-inline">
                                            <input type="password" id="L_repass" name="repass" required=""
                                                   lay-verify="repass" autocomplete="off" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label for="L_repass" class="layui-form-label">
                                        </label>
                                        <button class="layui-btn" lay-filter="edit" lay-submit="">
                                            修改
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <script>layui.use(['form', 'layer'],
                            function () {
                                $ = layui.jquery;
                                var form = layui.form,
                                    layer = layui.layer;

                                //自定义验证规则
                                form.verify({
                                    nikename: function (value) {
                                        if (value.length < 5) {
                                            return '昵称至少得5个字符啊';
                                        }
                                    },
                                    pass: [/(.+){6,12}$/, '密码必须6到12位'],
                                    repass: function (value) {
                                        if ($('#L_pass').val() != $('#L_repass').val()) {
                                            return '两次密码不一致';
                                        }
                                    }
                                });

                                //监听提交
                                form.on('submit(edit)',
                                    function (data) {
                                        console.log(data);
                                        $.ajax({
                                            url: "/student/editStudentPassword",
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
                                                    layui.layer.msg("密码修改成功", {
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

                            });</script>

                    </form>
                </div>


            </div>
        </div>
    </div>
</div>
</body>


</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <div class="layui-row">
        <form class="layui-form">
            <%--            渲染课程名--%>
            <%--            渲染培训师名--%>
            <%--            渲染学费--%>
            <input value="${tClass.id}" name="tClassId" style="display: none"/>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    课程名称
                </label>
                <div class="layui-input-inline">
                    <input type="text" name="courseName" lay-verify="required"
                           autocomplete="off" class="layui-input  disabled-bgc"
                           value="${tClass.courseName}"
                           disabled>
                </div>

            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    培训师
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="teacherName" name="teacherName" lay-verify="required"
                           autocomplete="off" class="layui-input disabled-bgc"
                           value="${tClass.teacherName}"
                           disabled>
                </div>

            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    学费
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="courseCost" name="courseCost" lay-verify="required"
                           autocomplete="off" class="layui-input disabled-bgc"
                           value="${tClass.courseCost}"
                           disabled>
                </div>

            </div>
            <div
                    class="layui-form-item"
                    style="
              display: flex;
              justify-content: center;
              align-items: center;
              margin-top: 8%;
            "
            >
                <button class="layui-btn" lay-filter="pay" lay-submit>
                    立即支付
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
        form.on("submit(pay)", function (data) {
            console.log(data);
            $.ajax({
                url: "/student/paySignUp",
                data: (data.field),
                type: "post",
                success: function (json) {
                    console.log(json);

                    if (json === 'ok') {

                        setTimeout(function () {
                            xadmin.close();
                            xadmin.father_reload();
                        }, 1200)
                        layui.layer.msg("报名成功", {
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

<style>
    * {
    }
</style>

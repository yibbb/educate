<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <script type="text/javascript" src="/lib/layui/layui.js" charset="utf-8"></script>
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

            <%--            需要传递${requestScope.id}参数到接口--%>
            <%--            <div>${requestScope.id}</div>--%>

            <input type="text" name="studentClassId" value="${param.id}"
                   style="display: none"/>


            <div class="layui-form-item">
                <label for="L_score" class="layui-form-label">
                    <span class="x-red">*</span>理论成绩
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="L_score" name="tScore" required="" lay-verify="score"
                           autocomplete="off" class="layui-input" placeholder="请输入理论成绩"
                  >
                </div>
            </div>
            <div class="layui-form-item">
                <label for="S_score" class="layui-form-label">
                    <span class="x-red">*</span>实践成绩
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="S_score" name="pScore" required="" lay-verify="S_score"
                           autocomplete="off" class="layui-input" placeholder="请输入实践成绩">
                </div>
            </div>
            <div class="layui-form-item">
                <button class="layui-btn" lay-filter="edit" lay-submit="">
                    录入
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

        //监听提交
        form.on('submit(edit)',
            function (data) {
                console.log(data);
                $.ajax({
                    url: "/teacher/enterStudentScore",
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
                            layui.layer.msg("修改成功", {
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
<script>var _hmt = _hmt || [];
(function () {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</body>

</html>

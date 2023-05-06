<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/lib/layui/css/layui.css">
    <script src="/resources/jquery.3.3.1.min.js"></script>
    <script src="/resources/layui/layui.js"></script>

</head>

<body>
<form  class="layui-form" style="width: 30%; height: 30%; margin: 100px 0px 0px 300px">
    <div class="layui-form-item">
        <div class="inputdiv">
            <input type="text" id="userName" name="username" placeholder="请输入用户名"
                   autocomplete="off" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item">
        <button class="layui-btn" lay-submit lay-filter="test" id="test">测试</button>
    </div>
</form>
</div>
</body>
<script>

    layui.form.on("submit(test)", function (formdata) {
        console.log(JSON.stringify(formdata.field))
            $.ajax({
                url: "/myTest/t1",
                data: (formdata.field),
                type: "post",
                dataType: "json",
                success: function (json) {
                    if (json.code === 200) {
                        layui.layer.msg("测试成功", {
                            icon: 1,
                            time: 1200,
                            offset: 't',
                        });
                    } else {
                        layui.layer.msg(json.msg, {
                            icon: 2,
                            time: 1500,
                            offset: 't',
                        })
                    }
                }
            });
        return false;
    });
</script>
</html>
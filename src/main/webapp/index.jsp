<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
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
<div class="container">
    <div class="logo">
        <a>系统首页</a></div>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="index-system-info.jsp">新东莞培训机构</a>
        </li>
    </ul>
</div>
<div class="login layui-anim layui-anim-up">
    <div class="message">新东莞培训机构教学管理系统
    </div>

    <div id="darkbannerwrap"></div>

    <form method="post" class="layui-form">
        <input value="管理员用户登录" lay-submit lay-filter="adminLogin" style="width:100%;" type="submit">
        <hr class="hr20">
        <input value="培训师用户登录" lay-submit lay-filter="teacherLogin" style="width:100%;" type="submit">
        <hr class="hr20">
        <input value="学员用户登录" lay-submit lay-filter="studentLogin" style="width:100%;" type="submit">
        <hr class="hr20">
    </form>
    <form method="post" class="layui-form">
    </form>
</div>
<div class="side-content">
    <div class="lemmaWgt-promotion-vbaike">
        <div class="promotion_title">V百科<a href="/vbaike#gallary" target="_blank">往期回顾</a></div>
        <div class="promotion_viewport">
            <dl>
            </dl>
            <div class="promotion_viewport_pager"></div>
        </div>
    </div>
    <div class="lemmaWgt-promotion-rightPreciseAd" data-lemmaId="4877642" data-lemmaTitle="新东莞培训机构"></div>
    <div class="lemmaWgt-sideRecommend">
        <a name="zhixinWrap" class="qnAnchor"></a>
        <div class="zhixin-box" id="zhixinWrap" data-source="" data-newLemmaId="4877642">
        </div>
        <form id="zhixinErrorForm" class="hidden"
              action="https://sp2.baidu.com/-uV1bjeh1BF3odCf/index.php/feedback/zx/baikeJC" target="zhixinSubErr"
              method="post">
            <input class="js-url" name="fb_html_url" type="hidden"/>
            <input class="js-query" name="fb_query" type="hidden"/>
            <input class="js-title" name="fb_card_title" type="hidden"/>
            <input class="js-content" name="fb_content" type="hidden"/>
            <input class="js-souceId" name="fb_source_id" type="hidden"/>
        </form>
        <iframe id="zhixinSubErr" name="zhixinSubErr" style="display:none" frameborder="0"></iframe>
    </div>
    <div class="layui-card-body ">
        <table class="layui-table layui-form">
            <thead>
            <tr>
                <th>新闻内容</th>
                <th>发布时间</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${newsList}" var="news">
                <tr>
                    <td>${news.context}</td>
                    <td><fmt:formatDate value="${news.createTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script>
    $(function () {
        layui.use('form', function () {
            var form = layui.form;
            // layer.msg('玩命卖萌中', function(){
            //   //关闭后的操作
            //   });
            //监听提交
            // 管理员
            form.on('submit(adminLogin)', function (data) {
                location.href = 'admin-login.jsp'
                return false;
            });
            form.on('submit(teacherLogin)', function (data) {
                location.href = 'teacher-login.jsp'
                return false;
            });
            form.on('submit(studentLogin)', function (data) {
                location.href = 'student-login.jsp'
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
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>添加用户信息</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css" media="all">
    <style>
        body{margin: 10px;}
        .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
    </style>
</head>
<body class="childrenBody">
    <form class="layui-form">
       <div class="layui-form-item">
           <label class="layui-form-label">用户ID：</label>
           <div class="layui-input-block">
               <input type="text" name="id" lay-verify="id" autocomplete="off" placeholder="请输入用户ID(整数)" class="layui-input">
           </div>
       </div>

        <div class="layui-form-item">
            <label class="layui-form-label">用户名：</label>
            <div class="layui-input-block">
                <input type="text" name="username" lay-verify="username" autocomplete="off" placeholder="请输入用户名" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">工作年限：</label>
            <div class="layui-input-block">
                <input type="text" name="experience" lay-verify="experience" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">性别：</label>
            <div class="layui-input-block">
                <select name="sex" lay-filter="sex">
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">考核分数：</label>
            <div class="layui-input-block">
                <input type="text" name="score" lay-verify="score" autocomplete="off" placeholder="0" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">所在城市：</label>
            <div class="layui-input-block">
                <input type="text" name="city" lay-verify="city" autocomplete="off" placeholder="天津" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">个性签名：</label>
            <div class="layui-input-block">
                <input type="text" name="sign" lay-verify="sign" autocomplete="off" placeholder="你好" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">应聘职位：</label>
            <div class="layui-input-block">
                <input type="text" name="classify" lay-verify="classify" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">期望薪资：</label>
            <div class="layui-input-block">
                <input type="text" name="wealth" lay-verify="wealth" autocomplete="off" placeholder="5000" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="testsubmit">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
    <script src="/static/layui/layui.js"></script>
<script>

    layui.use(['form','layer'],function() {
        var form = layui.form,
                layer = parent.layer,
                $ = layui.jquery;

        form.verify({
            id: function (value) {
                if (value.length < 1) {
                    return '用户ID不能为空';
                }
            }
            , username: function (value) {
                if (value.length < 1) {
                    return '用户名不能为空';
                }
            }
        });

        //监听提交
        form.on('submit(testsubmit)', function (data) {
            $.post("/engineer/insert_engineer", {
                en: JSON.stringify(data.field)
            }, function (res) {
                layer.closeAll();
                if(res.code === 200){
                    parent.location.reload();
                }else{
                    layer.msg(res.msg, {icon: 1, time: 2000});
                }
            });

            return false;
        });
    });
</script>
</body>
</html>
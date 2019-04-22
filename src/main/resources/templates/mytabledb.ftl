<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>layui表格数据增删改查</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css" media="all">
    <style>
        body{margin: 10px;}
        .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
    </style>
</head>
<body>
<table class="layui-hide" id="demo" lay-filter="test"></table>
<script type="text/html" id="barDemo">
    <!--
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    -->
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script src="/static/layui/layui.js"></script>
<div class="layui-row" id="popUpdateTest" style="display:none;">
    <div class="layui-col-md10">
        <form class="layui-form" lay-filter="formTestFilter" id="addAndUpdateEmployeeForm" >
            <div class="layui-form-item">
                <label class="layui-form-label">用户ID：</label>
                <div class="layui-input-block">
                    <input type="text" name="id" lay-verify="id" autocomplete="off" placeholder="请输入用户ID(整数)" class="layui-input" disabled="disabled" >
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">用户名：</label>
                <div class="layui-input-block">
                    <input type="text" name="username" lay-verify="username" autocomplete="off" placeholder="" class="layui-input">
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
                    <input type="text" name="city" lay-verify="city" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">个性签名：</label>
                <div class="layui-input-block">
                    <input type="text" name="sign" lay-verify="sign" autocomplete="off" placeholder="" class="layui-input">
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
                    <button class="layui-btn" lay-submit="" lay-filter="editsubmit">立即修改</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    layui.use(['table','form'],function(){
                var table = layui.table,
                        form = layui.form,
                        $ = layui.jquery;
                //执行一个 table 实例
        var tableIns = table.render({
                    elem: '#demo'
                    ,height: 420
                    ,url: '/engineer/mytabledbjson' //数据接口
                    ,method: 'get'
                    ,title: '用户表'
                    ,page: true //开启分页
                    ,limit: 5
                    , limits: [5, 10, 15]
                    ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
                    ,totalRow: false //开启合计行
                    ,cols: [[ //表头
                        {type: 'checkbox', fixed: 'left'}
                        ,{field: 'id', title: 'ID', width:80, sort: true, fixed: 'left', totalRowText: '合计：'}
                        ,{field: 'username', title: '用户名', width:80}
                        ,{field: 'experience', title: '工作年限', width: 150, sort: true, totalRow: true}
                        ,{field: 'sex', title: '性别', width:80, sort: true}
                        ,{field: 'score', title: '考核分数', width: 150, sort: true, totalRow: true}
                        ,{field: 'city', title: '所在城市', width:150}
                        ,{field: 'sign', title: '个性签名', width: 200}
                        ,{field: 'classify', title: '应聘职位', width: 150}
                        ,{field: 'wealth', title: '期望薪资', width: 135, sort: true, totalRow: true}
                        ,{fixed: 'right', width: 165, align:'center', toolbar: '#barDemo'}
                    ]]
                });


        //工具栏事件
        table.on('tool(test)', function (obj) {
            var layEvent = obj.event,
                    data = obj.data;
            if (layEvent === 'edit') { //编辑
                var index = layui.layer.open({
                    title: "编辑用户信息",
                    type: 1,
                    content: $("#popUpdateTest").html()
                });
                layui.layer.full(index);

                layui.form.val("formTestFilter", {
                    "id":data.id
                    ,"username":data.username
                    ,"experience":data.experience
                    ,"sex":data.sex
                    ,"score":data.score
                    ,"city":data.city
                    ,"sign":data.sign
                    ,"classify":data.classify
                    ,"wealth":data.wealth
                });
                layui.form.render(null,'formTestFilter')

            } else if (layEvent === 'del') { //删除
                layer.confirm('确定删除此条记录？', {icon: 3, title: '提示信息'}, function (index) {
                    $.post("/engineer/del_engineer", {
                        id: data.id
                    }, function (data) {
                        //表格数据重载
                        tableIns.reload();
                        //关闭当前弹出框
                        layer.close(index);
                        //显示删除成功还是失败
                        layer.msg(data.msg, {icon: 1, time: 2000});
                    });

                });
              }
            });

        //监听头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id)
                    ,data = checkStatus.data; //获取选中的数据
            switch(obj.event){
                case 'add':
                    var index = layui.layer.open({
                        title: "添加用户信息",
                        type: 2,
                        content: "/engineer/addengineer",
                        success: function (layero, index) {
                            var body = layui.layer.getChildFrame('body', index);
                            setTimeout(function () {
                                layui.layer.tips('点击此处返回用户列表', '.layui-layer-setwin .layui-layer-close', {
                                    tips: 3
                                });
                            }, 500)
                        }

                    });
                    layui.layer.full(index);

                    break;
                case 'update':
                    if(data.length === 0){
                        layer.msg('请选择一行',{icon: 2, time: 2000});
                    } else if(data.length > 1){
                        layer.msg('只能同时编辑一个',{icon: 2, time: 2000});
                    } else {
                        //layer.alert('编辑 [id]：'+ checkStatus.data[0].id);
                        var index = layui.layer.open({
                            title: "编辑用户信息",
                            type: 1,
                            content: $("#popUpdateTest").html()
                        });
                        layui.layer.full(index);

                        layui.form.val("formTestFilter", {
                            "id":checkStatus.data[0].id
                            ,"username":checkStatus.data[0].username
                            ,"experience":checkStatus.data[0].experience
                            ,"sex":checkStatus.data[0].sex
                            ,"score":checkStatus.data[0].score
                            ,"city":checkStatus.data[0].city
                            ,"sign":checkStatus.data[0].sign
                            ,"classify":checkStatus.data[0].classify
                            ,"wealth":checkStatus.data[0].wealth
                        });
                        layui.form.render(null,'formTestFilter')
                    }
                    break;
                case 'delete':
                    if(data.length === 0){
                        layer.msg('请选择一行',{icon:2, time: 2000});
                    } else {
                        var newsId = [];
                        if (data.length > 0) {
                            for (var i in data) {
                                newsId.push(data[i].id);
                            }
                            layer.confirm('确定删除选中的用户？', {icon: 3, title: '提示信息'}, function (index) {
                                $.ajax({
                                    url: '/engineer/del_engineer_list',
                                    contentType: "application/json;charset=UTF-8",
                                    type: "POST",
                                    dataType: 'json',
                                    data: JSON.stringify(newsId),
                                    success: function (res) {
                                        tableIns.reload();
                                        layer.close(index);
                                        layer.msg(res.msg, {icon: 1, time: 2000});

                                    },
                                    error: function () {
                                        tableIns.reload();
                                        layer.close(index);
                                        layer.msg("提交失败!", {icon: 2, time: 2000});
                                    }
                                });

                            });
                        } else {
                            layer.msg("请选择需要删除的用户");
                        }
                    }
                    break;
            };
        });


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
        form.on('submit(editsubmit)', function (data) {
            $.post("/engineer/update_engineer", {
                en: JSON.stringify(data.field)
            }, function (res) {
                layer.closeAll();
                layer.msg(res.msg, {icon: 1, time: 2000});
                if(res.code === 200){
                    setTimeout(function(){
                        window.parent.location.reload();//修改成功后刷新父界面
                    }, 2500);
                }
            });

            return false;
        });


        });


</script>


</body>
</html>
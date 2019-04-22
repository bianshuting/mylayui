<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>layui在线调试</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css" media="all">
    <style>
        body{margin: 10px;}
        .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
    </style>
</head>
<body>
<table class="layui-hide" id="demo" lay-filter="test"></table>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script src="/static/layui/layui.js"></script>
<script>
    layui.use('table',function(){
                var table = layui.table

                //执行一个 table 实例
                table.render({
                    elem: '#demo'
                    ,height: 420
                    ,url: '/view/mytablejson' //数据接口
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
                        ,{field: 'experience', title: '积分', width: 90, sort: true, totalRow: true}
                        ,{field: 'sex', title: '性别', width:80, sort: true}
                        ,{field: 'score', title: '评分', width: 80, sort: true, totalRow: true}
                        ,{field: 'city', title: '城市', width:150}
                        ,{field: 'sign', title: '签名', width: 200}
                        ,{field: 'classify', title: '职业', width: 100}
                        ,{field: 'wealth', title: '财富', width: 135, sort: true, totalRow: true}
                        ,{fixed: 'right', width: 165, align:'center', toolbar: '#barDemo'}
                    ]]
                });

            }

    );
</script>
</body>
</html>
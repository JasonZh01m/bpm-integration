<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 2016/4/21
  Time: 22:40
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>sss</title>

    <link href="<%=basePath%>static/uploadify/uploadify.css" rel="stylesheet">

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<%=basePath%>static/js/jquery-1.11.2.min.js"></script>
    <script src="<%=basePath%>static/uploadify/jquery.uploadify.js"></script>
</head>
<body>
Welcome to bpm integration!

附件：<input id="uploadify" type="file" name="Filedata"/>

<input id="deleteoid" value="" type="text" />
<input id="deletebtn" value="Delete" type="button" />
</body>
<script>
    $(document).ready(function () {
        console.log('ready.constructor.');
        $("#uploadify").uploadify({
            <%--'uploader': '<%=basePath%>static/uploadify/uploadify.swf',--%>
//            'script': '/testupload',
            'swf': '<%=basePath%>static/uploadify/uploadify.swf',
            'uploader': '/bpm-inte/upload',
            'cancelImg': '<%=basePath%>static/uploadify/uploadify-cancel.png',
            'formData':
            {
                'creator': '',
                'parent': '',
                'reserv1': '',
                'reserv2': '',
                'reserv3': ''

            },
//            'folder': 'upload',
//            'queueID': 'custom-queue',
//            'auto': true,
//            'multi': true,
            'progressData': 'percentage', //显示上传进度方式
//            'fileDataName': 'Filedata',
//            'onCancel': function (file) {
//            },
//            'onUploadError': function (file, errorCode, errorMsg, errorString) {
//                alert(456);
//            },
            'onUploadStart': onUploadStart,
            'onUploadSuccess': onUploadSuccess
        });
    });

    function onUploadStart(file) {
        $("#uploadify").uploadify("settings", "formData",
                {
                    'creator': 'jasonzh',
                    'parent': 'testparent',
                    'reserv1': 'testreserv1',
                    'reserv2': 'testreserv2',
                    'reserv3': 'testreserv3'

                });
    }

    var res;

    function onUploadSuccess(file, data, response) {
        res = JSON.parse(data);
        console.log('file:' + JSON.stringify(file) + '\ndata:' + JSON.stringify(data) + '\nresponse:' + response);
        console.log(res.message.code);
    }

    /*$('.deletefile').click(function() {
        console.log('click link' + this.innerHTML);
    })*/

//    $(".deletefile").bind("click",function(){
//        console.log('bind click link' + this.innerHTML);
//    });

//    $(".deletefile").on("click",function(){
//        console.log('bind click link' + this.innerHTML);
//    });

    function deletefile(obj) {
        var oid = obj.getAttribute("fileoid");
        if(oid == undefined || oid == '') {
            alert('文件OID不能为空！');
            return;
        }

        $.ajax({
            url : "/bpm-inte/delete/" + oid,
            type : "post",
            dataType : "json",
            success : function(data) {
                alert(data.message);
            }

        });

    }

    $('#deletebtn').click(function() {

        $.ajax({
            url : "/bpm-inte/delete/" + $('#deleteoid').val(),
            type : "post",
            dataType : "json",
            success : function(data) {
                alert(data.message);
            }

        });
    })

</script>
</html>

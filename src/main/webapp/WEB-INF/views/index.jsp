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

<form id="" action="/testupload2" enctype="multipart/form-data" method="post">
    <input type="file" value="SELECT FILE"/>
    <input type="submit" value="SUBMIT"/>
</form>
</body>
<script>
    $(document).ready(function () {
        console.log('ready.constructor.');
        $("#uploadify").uploadify({
            <%--'uploader': '<%=basePath%>static/uploadify/uploadify.swf',--%>
//            'script': '/testupload',
            'swf': '<%=basePath%>static/uploadify/uploadify.swf',
            'uploader': '/upload',
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

    function onUploadSuccess(file, data, response) {
        console.log('file:' + JSON.stringify(file) + '\ndata:' + JSON.stringify(data) + '\nresponse:' + response);
    }

</script>
</html>

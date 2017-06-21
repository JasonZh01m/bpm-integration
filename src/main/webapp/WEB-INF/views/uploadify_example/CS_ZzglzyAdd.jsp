<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK" errorPage="../ErrorPage.jsp" %>
<%@ page language="java" import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.dsc.nana.user_interface.web.beans.UserProfile" %>
<!-- import UserProfile 取得session裡的UserId -->
<%
    UserProfile tUserInformation = (UserProfile) session.getAttribute(UserProfile.SESSION_KEY);//取得session UserProfile裡的UserId
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type"
          content="text/html; charset=GBK">
    <title align="center">厂商资质管理作業 -- 新增</title>

    <script src="../js/ModalDialog.js" type="text/javascript"></script>
    <script src="../js/OpenWin.js" type="text/javascript"></script>
    <script src="../js/ds.js" type="text/javascript"></script>
    <script src="../js/jquery-1.4.min.js" type="text/javascript"></script>
    <script type="text/javascript" src='../dwrDefault/engine.js'></script>
    <script type="text/javascript" src='../dwrDefault/util.js'></script>
    <script type="text/javascript" src='../dwrDefault/interface/ajax_DatabaseAccessor.js'></script>
    <script type="text/javascript" src="../dwrDefault/interface/ajax_ExtOrgAccessor.js"></script>
    <script type="text/javascript" src="../CustomJsLib/EFGPShareMethod2.js"></script>
    <script type="text/javascript" src="../CustomJsLib/osm/osmCommonJs.js"></script>
    <script type="text/javascript" src="../CustomJsLib/osm/osmDataBaseInfo.js"></script>
    <script type="text/javascript" src="../CustomJsLib/log4js.js"></script>
    <script type="text/javascript" src="../CustomJsLib/ds_j.js"></script>
    <script type="text/javascript" src="../CustomJsLib/prefixDocument/formPrefixDocument.js"></script>
    <script type="text/javascript" src="../CustomJsLib/prefixAction/formComponentAction.js"></script>
    <!--产品日期-->
    <script type="text/javascript" src="../js/calendar/calendar.js"></script>
    <script type="text/javascript" src="../js/calendar/lang/calendar-TW.js"></script>
    <script type="text/javascript" src="../js/calendar/calendar-setup.js"></script>
    <!-- popup dialog stylesheet -->
    <link rel="stylesheet" type="text/css" href="../theme/default/css/popup.css"/>
    <link rel="stylesheet" type="text/css" href="../theme/default/css/frame.css"/>     <!-- 产品样式-->
    <link rel="stylesheet" type="text/css" href="../theme/default/css/component.css"/> <!-- 产品样式-->
    <link href="../theme/default/css/common.css" rel="stylesheet" type="text/css">    <!-- 产品样式-->
    <link rel="stylesheet" type="text/css" media="all" href="../theme/default/css/calendar/calendar-win2k-cold-1.css"
          title="win2k-cold-1"/>
    <link href="/NaNaWeb/theme/default/css/common.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="/ajaxRead/dwrCustom/util.js"></script>
    <script type="text/javascript" src="/ajaxRead/dwrCustom/engine.js"></script>
    <script type="text/javascript" src="/ajaxRead/dwrCustom/interface/ajax_DataRead.js"></script>

    <%--uploaify--%>
    <link href="../CustomJsLib/uploadify/uploadify.css" rel="stylesheet">
    <script type="text/javascript" src="../CustomJsLib/uploadify/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="../CustomJsLib/uploadify/jquery.uploadify.js"></script>


    <style>
        .cont {
            position: relative;
            left: 150px;
        }

        /*.div1 {*/
            /*float: right;*/
        /*}*/

        .div2 {
            position: relative;
            left: 150px;
        }

        .td1 {
            width: 200px;
            text-align: right;
        }

        .rTd1 {
            width: 530px;
        }

        .td2 {
            width: 200px;
            text-align: left;
        }

        .table2 {
            text-align: right;
        }

        .noWean {
            display: none;
        }

        .endTable {
            vertical-align: center;
            width: 80%;
            table-layout: fixed;
        }

        .tb {
            vertical-align: center;
            width: 80%;
            table-layout: fixed;
        }

        .cont {
            position: relative;
            left: 110px;
        }
    </style>
</head>
<body>
<div class="div1">
    <input type="button" id="btnNew" value="查看" onclick="toQueryPage();"
           style="width:100px;height:26px;">
    <input type="button" id="btnNew" value="暂存" onclick="btnSave_onclick()" style="width:100px;height:26px;">
    <input type="button" id="btnNew" value="保存" onclick="btnSubmit_onclick()" style="width:100px;height:26px;">
</div>
<div class="cont">
    <div align="center">
        <center><h2>厂商资质管理作業 -- 新增</h2></center>
    </div>
    <br>

    <form>
        <table>
            <tr>
                <td class='td1 redflag'>资质证书名称：</td>
                <td colspan="3"><input class='rTd1' type='text' id="txtZzzsmc"/></td>
            </tr>
            <tr>
                <td class='td1 redflag'>厂商品牌：</td>
                <td colspan="1"><input style="width:70px;" type="text" id="txtCsppID"/><input type='button' value="..."
                                                                                              onclick="btnPfx_onclick()"/><input
                        style="width:70px;" type="text" id="txtCsppName"/></td>
                <td class='td1 redflag'>ITS协议签约法体人：</td>
                <%--<td class='td2'><input type="text" id="txtITSxyqyfrt"/></td>--%>
                <td>
                    <input type="text" id="txtITSxyqyfrt" style="width: 50px" readonly="readonly"><input
                        type="button" id="btnITSxyqyfrt" value="..." onclick="btnITSxyqyfrt_onclick()"
                        style="width: 30px"><input type="text" id="txtITSxyqyfrtName" style="width: 100px"
                                                   readonly="readonly">
                </td>
            </tr>
            <tr>
                <td class='td1 redflag'>关联的厂商协议：</td>
                <!-- <td colspan="1"><input type="text" id="hdnXylbID"/></td> -->
                <td><input type="text" id="txtXylbName" style="width: 150px" readonly="readonly"><input
                        type="button" id="btnXylb" value="..." onclick="btnXylb_onclick()" style="width: 30px"><input
                        type="hidden" id="hdnXylbID" style="width: 100px"></td>
                <td class='td1 redflag'>证书有效期起始日期：</td>
                <td class='td2'><input type="text" name="txtZsyxqsrq" id="txtZsyxqsrq" readonly="true" value=""/><input
                        type='button' id="btnZsyxqsrq" value="..." onclick="HS_setDate(txtZsyxqsrq)"/>
                </td>
            </tr>
            <tr>
                <td class='td1 redflag'>证书有效期终止日期：</td>
                <td colspan="1"><input type="text" name="txtZsyxzzrq" id="txtZsyxzzrq" readonly="true" value=""/><input
                        type='button' value="..." id="btnZsyxzzrq" onclick="HS_setDate(txtZsyxzzrq)"/>
                    <input type="checkbox" id="neverExpiresChx" onclick="neverExpiresClick()"> 永久有效
                </td>
                <td class='td1 redflag'>资质证书有效期：</td>
                <td class='td2'><input type="text" id="txtZzzsyxq" style="width:100px;" readonly="true"/><input
                        type="button" id="but" value="计算天数" onclick="txtZzzsyxq_onblur()" style="width:58px;"/></td>
            </tr>
            <tr>
                <td class='td1 redflag'>资质初始获得时间：</td>
                <td colspan="3"><input type="text" id='txtCshdsj' readonly="true"/><input type='button' value="..."
                                                                                          onclick="HS_setDate(txtCshdsj)"/>
                </td>
            </tr>
            <tr>
                <td class='td1 redflag'>资质到期是否提醒：</td>
                <td colspan="1"><input name="zztx" type="radio" id="rdoSftx" value="0" onclick="sftx_onclick()"/>提醒&nbsp&nbsp&nbsp&nbsp<input
                        name="zztx" type='radio' id="zzdqNtx" value="1" onclick="sftx_onclick()"/>不提醒<input id="hdnSftx"
                                                                                                            type="text"
                                                                                                            class="noWean"/>
                </td>
                <td class='td1 redflag'>邮件通知群组：</td>
                <td class='td2'><input type="text" readonly="true" id="txtYjqz"/><input type="button" id="btnYjqz"
                                                                                        value="..."
                                                                                        onclick="btnYjqz_onclick()"/><input
                        type="text" id="hdnYjqz" class="noWean"/></td>
            </tr>
            <tr>
                <td class='td1 redflag'>授权使用区域：</td>
                <td colspan="2">
                    <select id='ddlSyqy' onchange="show()">
                        <option value="2" id="dd1">--请选择--</option>
                        <option value="0" id="dd1">中国大陆地区</option>
                        <option value="1" id="dd2">自定义<input type="text" id="hdnSyqy" class="noWean"/></option>
                    </select>
                    <input type="text" id="txtSyqy_zdy" style="display:none;"/>
                </td>

            </tr>
            <tr>
                <td class='td1 redflag'>资质适用范畴：</td>
                <td colspan="3"><input type="checkBox" value="申请投标授权" name='test' onclick="fcZdy_onclick0()"
                                       id="zzsyfc1"/>申请投标授权<input type="checkBox" value="下单" name='test' name='test'
                                                                  onclick="fcZdy_onclick0()" id="zzsyfc2"/>下单<input
                        type="checkBox" value="项目报备" name='test' onclick="fcZdy_onclick0()" id="zzsyfc3"/>项目报备<input
                        type="checkBox" value="参加奖励计划" name='test' onclick="fcZdy_onclick0()" id="zzsyfc4"/>参加奖励计划<input
                        type="checkBox" id="fcZdy" onclick="fcZdy_onclick()" value="4" name="test"/>自定义<input
                        type="hidden" id="hdnSyfc" class="noWean"/><input type="text" id="txtSyfc_zdy" class="noWean"/>
                </td>
            </tr>
            <tr>
                <td class='td1 redflag'>是否有资质原件：</td>
                <td colspan="1">
                    <select id="zzyj">
                        <option value='0'>是</option>
                        <option value='1'>否</option>
                    </select>
                </td>
                <td class='td1 redflag'>原件存放信息：</td>
                <td class='td2'>
                    <select id="yjcfxx">
                        <option value='0'>机要室</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class='td1 redflag'>扫描件存放信息：</td>
                <td colspan="1">
                    <select id="smjcf">
                        <option value='0'>机要室</option>
                    </select>
                </td>
                <td class='td1'>资质放机要事时间：</td>
                <td class='td2'><input type="text" id="txtZzfjyssj" readonly="true"/><input type="button"
                                                                                            id="btnZzfjyssj" value="..."
                                                                                            onclick="HS_setDate(txtZzfjyssj)"/>
                </td>
            </tr>
        </table>
    </form>
</div>
<br>
<br>
<div style="background-color:blue;"><span style="color:white">单身<span></div>
<br>
<br>
<div class='div2'>
    <table>
        <tr>
            <td>附件：</td>
            <td width="400px;"><input id="file_upload" type="file" name="uploadfile"/></td>
        </tr>
    </table>
    <%--<input type="button" value='新增' style="width:100px;" id="btnCreate" onclick="btnCreate_onclick()"/>&nbsp&nbsp&nbsp&nbsp--%>

    <%--<input type="button" value='删除' style="width:100px;" id="btnDelete" onclick="btnDelete_onclick()"/>&nbsp&nbsp&nbsp&nbsp--%>
</div>
<br>
<div align="center">
    <table id="Grid" class="tb" border='1px' cellspacing='0px'>
    </table>
</div>
</body>

<script type="text/javascript" language="javascript">
    var databaseCfgId_GP = "EFGP";
	var databaseCfgIdYiFei = "YiFei"; //数据库名
    var txtZzzsmc = document.getElementById("txtZzzsmc");// 资质证书名称
    var txtCsppID = document.getElementById("txtCsppID");// 厂商品牌ID
    var txtCsppName = document.getElementById("txtCsppName");// 厂商品牌
    var hdnXylbID = document.getElementById("hdnXylbID");// 关联的厂商协议
    var txtITSxyqyfrt = document.getElementById("txtITSxyqyfrt");// ITS协议签约法人体
    var txtCshdsj = document.getElementById("txtCshdsj");// 资质初始获得时间
    var ddlSyqy = document.getElementById("ddlSyqy");// 授权使用区域
    var tHdnSyqy = document.getElementById("hdnSyqy");// 授权使用区域隐藏栏位
    var ddlZzyj = document.getElementById("ddlZzyj");// 是否有资质原件
    var txtYjqz = document.getElementById("txtYjqz");// 邮件通知群组名称
    var txtSyqy_zdy = document.getElementById("txtSyqy_zdy");// 授权使用区域自定义
    var txtSyfc_zdy = document.getElementById("txtSyfc_zdy");// 资质使用范畴自定义
    var message = "";
    var tHdnSyfc = document.getElementById("hdnSyfc");// 资质使用范畴隐藏栏位
    var ddlYjcfxx = document.getElementById("ddlYjcfxx");// 原件存放信息
    var zzyj = document.getElementById("zzyj").options[document.getElementById("zzyj").selectedIndex].innerHTML;//是否有资质原件
    var yjcfxx = document.getElementById("yjcfxx").options[document.getElementById("yjcfxx").selectedIndex].innerHTML;//原件存放信息
    var smjcf = document.getElementById("smjcf").options[document.getElementById("smjcf").selectedIndex].innerHTML;//原件存放信息
    var ddlSmjcfxx = document.getElementById("ddlSmjcfxx");// 扫描件存放信息
    var startTime = document.getElementById("txtZsyxqsrq");// 开始日期
    var finishTime = document.getElementById("txtZsyxzzrq");// 结束日期
    var txtPOApproveDateTo_calendar;
    var txtPOApproveDateFrom_lastAllowDate;
    var txtPOApproveDateFrom_calendar;
    var txtPOApproveDateTo_lastAllowDate;
    var txtZzzsyxq = document.getElementById("txtZzzsyxq");// 资质证书有效期
    var tZzdqTx = document.getElementById("rdoSftx");// 资质到期提醒
    var tTxtZzfjyssj = document.getElementById("txtZzfjyssj");

    // Grid的相关栏位
    var infoTbColValue = "附件名称,附件上传日期,附件上传人,操作";
    var tHdnFjmc = document.getElementById("hdnFjmc");// 附件上传名称
    var tHdnFjsj = document.getElementById("hdnFjsj");// 附件上传数据
    //    var txtScrq = document.getElementById("txtScrq");// 附件上传日期
    //    var txtScr = document.getElementById("txtScr");// 附件上传人
    var hdnScr = document.getElementById("hdnScr");// 附件上传人代号
    var trsd = document.getElementById("Grid").getElementsByTagName("tr");
    var tBtnYjqz = document.getElementById("btnYjqz");
    var tTxtYjqz = document.getElementById("txtYjqz");
    var tHdnSftx = document.getElementById("hdnSftx");
    var TbPageNum = 1;
    var infoObjData = [];
    var deleteStr = "";
    var delNumber = ""; // 记录删除
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    var arr = new Array();
    var OID = "";//主表OID


    var tUserId = '<%=tUserInformation.getId()%>';//登入頁面user id
    var tUserName = '<%=tUserInformation.getName()%>';//登入頁面user name
    var basePath = '<%=basePath%>';


    if (!document.getElementsByClassName) {
        document.getElementsByClassName = function (className, element) {
            var children = (element || document).getElementsByTagName('*');
            var elements = new Array();
            for (var i = 0; i < children.length; i++) {
                var child = children[i];
                var classNames = child.className.split(' ');
                for (var j = 0; j < classNames.length; j++) {
                    if (classNames[j] == className) {
                        elements.push(child);
                        break;
                    }
                }
            }
            return elements;
        };
    }

    // 页面加载完毕就执行
    window.onload = function () {
        setRequiredRed();
        OpenQueryInfo();
        tTxtZzfjyssj.value = year + "-" + month + "-" + day;
        tHdnSyqy.value = "2";
        tBtnYjqz.disabled = true;
        tTxtYjqz.disabled = true;
        OID = UUID.prototype.createUUID();
        //document.getElementById("hdnSyqy").value="中国大陆地区";
//        txtScr.value = tUserName;
//        hdnScr.value = tUserId;

        $("#file_upload").uploadify({
            'swf': '<%=basePath%>CustomJsLib/uploadify/uploadify.swf',
            'uploader': '/bpm-inte/upload',
            <%--'cancelImg': '<%=basePath%>CustomJsLib/uploadify/uploadify-cancel.png',--%>
            'buttonText': '浏览...',
            'formData': {
                'creator': '',
                'parent': '',
                'reserv1': '',
                'reserv2': '',
                'reserv3': ''

            },
            'progressData': 'percentage', //显示上传进度方式
            'onUploadStart': onUploadStart,
            'onUploadSuccess': onUploadSuccess
        });

    }

    //人员开窗
    /*function btnUser_onclick() {
     //and OU.id='"+tTxtIssuerDeptId.value+"'
     var FileName = "SingleOpenWin";
     var sql = "select U.id,U.userName,OU.id,OU.organizationUnitName from Users U left join Functions F on " +
     "F.occupantOID = U.OID  left join OrganizationUnit OU on OU.OID = F.organizationUnitOID " +
     " where (U.leaveDate is null OR U.leaveDate > convert(VARCHAR(100),'" + tTxtZzfjyssj.value +
     "',111)) and F.isMain = 1  and OU.organizationUnitType = 0 order by U.id";
     var SQLClaused = new Array(sql);
     var SQLLabel = new Array("申請人代號", "申請人名稱", "部門代號", "部門名稱");//客製開窗的Grid Label
     var QBEField = new Array("U.id", "U.userName", "OU.id", "OU.organizationUnitName");//模糊查詢,須和DB Table欄位名稱相同
     var QBELabel = new Array("申請人", "申請人名稱");//模糊查詢的Label
     var ReturnId = new Array("hdnScr", "txtScr");//畫面上的欄位
     //var ReturnId = new Array("txtApplicantId", "txtApplicantName","txtApplicantDeptId","txtApplicantDeptName");//畫面上的欄位
     singleOpenWin(FileName, databaseCfgId_GP, SQLClaused, SQLLabel, QBEField, QBELabel, ReturnId);
     }*/

    //保存后晴空栏位
    function clearMeaasge() {
        location.reload();
        /*document.getElementById("txtZzzsmc").value="";
         document.getElementById("txtCsppID").value="";
         document.getElementById("txtCsppName").value="";
         document.getElementById("txtITSxyqyfrt").value="";
         document.getElementById("hdnXylbID").value="";
         document.getElementById("txtZsyxqsrq").value="";
         document.getElementById("txtZsyxzzrq").value="";
         document.getElementById("txtZzzsyxq").value="";
         document.getElementById("txtCshdsj").value="";
         document.getElementById("hdnSftx").value="";
         document.getElementById("txtYjqz").value="";
         document.getElementById("hdnYjqz").value="";
         document.getElementById("hdnSyqy").value="中国大陆地区";
         document.getElementById("txtSyqy_zdy").value="";
         document.getElementById("hdnSyfc").value="";
         document.getElementById("txtSyfc_zdy").value="";
         document.getElementById("hdnFjmc").value="";
         document.getElementById("txtScrq").value="";
         document.getElementById("txtScr").value="";
         document.getElementById("txtSyfc_zdy").style.display = "none";
         document.getElementById("txtSyqy_zdy").style.display="none";
         tBtnYjqz.disabled = true;
         tTxtYjqz.disabled = true;
         clearCheck();
         deletRow();*/
    }


    //生成32位随机码
    function UUID() {
        this.id = this.createUUID();
    }


    UUID.prototype.valueOf = function () {
        return this.id;
    };
    UUID.prototype.toString = function () {
        return this.id;
    };

    //
    // INSTANCE SPECIFIC METHODS
    //
    UUID.prototype.createUUID = function () {
        var dg = new Date(1582, 10, 15, 0, 0, 0, 0);
        var dc = new Date();
        var t = dc.getTime() - dg.getTime();
        var tl = UUID.getIntegerBits(t, 0, 31);
        var tm = UUID.getIntegerBits(t, 32, 47);
        var thv = UUID.getIntegerBits(t, 48, 59) + '1'; // version 1, security version is 2
        var csar = UUID.getIntegerBits(UUID.rand(4095), 0, 7);
        var csl = UUID.getIntegerBits(UUID.rand(4095), 0, 7);
        var n = UUID.getIntegerBits(UUID.rand(8191), 0, 7) +
                UUID.getIntegerBits(UUID.rand(8191), 8, 15) +
                UUID.getIntegerBits(UUID.rand(8191), 0, 7) +
                UUID.getIntegerBits(UUID.rand(8191), 8, 15) +
                UUID.getIntegerBits(UUID.rand(8191), 0, 15); // this last number is two octets long
        return tl + tm + thv + csar + csl + n;
    };

    UUID.getIntegerBits = function (val, start, end) {
        var base16 = UUID.returnBase(val, 16);
        var quadArray = new Array();
        var quadString = '';
        var i = 0;
        for (i = 0; i < base16.length; i++) {
            quadArray.push(base16.substring(i, i + 1));
        }
        for (i = Math.floor(start / 4); i <= Math.floor(end / 4); i++) {
            if (!quadArray[i] || quadArray[i] == '') quadString += '0';
            else quadString += quadArray[i];
        }
        return quadString;
    };


    UUID.returnBase = function (number, base) {
        return (number).toString(base).toUpperCase();
    };

    UUID.rand = function (max) {
        return Math.floor(Math.random() * (max + 1));
    };

    //暂存
    function btnSave_onclick() {
//        if (checkNull()) {
        var infoDataGrid1 = GetInfoFromTable("Grid");
        //删除操作
        var sqld0 = "delete from dsmpd_temp where dsmpd001='" + OID + "'";
//        var sqld1 = "delete from dsmpe_temp where dsmpe001='" + OID + "'";
        UpdateInfo(sqld0);
//        UpdateInfo(sqld1);
        //插入操作

        //插入dsmpd表
        var a = document.getElementById("txtZzzsmc").value;
        var b = document.getElementById("txtCsppID").value;
        var c = document.getElementById("txtCsppName").value;
        var d = document.getElementById("txtITSxyqyfrt").value;
        var e = document.getElementById("hdnXylbID").value;
        var f = document.getElementById("txtZsyxqsrq").value;
        var j1 = document.getElementById("txtZsyxzzrq").value;
        var k = document.getElementById("txtZzzsyxq").value;
        var l = document.getElementById("txtCshdsj").value;
        var m = document.getElementById("hdnSftx").value;
        var n = document.getElementById("txtYjqz").value;
        var o = document.getElementById("hdnSyqy").value;
        var p = document.getElementById("txtSyqy_zdy").value;
        var q = document.getElementById("hdnSyfc").value;
        var r = document.getElementById("txtSyfc_zdy").value;
        var s = document.getElementById("txtZzfjyssj").value;
		var hh=document.getElementById("txtITSxyqyfrtName").value;
        var sqli0 = "insert into dsmpd_temp(dsmpd001,dsmpd002,dsmpd003,dsmpd003C,dsmpd004,dsmpd004C,dsmpd005,dsmpd006,dsmpd007,dsmpd008,dsmpd009,dsmpd010,dsmpd011,dsmpd013,dsmpd013C,dsmpd012,dsmpd012C,dsmpd014,dsmpd015,dsmpd016,dsmpd017,dsmpd018,dsmpd019) " +
                " values (N'" + OID + "',N'" + a + "',N'" + b + "',N'" + c + "',N'" + d +"',N'" + hh + "',N'" + e + "',N'" + f + "',N'" + j1 + "',N'" + k + "',N'" + l + "',N'" + m + "',N'" + n + "',N'" + o + "',N'" + p + "',N'" + q + "',N'" + r + "',N'" + zzyj + "',N'" + yjcfxx + "',N'" + smjcf + "',N'" + s + "','11','12')";
        UpdateInfo(sqli0);

        //插入dsmpe表
        /*for (var i = 1; i < infoDataGrid1.length; i++) {
            var sqli1 = "insert into dsmpe_temp values(N'1',N'" + infoDataGrid1[i][0] + "',N'" + infoDataGrid1[i][1] + "',N'" + infoDataGrid1[i][2] + "',N'0',N'" + OID + "')";
            /!*	sqli1+="N'"+OID+"',";
             for(var j=0;j<6;j++){
             sqli1+="N'"+infoDataGrid1[i][j]+"','0')";
             }*!/
            UpdateInfo(sqli1);
        }*/


        //跳转回查询页面
        alert("暂存成功！");
        //clearMeaasge();
        //deletRow();
//        }
    }

    //保存
    function btnSubmit_onclick() {
        if (checkNull()) {
            var infoDataGrid1 = GetInfoFromTable("Grid");
            //删除操作
            var sqld0 = "delete from dsmpd_temp where dsmpd001='" + OID + "'";
//            var sqld1 = "delete from dsmpe_temp where dsmpe006='" + OID + "'";
            UpdateInfo(sqld0);
//            UpdateInfo(sqld1);

            //插入操作

            //插入dsmph表
            var a = document.getElementById("txtZzzsmc").value;
            var b = document.getElementById("txtCsppID").value;
            var c = document.getElementById("txtCsppName").value;
            var d = document.getElementById("txtITSxyqyfrt").value;
            var e = document.getElementById("hdnXylbID").value;
            var f = document.getElementById("txtZsyxqsrq").value;
            var j = document.getElementById("txtZsyxzzrq").value;
            var k = document.getElementById("txtZzzsyxq").value;
            var l = document.getElementById("txtCshdsj").value;
            var m = document.getElementById("hdnSftx").value;
            var n = document.getElementById("txtYjqz").value;
            var o = document.getElementById("hdnSyqy").value;
            var p = document.getElementById("txtSyqy_zdy").value;
            var q = document.getElementById("hdnSyfc").value;
            var r = document.getElementById("txtSyfc_zdy").value;
            var s = document.getElementById("txtZzfjyssj").value;
			var hh=document.getElementById("txtITSxyqyfrtName").value;
            var sqli0 = "insert into dsmpd(dsmpd001,dsmpd002,dsmpd003,dsmpd003C,dsmpd004,dsmpd004C,dsmpd005,dsmpd006,dsmpd007,dsmpd008,dsmpd009,dsmpd010,dsmpd011,dsmpd013,dsmpd013C,dsmpd012,dsmpd012C,dsmpd014,dsmpd015,dsmpd016,dsmpd017,dsmpd018,dsmpd019) " +
                    " values (N'" + OID + "',N'" + a + "',N'" + b + "',N'" + c + "',N'" + d +"',N'" + hh + "',N'" + e + "',N'" + f + "',N'" + j + "',N'" + k + "',N'" + l + "',N'" + m + "',N'" + n + "',N'" + o + "',N'" + p + "',N'" + q + "',N'" + r + "',N'" + zzyj + "',N'" + yjcfxx + "',N'" + smjcf + "',N'" + s + "','11','12')";
            UpdateInfo(sqli0);

            //插入dsmpi表
            /*for (var i = 1; i < infoDataGrid1.length; i++) {
                var sqli1 = "insert into dsmpe values(N'1',N'" + infoDataGrid1[i][0] + "',N'" + infoDataGrid1[i][1] + "',N'" + infoDataGrid1[i][2] + "',N'2',N'" + OID + "')";
                /!*sqli1+="N'"+OID+"',";
                 for(var j=0;j<6;j++){
                 sqli1+="N'"+infoDataGrid1[i][j]+"','2')";
                 }*!/
                UpdateInfo(sqli1);
            }*/

            //删除暂存表数据
            var sqld00 = "delete from dsmpd_temp where dsmpd001='" + OID + "'";
//            var sqld11 = "delete from dsmpe_temp where dsmpe006='" + OID + "'";
            UpdateInfo(sqld00);
//            UpdateInfo(sqld11);
            alert("保存成功！");

        }
    }

    //遍历table所有值并存储至二维数组中
    function GetInfoFromTable(tableid) {
        var infoData = [];
        var tableObj = document.getElementById(tableid);
        for (var i = 0; i < tableObj.rows.length; i++) {    //遍历Table的所有Row
            infoData[i] = new Array();
            for (var j = 0; j < tableObj.rows[i].cells.length; j++) {   //遍历Row中的每一列
                infoData[i][j] = tableObj.rows[i].cells[j].innerText;   //获取Table中单元格的内容
            }
        }
        return infoData;
    }

    //操作数据
    function UpdateInfo(sql) {
        var Sql = sql;
        DWREngine.setAsync(false);//關閉Ajax同步
        ajax_DatabaseAccessor.executeUpdate(databaseCfgId_GP, Sql, null, null, null);
        DWREngine.setAsync(true);//開啟Ajax同步
    }
    //删除Grid行数
    function deletRow() {
        var myTable = document.getElementById('Grid');
        var rowLen = myTable.rows;
        for (var i = 1; i < rowLen.length; i++) {
            myTable.deleteRow(i);
        }
    }

    //单身的判空
    function checkNull() {
        //var gridData1=GridObj.getData();
        var str = "";
        var mes = "不能为空！！";
        if (txtZzzsmc.value == "") {
            str += "资质证书名称" + mes + "\n";
        }
        if (txtCsppID.value == "") {
            str += "厂商品牌ID" + mes + "\n";
        }
        if (txtCsppName.value == "") {
            str += "厂商品牌名称" + mes + "\n";
        }
        if (txtITSxyqyfrt.value == "") {
            str += "ITS协议签约法人体" + mes + "\n";
        }
        if (hdnXylbID.value == "") {
            str += "关联的厂商协议" + mes + "\n";
        }
        if (txtZzzsyxq.value == "") {
            str += "资质证书有效期" + mes + "\n";
        }
        if (txtCshdsj.value == "") {
            str += "资质初始获得时间" + mes + "\n";
        }
        if (startTime.value == "") {
            str += "证书有效期起始日期" + mes + "\n";
        }
        if (!document.getElementById('neverExpiresChx').checked) {
            if (finishTime.value == "") {
                str += "证书有效期终止日期" + mes + "\n";
            }
        }

        if (tHdnSftx.value == "提醒" && txtYjqz.value == "") {
            str += "邮件通知群组名称" + mes + "\n";
        }
        if (tHdnSftx.value == "") {
            str += "资质到期是否提醒" + mes + "\n";
        }
        if (tHdnSyqy.value == "2") {
            str += "授权使用区域" + mes + "\n";
        }
        if (tHdnSyqy.value == "自定义" && txtSyqy_zdy.value == "") {
            str += "授权使用区域自定义" + mes + "\n";
        }
        if (tHdnSyfc.value == "自定义" && txtSyfc_zdy.value == "") {
            str += "资质使用范畴自定义" + mes + "\n";
        }
        if (tHdnSyfc.value == "") {
            str += "资质使用范畴" + mes + "\n";
        }
        /*if(infoObjData.length==0){
         str+="单身至少有一笔数据资料\n";
         }*/
        if (str != "") {
            alert(str);
            return false;
        } else {
            return true;
        }

    }
    //获取日期毫秒数
    function HmDate(a) {
        a = a.replace(new RegExp("-", "gm"), "/");
        var time = (new Date(a)).getTime(); //得到毫秒数
        return time;
    }
    // 资质证书有效期的计算
    function txtZzzsyxq_onblur() {
        var a = document.getElementById("txtZsyxqsrq").value;
        var b = document.getElementById("txtZsyxzzrq").value;
        if (a != "" && b != "") {
            a = HmDate(a);
            b = HmDate(b);
            if (a < b) {
                var c = parseInt((parseInt(b) - parseInt(a)) / 86400000);
                document.getElementById("txtZzzsyxq").value = c + "天";
            } else {
                document.getElementById("txtZzzsyxq").value = 0 + "天";
                document.getElementById("txtZsyxqsrq").value = "";
                document.getElementById("txtZsyxzzrq").value = "";
                alert("截止时间小于开始时间,请重新选择！！");
            }

        }


    }

    // 厂商品牌开窗
    function btnPfx_onclick() {
        var FileName = "SingleOpenWin";
		 var tSql = " SELECT distinct MB005,MA003 FROM INVMB LEFT JOIN INVMA ON MB005=MA002 WHERE MA001='1' "; 
		 var SQLClaused = new Array(tSql);
		 var SQLLabel = new Array("厂商品牌ID", "厂商品牌（名称）");//客製開窗的Grid Label
		 var QBEField = new Array("MB005", "MA003");//模糊查詢,須和DB Table欄位名稱相同
		 var QBELabel = new Array("厂商品牌ID", "厂商品牌（名称）");//模糊查詢的Label
        var ReturnId = new Array("txtCsppID", "txtCsppName");//畫面上的欄位
        singleOpenWin(FileName, databaseCfgIdYiFei, SQLClaused, SQLLabel, QBEField, QBELabel, ReturnId, 700, 430);
    }

    // 邮件通知群组名称设计
    function sftx_onclick() {
        if (tZzdqTx.checked == true) {
            alert("邮件通知群组名称为必填项,由开窗带出！！");
            tBtnYjqz.disabled = false;
            tTxtYjqz.disabled = false;
            tHdnSftx.value = "提醒";
        } else {
            tBtnYjqz.disabled = true;
            tTxtYjqz.disabled = true;
            tHdnSftx.value = "不提醒";
        }
    }

    function btnYjqz_onclick() {
       	var FileName = "SingleOpenWin";
		var tSql = " select id,groupName from Groups ";
		var SQLClaused = new Array(tSql);
		var SQLLabel = new Array("邮件通知群组名称", "邮件通知群组代号");// 客製開窗的Grid Label
		var QBEField = new Array("groupName", "id");// 模糊查詢,須和DB Table欄位名稱相同
		var QBELabel = new Array("邮件通知群组名称", "邮件通知群组代号");// 模糊查詢的Label
		var ReturnId = new Array("txtYjqz", "hdnYjqz");// 畫面上的欄位
		singleOpenWin(FileName, databaseCfgId_GP, SQLClaused, SQLLabel, QBEField,
				QBELabel, ReturnId);

    }
    // 授权使用区域
    function show() {
        var st = document.getElementById("ddlSyqy");
        var index = st.selectedIndex;
        var tvalue = st.options[index].value;
        if (tvalue == "0") {
            tHdnSyqy.value = "中国大陆地区";
            document.getElementById("txtSyqy_zdy").style.display = "none";
        } else if (tvalue == "1") {
            document.getElementById("txtSyqy_zdy").style.display = "inline";
            tHdnSyqy.value = document.getElementById("txtSyqy_zdy").value;
            //alert("自定义的内容为必填项！！");
        } else {
            document.getElementById("txtSyqy_zdy").style.display = "none";
            tHdnSyqy.value = "2";
        }
    }
    function clearCheck() {
        obj = document.getElementsByName("test");
        check_val = "";
        for (var k = 0; k < obj.length; k++) {
            obj[k].checked = false;
        }
        obj2 = document.getElementsByName("zztx");
        for (var j = 0; j < obj2.length; j++) {
            obj2[j].checked = false;
        }
    }
    // 资质范畴
    function fcZdy_onclick0() {
        obj = document.getElementsByName("test");
        check_val = "";
        for (var k = 0; k < obj.length; k++) {
            if (obj[k].checked) {
                check_val += (obj[k].value) + ";";
                if (obj[k].value == 4) {
                    check_val += txtSyfc_zdy.value;
                }
            }
        }
        tHdnSyfc.value = check_val;
    }
    // 资质范畴自定义
    function fcZdy_onclick() {
        if (document.getElementById("fcZdy").checked == true) {
            document.getElementById("txtSyfc_zdy").style.display = "inline";
            tHdnSyfc.value += ";" + document.getElementById("txtSyfc_zdy").value;
        } else {
            document.getElementById("txtSyfc_zdy").style.display = "none";
        }

    }
    //附件上传
    /*function insertTitle(path) {
     var test1 = path.lastIndexOf("/");  //对路径进行截取
     var test2 = path.lastIndexOf("\\");  //对路径进行截取
     var test = Math.max(test1, test2);
     var byt = [];
     if (test < 0) {
     tHdnFjmc.value = path;
     } else {
     tHdnFjmc.value = path.substring(test + 1); //赋值文件名
     }
     txtScrq.value = year + "/" + month + "/" + day;
     }*/
    // 初始化页面显示
    function OpenQueryInfo() {
        ShowAcceptObjData();// 调用查询显示页码数据方法；
    }


    // 清空书签表格所有信息
    function ClearSelectRedFileData() {
        var opanel = document.getElementById("Grid");
        var pchildren = opanel.childNodes; // 清空表中的行和列
        for (var a = 0; a < pchildren.length; a++) {
            opanel.removeChild(pchildren[a]);
        }
    }
    // 点击查询后显示页码数据；
    function ShowAcceptObjData() {
        var tempArr;
        var colTitle = infoTbColValue.split(","); // 书签列信息显示
        var colNum = colTitle.length; // 计算书签列数
        tempArr = infoObjData; // 记录当前数据行数
        var rowNum = tempArr.length; // 书签行数
        ClearSelectRedFileData(); // 清空动态表格所有信息
        // 动态表格新增标题
        newRow = document.getElementById("Grid").insertRow();
        newRow.align = 'center';
        newRow.style.backgroundColor = "#cccccc";

        for (var i = 0; i < colNum; i++) {
            oCell = newRow.insertCell(i);
            oCell.align = "center";
            oCell.style.fontSize = "16px";
            oCell.innerHTML = "<label id='message' align='center'>&nbsp;&nbsp;"
                    + colTitle[i] + "</label>";

        }

        // 动态表格新增书签信息
        if (tempArr.length != 0) {
            for (var i = 0; i < rowNum; i++) {
                newRow = document.all("Grid").insertRow(i + 1);
                newRow.style.height = '30px';
                for (var j = 0; j < colNum; j++) {
                    oCell.style.width = '80px';
                    oCell.style.align = 'center';
                    oCell.innerHTML = "<label id='message' align='center'>&nbsp;&nbsp;"
                            + tempArr[i][j] + "</label>";
                }
            }
        }
//        hidden();
    }


    // 清空书签表格所有信息
    function ClearSelectRedFileData() {
        var opanel = document.getElementById("Grid");
        var pchildren = opanel.childNodes; // 清空表中的行和列
        for (var a = 0; a < pchildren.length; a++) {
            opanel.removeChild(pchildren[a]);
        }
    }


    // 单击行变色
    function dbChan2() {
        for (var i = 0; i < trsd.length; i++) {
            trsd[i].onmousedown = function () {
                tronmousedown(this);
            };
        }
    }

    function tronmousedown(obj) {
        for (var o = 0; o < trsd.length; o++) {
            if (trsd[o] == obj) {
                trsd[o].style.backgroundColor = '#DFEBF2';
//                dbChan1();
            } else {
                trsd[o].style.backgroundColor = '';
            }
        }

    }

    // 将Grid里的值带入栏位
    /*function dbChan1() {
     for (var i = 1; i < trsd.length; i++) {
     for (var j = 0; j < trsd[i].cells.length; j++) {
     trsd[i].cells[j].onclick = function () {
     tronmousedown1(this);
     }
     }
     }
     }

     function tronmousedown1(obj) {
     for (var o = 0; o < trsd.length; o++) {
     for (var j = 0; j < trsd[o].cells.length; j++) {
     if (trsd[o].cells[j] == obj) {
     tHdnFjmc.value = trsd[o].getElementsByTagName('td')[0].innerText;
     txtScrq.value = trsd[o].getElementsByTagName('td')[1].innerText;
     txtScr.value = trsd[o].getElementsByTagName('td')[2].innerText;
     }
     }
     }
     }*/

    /*function check1() {
     var str = "";
     if (tHdnFjmc.value == "") {
     str += "附件名称不能为空!\n";
     }
     if (txtScrq.value == "") {
     str += "附件上传时间不能为空!\n";
     }
     if (txtScr.value == "") {
     str += "附件上传人不能为空!\n";
     }
     if (str != "") {
     alert(str);
     return false;
     }
     return true;
     }
     */

    // 新增
    /*function btnCreate_onclick() {
     if (check1() == false) {
     return false;
     } else {
     newRow = document.getElementById("Grid").insertRow();
     oCell = newRow.insertCell(0);
     oCell.style.width = '80px';
     oCell.style.align = 'center';
     oCell.align = "center";
     oCell.innerHTML = "<label id='message' align='center'>" + tHdnFjmc.value + "</label>";
     oCell = newRow.insertCell(1);
     oCell.style.width = '80px';
     oCell.style.align = 'center';
     oCell.align = "center";
     oCell.innerHTML = "<label id='message' align='center'>" + txtScrq.value + "</label>";
     oCell = newRow.insertCell(2);
     oCell.style.width = '80px';
     oCell.style.align = 'center';
     oCell.align = "center";
     oCell.innerHTML = "<label id='message' align='center'>" + txtScr.value + "</label>";
     dbChan2();
     clear();
     }

     }*/
    //将Grid里的值存入数组
    function getTdContent() {
        var tab = document.getElementById("Grid");
        var len = tab.cells.length;

        for (var i = 1; i < len; i++) {
            arr.push(tab.cells[i].innerText);
        }
        alert(arr);
    }
    function getRowContent() {
        var tab = document.getElementById("tab");
        var rownum = document.getElementById("rownum").value;
        var len = tab.rows[rownum - 1].cells.length;
        var arr = new Array();
        for (var i = 0; i < len; i++) {
            arr.push(tab.rows[rownum - 1].cells[i].innerText);
        }
        alert(arr);
    }
    // 清除栏位
    function clear() {
        tHdnFjmc.value = "";
//        txtScrq.value = "";
//        txtScr.value = "";
        //document.getElementById("txtFjmc").setAttribute("disabled",true);

    }
    // 修改
    /*function btnUpdate_onclick() {
     if(tHdnFjmc.value==""||txtScrq.value==""||txtScr.value==""){
     alert("修改数据不可为空！！");
     }else{
     for ( var i = 0; i < trsd.length; i++) {
     if (trsd[i].style.backgroundColor == '#dfebf2') {
     trsd[i].getElementsByTagName('td')[0].innerText = tHdnFjmc.value;
     trsd[i].getElementsByTagName('td')[1].innerText = txtScrq.value;
     trsd[i].getElementsByTagName('td')[2].innerText = txtScr.value;
     clear();
     }
     }
     }

     }*/

    // 删除
    /*function btnDelete_onclick() {
     if (tHdnFjmc.value == "" && txtScrq.value == "" && txtScr.value == "") {
     alert("请选择一笔数据！");
     } else {
     for (var i = 1; i < trsd.length; i++) {
     if (trsd[i].style.backgroundColor == '#dfebf2') {
     document.getElementById("Grid").deleteRow(i);
     dbChan2();
     clear();
     }
     }
     }

     }*/


    //日期控件  时间控件
    function HS_DateAdd(interval, number, date) {
        number = parseInt(number);
        if (typeof(date) == "string") {
            var date = new Date(date.split("-")[0], date.split("-")[1], date.split("-")[2])
        }
        if (typeof(date) == "object") {
            var date = date
        }
        switch (interval) {
            case "y":
                return new Date(date.getFullYear() + number, date.getMonth(), date.getDate());
                break;
            case "m":
                return new Date(date.getFullYear(), date.getMonth() + number, checkDate(date.getFullYear(), date.getMonth() + number, date.getDate()));
                break;
            case "d":
                return new Date(date.getFullYear(), date.getMonth(), date.getDate() + number);
                break;
            case "w":
                return new Date(date.getFullYear(), date.getMonth(), 7 * number + date.getDate());
                break;
        }
    }
    //时间控件
    function HS_DateAdd(interval, number, date) {
        number = parseInt(number);
        if (typeof(date) == "string") {
            var date = new Date(date.split("-")[0], date.split("-")[1], date.split("-")[2])
        }
        if (typeof(date) == "object") {
            var date = date
        }
        switch (interval) {
            case "y":
                return new Date(date.getFullYear() + number, date.getMonth(), date.getDate());
                break;
            case "m":
                return new Date(date.getFullYear(), date.getMonth() + number, checkDate(date.getFullYear(), date.getMonth() + number, date.getDate()));
                break;
            case "d":
                return new Date(date.getFullYear(), date.getMonth(), date.getDate() + number);
                break;
            case "w":
                return new Date(date.getFullYear(), date.getMonth(), 7 * number + date.getDate());
                break;
        }
    }
    function checkDate(year, month, date) {
        var enddate = ["31", "28", "31", "30", "31", "30", "31", "31", "30", "31", "30", "31"];
        var returnDate = "";
        if (year % 4 == 0) {
            enddate[1] = "29"
        }
        if (date > enddate[month]) {
            returnDate = enddate[month]
        } else {
            returnDate = date
        }
        return returnDate;
    }

    function WeekDay(date) {
        var theDate;
        if (typeof(date) == "string") {
            theDate = new Date(date.split("-")[0], date.split("-")[1], date.split("-")[2]);
        }
        if (typeof(date) == "object") {
            theDate = date
        }
        return theDate.getDay();
    }
    function HS_calender() {
        var lis = "";
        var style = "";
        style += "<style type='text/css'>";
        style += ".calender { width:170px; height:auto; font-size:12px; margin-right:14px; background:url(calenderbg.gif) no-repeat right center #fff; border:1px solid #397EAE; padding:1px}";
        style += ".calender ul {list-style-type:none; margin:0; padding:0;}";
        style += ".calender .day { background-color:#EDF5FF; height:20px;}";
        style += ".calender .day li,.calender .date li{ float:left; width:14%; height:20px; line-height:20px; text-align:center}";
        style += ".calender li a { text-decoration:none; font-family:Tahoma; font-size:11px; color:#333}";
        style += ".calender li a:hover { color:#f30; text-decoration:underline}";
        style += ".calender li a.hasArticle {font-weight:bold; color:#f60 !important}";
        style += ".lastMonthDate, .nextMonthDate {color:#bbb;font-size:11px}";
        style += ".selectThisYear a, .selectThisMonth a{text-decoration:none; margin:0 2px; color:#000; font-weight:bold}";
        style += ".calender .LastMonth, .calender .NextMonth{ text-decoration:none; color:#000; font-size:18px; font-weight:bold; line-height:16px;}";
        style += ".calender .LastMonth { float:left;}";
        style += ".calender .NextMonth { float:right;}";
        style += ".calenderBody {clear:both}";
        style += ".calenderTitle {text-align:center;height:20px; line-height:20px; clear:both}";
        style += ".today { background-color:#ffffaa;border:1px solid #f60; padding:2px}";
        style += ".today a { color:#f30; }";
        style += ".calenderBottom {clear:both; border-top:1px solid #ddd; padding: 3px 0; text-align:left}";
        style += ".calenderBottom a {text-decoration:none; margin:2px !important; font-weight:bold; color:#000}";
        style += ".calenderBottom a.closeCalender{float:right}";
        style += ".closeCalenderBox {float:right; border:1px solid #000; background:#fff; font-size:9px; width:11px; height:11px; line-height:11px; text-align:center;overflow:hidden; font-weight:normal !important}";
        style += "</style>";

        var now;
        if (typeof(arguments[0]) == "string") {
            selectDate = arguments[0].split("-");
            var year = selectDate[0];
            var month = parseInt(selectDate[1]) - 1 + "";
            var date = selectDate[2];
            now = new Date(year, month, date);
        } else if (typeof(arguments[0]) == "object") {
            now = arguments[0];
        }
        var lastMonthEndDate = HS_DateAdd("d", "-1", now.getFullYear() + "-" + now.getMonth() + "-01").getDate();
        var lastMonthDate = WeekDay(now.getFullYear() + "-" + now.getMonth() + "-01");
        var thisMonthLastDate = HS_DateAdd("d", "-1", now.getFullYear() + "-" + (parseInt(now.getMonth()) + 1).toString() + "-01");
        var thisMonthEndDate = thisMonthLastDate.getDate();
        var thisMonthEndDay = thisMonthLastDate.getDay();
        var todayObj = new Date();
        today = todayObj.getFullYear() + "-" + todayObj.getMonth() + "-" + todayObj.getDate();

        for (i = 0; i < lastMonthDate; i++) {  // Last Month's Date
            lis = "<li class='lastMonthDate'>" + lastMonthEndDate + "</li>" + lis;
            lastMonthEndDate--;
        }
        for (i = 1; i <= thisMonthEndDate; i++) { // Current Month's Date

            if (today == now.getFullYear() + "-" + now.getMonth() + "-" + i) {
                var todayString = now.getFullYear() + "-" + (parseInt(now.getMonth()) + 1).toString() + "-" + i;
                lis += "<li><a href=javascript:void(0) class='today' onclick='_selectThisDay(this)' title='" + now.getFullYear() + "-" + (parseInt(now.getMonth()) + 1) + "-" + i + "'>" + i + "</a></li>";
            } else {
                lis += "<li><a href=javascript:void(0) onclick='_selectThisDay(this)' title='" + now.getFullYear() + "-" + (parseInt(now.getMonth()) + 1) + "-" + i + "'>" + i + "</a></li>";
            }

        }
        var j = 1;
        for (i = thisMonthEndDay; i < 6; i++) {  // Next Month's Date
            lis += "<li class='nextMonthDate'>" + j + "</li>";
            j++;
        }
        lis += style;

        var CalenderTitle = "<a href='javascript:void(0)' class='NextMonth' onclick=HS_calender(HS_DateAdd('m',1,'" + now.getFullYear() + "-" + now.getMonth() + "-" + now.getDate() + "'),this) title='Next_Month'>&raquo;</a>";
        CalenderTitle += "<a href='javascript:void(0)' class='LastMonth' onclick=HS_calender(HS_DateAdd('m',-1,'" + now.getFullYear() + "-" + now.getMonth() + "-" + now.getDate() + "'),this) title='Previous_Month'>&laquo;</a>";
        CalenderTitle += "<span class='selectThisYear'><a href='javascript:void(0)' onclick='CalenderselectYear(this)' title='Click here to select other year' >" + now.getFullYear() + "</a></span>年<span class='selectThisMonth'><a href='javascript:void(0)' onclick='CalenderselectMonth(this)' title='Click here to select other month'>" + (parseInt(now.getMonth()) + 1).toString() + "</a></span>月";

        if (arguments.length > 1) {
            arguments[1].parentNode.parentNode.getElementsByTagName("ul")[1].innerHTML = lis;
            arguments[1].parentNode.innerHTML = CalenderTitle;

        } else {
            var CalenderBox = style + "<div class='calender'><div class='calenderTitle'>" + CalenderTitle + "</div><div class='calenderBody'><ul class='day'><li>日</li><li>一</li><li>二</li><li>三</li><li>四</li><li>五</li><li>六</li></ul><ul class='date' id='thisMonthDate'>" + lis + "</ul></div><div class='calenderBottom'><a href='javascript:void(0)' class='closeCalender' onclick='closeCalender(this)'>×</a><span><span><a href=javascript:void(0) onclick='_selectThisDay(this)' title='" + todayString + "'>Today</a></span></span></div></div>";
            return CalenderBox;
        }
    }
    function _selectThisDay(d) {
        var boxObj = d.parentNode.parentNode.parentNode.parentNode.parentNode;
        boxObj.targetObj.value = d.title;
        boxObj.parentNode.removeChild(boxObj);
    }
    function closeCalender(d) {
        var boxObj = d.parentNode.parentNode.parentNode;
        boxObj.parentNode.removeChild(boxObj);
    }

    function CalenderselectYear(obj) {
        var opt = "";
        var thisYear = obj.innerHTML;
        for (i = 1970; i <= 2020; i++) {
            if (i == thisYear) {
                opt += "<option value=" + i + " selected>" + i + "</option>";
            } else {
                opt += "<option value=" + i + ">" + i + "</option>";
            }
        }
        opt = "<select onblur='selectThisYear(this)' onchange='selectThisYear(this)' style='font-size:11px'>" + opt + "</select>";
        obj.parentNode.innerHTML = opt;
    }

    function selectThisYear(obj) {
        HS_calender(obj.value + "-" + obj.parentNode.parentNode.getElementsByTagName("span")[1].getElementsByTagName("a")[0].innerHTML + "-1", obj.parentNode);
    }

    function CalenderselectMonth(obj) {
        var opt = "";
        var thisMonth = obj.innerHTML;
        for (i = 1; i <= 12; i++) {
            if (i == thisMonth) {
                opt += "<option value=" + i + " selected>" + i + "</option>";
            } else {
                opt += "<option value=" + i + ">" + i + "</option>";
            }
        }
        opt = "<select onblur='selectThisMonth(this)' onchange='selectThisMonth(this)' style='font-size:11px'>" + opt + "</select>";
        obj.parentNode.innerHTML = opt;
    }
    function selectThisMonth(obj) {
        HS_calender(obj.parentNode.parentNode.getElementsByTagName("span")[0].getElementsByTagName("a")[0].innerHTML + "-" + obj.value + "-1", obj.parentNode);
    }
    function HS_setDate(inputObj) {
        var calenderObj = document.createElement("span");
        calenderObj.innerHTML = HS_calender(new Date());
        calenderObj.style.position = "absolute";
        calenderObj.targetObj = inputObj;
        inputObj.parentNode.insertBefore(calenderObj, inputObj.nextSibling);
    }
    /*function hidden() {
     var obj = document.getElementById("Grid");
     for (i = 0; i < obj.rows.length; i++) {
     obj.rows[i].cells[3].style.display = "none";
     obj.rows[i].cells[4].style.display = "none";
     }
     }*/


    // 2017-05-17 added
    //ITS协议签约法人体开窗
    function btnITSxyqyfrt_onclick() {
        var FileName = "SingleOpenWin";
        var tSql = "SELECT distinct ID,NAME FROM Gysinfo";
        var SQLClaused = new Array(tSql);
        var SQLLabel = new Array("ITS协议签约法人体ID", "ITS协议签约法人体名称");//客製開窗的Grid Label
        var QBEField = new Array("ID", "NAME");//模糊查詢,須和DB Table欄位名稱相同
        var QBELabel = new Array("ITS协议签约法人体ID", "ITS协议签约法人体名称");//模糊查詢的Label
        var ReturnId = new Array("txtITSxyqyfrt", "txtITSxyqyfrtName");//畫面上的欄位
        singleOpenWin(FileName, databaseCfgId_GP, SQLClaused, SQLLabel, QBEField, QBELabel, ReturnId, 700, 430);
    }

    function toQueryPage() {
        window.location.href = 'CS_ZzglzyQuery.jsp';
    }

    //协议类别开窗
    function btnXylb_onclick() {
        var FileName = "SingleOpenWin";
        var tSql = "select dsmaa001,dsmaa002 from dsmaa ";
        var SQLClaused = new Array(tSql);
        var SQLLabel = new Array("协议ID", "协议名称"); //客製開窗的Grid Label
        var QBEField = new Array("dsmaa001", "dsmaa002"); //模糊查詢,須和DB Table欄位名稱相同
        var QBELabel = new Array("协议ID", "协议名称"); //模糊查詢的Label
        var ReturnId = new Array("hdnXylbID", "txtXylbName"); //畫面上的欄位
        singleOpenWin(FileName, databaseCfgId_GP, SQLClaused, SQLLabel, QBEField, QBELabel, ReturnId, 700, 430);
    }

    function neverExpiresClick() {
        if (document.getElementById('neverExpiresChx').checked) {
            document.getElementById('btnZsyxzzrq').disabled = true;
            document.getElementById('txtZsyxzzrq').readOnly = true;
            document.getElementById('txtZsyxzzrq').value = "";
			document.getElementById('txtZzzsyxq').value="9999天";
        } else {
            document.getElementById('btnZsyxzzrq').disabled = false;
            document.getElementById('txtZsyxzzrq').readOnly = false;
			document.getElementById('txtZzzsyxq').value="";
        }
    }

    /**
     * 添加 *
     */
    function setRequiredRed() {
        var tds = document.getElementsByClassName('redflag');
        for (var i = 0; i < tds.length; i++) {
            var html = tds[i].innerHTML;
            tds[i].innerHTML = "<span style='color:red'>* </span>" + html;
        }
    }

    function onUploadStart(file) {
        $("#file_upload").uploadify("settings", "formData",
                {
                    'creator': tUserName,
                    'parent': OID,
                    'reserv1': '',
                    'reserv2': '',
                    'reserv3': ''

                });
//        console.log('终止上传！');
//        $('#file_upload').uploadify('cancel', '*');
    }


    function onUploadSuccess(file, data, response) {
        var res = JSON.parse(data);
        attachInfo(res.uploadFiles);
    }

    function attachInfo(files) {
        for (var i = 0; i < files.length; i++) {
            var newRow = document.getElementById("Grid").insertRow();
            var oCell = newRow.insertCell(0);
            oCell.style.width = '80px';
            oCell.style.align = 'center';
            oCell.align = "center";
            oCell.innerHTML = "<a href='/bpm-inte/download/" + files[i].oid + "' style='color:#72ace3;'>" + files[i].name + "</a>";
            var oCell1 = newRow.insertCell(1);
            oCell1.style.width = '80px';
            oCell1.style.align = 'center';
            oCell1.align = "center";
            oCell1.innerHTML = "<label align='center'>" + files[i].createdate + "</label>";
            var oCell2 = newRow.insertCell(2);
            oCell2.style.width = '80px';
            oCell2.style.align = 'center';
            oCell2.align = "center";
            oCell2.innerHTML = "<label align='center'>" + files[i].creator + "</label>";

            var oCell3 = newRow.insertCell(3);
            oCell3.style.width = '80px';
            oCell3.style.align = 'center';
            oCell3.align = "center";
//            oCell3.innerHTML = "<a href='/bpm-inte/delete/" + files[i].oid + "' style='color:#72ace3;'>删除</a>";
            oCell3.innerHTML = "<a href='#' onclick='deletefile(this)' fileoid='" + files[i].oid + "' style='color:#72ace3;'>删除</a>";
            dbChan2();
        }

    }

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
                if(data.code == '1') {
                    ShowAcceptObjData();
                    $.ajax({
                        url : "/bpm-inte/files/" + OID,
                        type : "get",
                        dataType : "json",
                        success : function(data) {
                            attachInfo(data);
                        }
                    });
                }

            }

        });

    }

</script>
</html>

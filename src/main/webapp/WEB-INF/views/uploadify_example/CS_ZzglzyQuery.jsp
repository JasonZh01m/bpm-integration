<%@ page language="java"  contentType="text/html; charset=GBK" pageEncoding="GBK" errorPage="../ErrorPage.jsp" %>
<html>
	<head>
		<meta http-equiv="Content-Type"
			content="text/html; charset=utf-8">
		<title>�������ʹ������I</title>
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
    <!--��Ʒ����-->
    <script type="text/javascript" src="../js/calendar/calendar.js"></script>                            
    <script type="text/javascript" src="../js/calendar/lang/calendar-TW.js"></script>
    <script type="text/javascript" src="../js/calendar/calendar-setup.js"></script>
           <!-- popup dialog stylesheet -->
    <link rel="stylesheet" type="text/css" href="../theme/default/css/popup.css" />
    <link rel="stylesheet" type="text/css" href="../theme/default/css/frame.css" />     <!-- ��Ʒ��ʽ-->
    <link rel="stylesheet" type="text/css" href="../theme/default/css/component.css" /> <!-- ��Ʒ��ʽ-->
    <link href="../theme/default/css/common.css" rel="stylesheet" type="text/css">    <!-- ��Ʒ��ʽ-->
    <link rel="stylesheet" type="text/css" media="all" href="../theme/default/css/calendar/calendar-win2k-cold-1.css" title="win2k-cold-1" />
   <link href="/NaNaWeb/theme/default/css/common.css" rel="stylesheet" type="text/css">
			

	<style>
				.cont{
					position:relative;
					left:150px;
				}
				.div1{
					position:relative;
					left:950px;
				}
				.div2{
					position:relative;
					left:910px;
				}
				.td1{
					width:200px;
					text-align:right;
				}
				.td2{
					width:200px;
					text-align:left;
				}
				.table2{
					text-align:right;
				}
				.noWean{
					display:none;
				}
				.endTable {
					vertical-align: center;
					width: 80%;
					table-layout:fixed;	
				}
				.tb{
					vertical-align: center;
					width: 80%;
					table-layout:fixed;
				}
				.comt{
					position:relative;
					left:110px;
				}
	</style>
	</head>
<body>
		
		<div><center><h2>�������ʹ������I</h2></center></div><br><br><br>
		<div class="div1">
		<input type="button" id="btnNew" value="����" onclick="toAddPage()" style="width:100px;height:26px;">
		</div>
	<div class="cont">
	<form id="exportExcelForm" action="/bpm-inte/exportDsmpd" method="get">
		<table>

			<tr>
				<td class='td1'>����Ʒ�ƣ�</td>
				<td colspan="1"><input  style="width:70px;" type="text" readonly="true" id="txtCsppID" name="txtCsppID"/>
					<input type='button' value="..." onclick="btnPfx_onclick()" id="btnCspp"/>
					<input readonly="true" style="width:70px;" type="text" id="txtCsppName" name="txtCsppName"/></td>
				<td class='td1'>����֤�����ƣ�</td>
				<td><input type='text' id="txtZzzsmc" name="txtZzzsmc"/></td>
			</tr>
			<tr>
				<td class='td1'>ITSЭ��ǩԼ�����ˣ�</td>
				<td class='td2'><input type="text"  style="width:70px;" id="txtITSxyqyfrtID" name="txtITSxyqyfrtID"/><input type="button" value="..." id="btnITSxyqyfrt" onclick="btnITSxyqyfrt_onclick()"/><input type="text"  style="width:70px;" id="txtITSxyqyfrtName"/></td>
				<td class='td1'>��Ȩʹ������</td>
				<td>
					<select id='ddlSyqy' name="ddlSyqy" onchange="show()">
						<option value="2"id="dd3">--��ѡ��--</option>
						<option value="0"id="dd1">�й���½����</option>
						<option value="1" id="dd2">�Զ���<input type="text" id="hdnSyqy" class="noWean"/></option>
					</select>
					<input type="text" id="txtSyqy_zdy" name="txtSyqy_zdy" style="display:none;"/>
				</td>
			</tr>
			<tr>
				<td class='td1'>�������÷��룺<input type="hidden" id="zzsyFc" name="zzsyFc"/></td>
				<td colspan="3"><input type="checkBox" value="0" name="test" onclick="fcZdy_onclick0()" id="id1"/>����Ͷ����Ȩ<input type="checkBox" id="id2" value="1" name="test" onclick="fcZdy_onclick0()"/>�µ�<input type="checkBox" id="id3" value="2" name="test" onclick="fcZdy_onclick0()"/>��Ŀ����<input type="checkBox" value="3" id="id4" name="test" onclick="fcZdy_onclick0()" />�μӽ����ƻ�<input type="checkBox" id="fcZdy"  onclick="fcZdy_onclick()" value="4" />�Զ���<input type="hidden" id="hdnSyfc" class="noWean" /><input type="text" id="txtSyfc_zdy" class="noWean"/></td>
			</tr>
			
			<tr>
				<td class='td1'>֤����Ч����ʼ���ڣ�</td>
				<td class='td2'><input type="text" name="txtYxqssj" readonly="true" id="txtYxqssj" value=""/><input type='button' id="btnYxqssj" value="..." onclick="HS_setDate(txtYxqssj)"/></td>
				<td class='td1'>֤����Ч����ֹ���ڣ�</td>
				<td><input type="text" name="txtYxzzsj" id="txtYxzzsj" readonly="true" value=""/><input type='button' value="..." id="btnYxzzsj" onclick="HS_setDate(txtYxzzsj)"/></td>
			</tr>
			<tr>
				<td class='td1'>���ʷŻ�Ҫ��ʱ�䣺</td>
				<td class='td2'><input type="text" readonly="true" id="txtZzfjyssj" name="txtZzfjyssj"/><input type="button" id="btnZzfjyssj" value="..." onclick="HS_setDate(txtZzfjyssj)"/></td>
				<td class='td1'>�洢״̬��</td>
				<td><select id='saveType' name="saveType">
						<option value="11"id="typ0">--��ѡ��--</option>
						<option value="0"id="typ0">�ݴ�</option>
						<option value="1" id="typ1">����</option>
					</select>
				</td>
			</tr>		
		</table>
	</form>
    </div>	
		<br>
		<br>

	<div class='div2'>
		<br>
		<br>
		<input type="button" value='��ѯ' style="width:100px;" id="btnSearch" onclick="btnSearch_onclick()"/>
		<input type="button" value='����Excel' style="width:100px;" id="btnExport" onclick="btnExport_onclick()"/>
	</div>
	<br>
	<div align="center">
	<table id="grdCSZZ" class="tb" border='1px' cellspacing='0px'>
	</table>
</div>
<div class="endTable" align="center">
	<table >
		<tr>
			<td><input type="button" id="moveFirst" value="��һҳ" onclick="changePageNo('moveFirst')">&nbsp;&nbsp;&nbsp; 
				<input type="button" id="movePrevious" value="��һҳ" onclick="changePageNo('movePrevious')">&nbsp;&nbsp;&nbsp; 
				<input type="button" id="moveNext" value="��һҳ" onclick="changePageNo('moveNext')">&nbsp;&nbsp;&nbsp; 
				<input type="button" id="moveLast" value="���ҳ" onclick="changePageNo('moveLast')">&nbsp;&nbsp;&nbsp; 
				<label id="tabLabel" style="font-size: 14px">ÿҳ��ʾ������&nbsp;&nbsp; 
					<select id="txtSelect" style="height: 20px; overflow-y: auto" onchange="ShowAcceptObjData('1')">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="50">50</option>
						<option value="100">100</option>
					</select> 
				</label>
			</td>
		</tr>
	</table>
</div>
</body>
<script type="text/javascript" language="javascript">
	var databaseCfgId_GP="EFGP";
	var startTime=document.getElementById("txtYxqssj");//��ʼ����
	var finishTime=document.getElementById("txtYxzzsj");//��������
	var txtPOApproveDateTo_calendar;
	var txtPOApproveDateFrom_lastAllowDate;
	var txtPOApproveDateFrom_calendar;
	var txtPOApproveDateTo_lastAllowDate;
	var tZzdqTx=document.getElementById("rdoSftx");//���ʵ�������
	var tTxtZzfjyssj=document.getElementById("txtZzfjyssj");
	var tTxtScrq=document.getElementById("txtScrq");//�����ϴ�ʱ��
	//grdCSZZ�������λ
	var infoTbColValue = "����Ʒ��,����Ʒ��ID,����֤������,֤����Ч����ʼʱ��,֤����Ч����ֹʱ��,���ʷŻ�Ҫ��ʱ��,��Ȩʹ������,����ʹ�÷�Χ,OID";
	var tTxtCsppID=document.getElementById("txtCsppID");
	var tTxtCsppName=document.getElementById("txtCsppName");
	var tTxtITSxyqyfrtID=document.getElementById("txtITSxyqyfrtID");
	var tTxtITSxyqyfrtName=document.getElementById("txtITSxyqyfrtName");
	var tTxtZzzsmc=document.getElementById("txtZzzsmc");
	var trs=document.getElementById("grdCSZZ").getElementsByTagName("tr");
	//var sQqy=document.getElementById("sQqy");
	var tHdnSyqy=document.getElementById("hdnSyqy");
	var tZzsyFc=document.getElementById("zzsyFc");
	var TbPageNum = 1;
	var infoObjData=[];
	//var infoObjData=new Array(new Array);
	var deleteStr="";
	var delNumber="";                //��¼ɾ��
	var date=new Date();
	var year=date.getFullYear();
	var month=date.getMonth()+1;
	var day=date.getDate();	
	//ҳ�������Ͼ�ִ�� 
	window.onload=function(){
		OpenQueryInfo();
		QueryInfo();
		//tTxtZzfjyssj.value=year+"/"+month+"/"+day;
		//tTxtScrq.value=year+"/"+month+"/"+day;
//		alert('set value onload = 1');
		document.getElementById("saveType").value = '1';
	}

		//����Ʒ�ƿ���
		function btnPfx_onclick() {
			
			 var FileName = "SingleOpenWin";
			 var selectType = document.getElementById("saveType").options[document.getElementById("saveType").selectedIndex].value;
			 var tSql;
			 if(selectType=="0"){
				  tSql = " select dsmpd003,dsmpd003C from dsmpd_temp  ";
			 }else if(selectType=="1"){
				  tSql = " select dsmpd003,dsmpd003C from dsmpd  ";
			 }else{
				 tSql = " select dsmpd003,dsmpd003C from dsmpd  ";
			 } 
			 var SQLClaused = new Array(tSql);
			 var SQLLabel = new Array("����Ʒ��ID", "����Ʒ�ƣ����ƣ�");//���u�_����Grid Label
			 var QBEField = new Array("dsmpd003", "dsmpd003C");//ģ����ԃ,횺�DB Table��λ���Q��ͬ
			 var QBELabel = new Array("����Ʒ��ID", "����Ʒ�ƣ����ƣ�");//ģ����ԃ��Label
			 var ReturnId = new Array("txtCsppID", "txtCsppName");//�����ϵę�λ
			 singleOpenWin(FileName, databaseCfgId_GP, SQLClaused, SQLLabel, QBEField, QBELabel, ReturnId,700,430);  
		}
	
	//�ʼ�֪ͨȺ���������
	function sftx_onclick(){
		var tBtnYjqz=document.getElementById("btnYjqz");
		var tTxtYjqz=document.getElementById("txtYjqz");
		var tHdnSftx=document.getElementById("hdnSftx");
		if(tZzdqTx.checked==true){
			alert("�ʼ�֪ͨȺ������Ϊ������,�ɿ�����������");
			tBtnYjqz.disabled=false;
			tTxtYjqz.disabled=false;
			tHdnSftx.value="����";
		}else{
			tBtnYjqz.disabled=true;
			tTxtYjqz.disabled=true;
			tHdnSftx.value="������";
		}
	}

	function btnYjqz_onclick(){
		var FileName = "SingleOpenWin";
		var tSql = " Select id , content ,description From PFXX where sxzt = 'Y' ";
		var SQLClaused = new Array(tSql);
		var SQLLabel = new Array("�ʼ�֪ͨȺ������", "�ʼ�֪ͨȺ�����");//���u�_����grdCSZZ Label
		var QBEField = new Array("txtYjqz", "hdnYjqz");//ģ����ԃ,횺�DB Table��λ���Q��ͬ
		var QBELabel = new Array("����Ʒ��ID", "����Ʒ������");//ģ����ԃ��Label
		var ReturnId = new Array("txtCsppID", "txtCsppName");//�����ϵę�λ
		singleOpenWin(FileName, databaseCfgId, SQLClaused, SQLLabel, QBEField, QBELabel, ReturnId);  
		
	}
	//��Ȩʹ������
	function show(){
		var st=document.getElementById("ddlSyqy");
		var index=st.selectedIndex;
		var tvalue=st.options[index].value;	
		if(tvalue=="0"){
			tHdnSyqy.value="�й���½����";
			document.getElementById("txtSyqy_zdy").style.display="none";
		}else if(tvalue=="1"){
			document.getElementById("txtSyqy_zdy").style.display="inline";
			tHdnSyqy.value=document.getElementById("txtSyqy_zdy").value;
			//alert("�Զ��������Ϊ�������");
		}else{
			document.getElementById("txtSyqy_zdy").style.display="none";
			tHdnSyqy.value="";
		}
	}
	//���ʷ����Զ���
	function fcZdy_onclick(){
		if(document.getElementById("fcZdy").checked==true){
			document.getElementById("txtSyfc_zdy").style.display="inline";
		}else{
			document.getElementById("txtSyfc_zdy").style.display="none";
		}
		
	}
	//����ʹ�÷�Χ
	function fcZdy_onclick0() {
		obj = document.getElementsByName("test"); 
		check_val = ""; 
		for(var k=0;k<obj.length;k++){ 
			if(obj[k].checked){
				check_val+=(obj[k].value)+";";
				if(obj[k].value==4){
					check_val+=txtSyfc_zdy.value;
				}
			} 				
		}
		tZzsyFc.value=check_val;
	}
	 	//��ʼ��ҳ����ʾ
	function OpenQueryInfo() {
			ShowAcceptObjData(TbPageNum);//���ò�ѯ��ʾҳ�����ݷ�����
			dbChan2();//���õ��б�ɫ�ķ�����
	}
	function QueryInfo(){
			var selectType = document.getElementById("saveType").options[document.getElementById("saveType").selectedIndex].value;
			var Sql="";
			if(selectType=="0"){
				Sql="select dsmpd003C,dsmpd003,dsmpd002,dsmpd006,dsmpd007,dsmpd017,dsmpd013,dsmpd012,dsmpd001 from dsmpd_temp where 1=1 " ;
			}else if(selectType=="1"){
				Sql="select dsmpd003C,dsmpd003,dsmpd002,dsmpd006,dsmpd007,dsmpd017,dsmpd013,dsmpd012,dsmpd001 from dsmpd where 1=1 ";
			}else{
				Sql="select dsmpd003C,dsmpd003,dsmpd002,dsmpd006,dsmpd007,dsmpd017,dsmpd013,dsmpd012,dsmpd001 from dsmpd where 1=1 " ;
			}
			if (tTxtZzzsmc.value != "" ){
				Sql += " and dsmpd002 like N'%"+tTxtZzzsmc.value + "%'";
			}
			if (tTxtCsppID.value != "" ){
				Sql += " and dsmpd003 = '"+tTxtCsppID.value + "'";
			}
			
			if (tTxtCsppName.value != "" ){
				Sql += " and dsmpd003C like N'%"+tTxtCsppName.value + "%'";
			}
			
			if (tTxtITSxyqyfrtID.value != ""){
				Sql += " and dsmpd004 = '"+tTxtITSxyqyfrtID.value + "'";
			}
			if (tZzsyFc.value != ""){
				Sql += " and dsmpd012   like N'%"+tZzsyFc.value + "%'";
			}
			if (startTime.value != ""){
				Sql += " and dsmpd006  like '%"+startTime.value + "%'";
			}
			if (finishTime.value != ""){
				Sql += " and dsmpd007 like N'%"+finishTime.value + "%'";
			}
			if (tTxtZzfjyssj.value != ""){
				Sql += " and dsmpd017 like N'%"+tTxtZzfjyssj.value + "%'";
			}
			if (tHdnSyqy.value != ""){
				Sql += " and dsmpd013 like N'%"+tHdnSyqy.value  + "%'";
			}
			if(document.getElementById("txtSyqy_zdy").value!=""){
				Sql += " and dsmpd013 like N'%"+ document.getElementById("txtSyqy_zdy").value  + "%'";
			}
			if(document.getElementById("txtSyfc_zdy").value!=""){
				Sql += " and dsmpd012 like N'%"+ document.getElementById("txtSyfc_zdy").value + "%'";
			}


			DWREngine.setAsync(false);//�P�]Ajaxͬ��
			ajax_DatabaseAccessor.executeQuery(databaseCfgId_GP, Sql, null, null,LoadQueryInfo);
			DWREngine.setAsync(true);//�_��Ajaxͬ��
			ShowAcceptObjData(TbPageNum);
			dbChan2();
			clearData();
			
	}
function clearData(){
	document.getElementById("txtSyqy_zdy").value="";
	document.getElementById("txtSyqy_zdy").style.display="none";
	document.getElementById("txtSyfc_zdy").value="";
	document.getElementById("txtSyfc_zdy").style.display="none";
	tTxtZzzsmc.value="";
	tTxtCsppID.value = "";
	tTxtCsppName.value = "";
	tTxtITSxyqyfrtID.value = "";
	tZzsyFc.value = "";
	startTime.value = "";
	finishTime.value = "";
	tHdnSyqy.value = "";
	tTxtZzfjyssj.value="";
	document.getElementById("ddlSyqy").options[0].selected=true;
	document.getElementById("id1").checked=false;
	document.getElementById("id2").checked=false;
	document.getElementById("id3").checked=false;
	document.getElementById("id4").checked=false;
	document.getElementById("saveType").options[0].selected=true;
	document.getElementById('fcZdy').checked=false;
}
//�ı�ҳ�� ����ÿҳ
	function changePageNo(funcType) {
		var pageNo = document.getElementById("txtSelect").value;//ҳ���
		if (funcType == "moveFirst") {
			if (TbPageNum != 1) {
				TbPageNum = 1;
				ShowAcceptObjData(TbPageNum);
			}
		} else if (funcType == "movePrevious") {
			if (TbPageNum != 1) {
				TbPageNum--;
				ShowAcceptObjData(TbPageNum);
			}
		} else if (funcType == "moveNext") {
			var pageCount = 1;
			while (infoObjData.length > pageCount * pageNo)
				pageCount++;
			if (TbPageNum != pageCount) {
				TbPageNum++;
				ShowAcceptObjData(TbPageNum);
			}
		} else //moveLast
		{
			var pageCount = 1;
			while (infoObjData.length > pageCount * pageNo)
				pageCount++;
			if (TbPageNum != pageCount) {
				TbPageNum = pageCount;
				ShowAcceptObjData(TbPageNum);
			}
		}
	}


	//�����ѯ����ʾҳ�����ݣ�
	function ShowAcceptObjData(pageNum) {
		var tempArr=[];
		var colTitle = infoTbColValue.split(","); //��ǩ��ͷ��Ϣ��ʾ,�����colTitle������;
		var page = document.getElementById("txtSelect"); //���ѡ��ҳ���id 
		var pageNo = page.value; //��ȡҳ���ֵ;
		var tableDataCount = pageNo;
		var colNum = colTitle.length; //������ǩ����	
		tempArr = infoObjData; //��¼��ǰ��������
		var rowNum = tempArr.length; //��ǩ����
		var pageCount = 1; //��ҳ��
		while (rowNum > pageCount * pageNo)
			pageCount++;
		if (rowNum > pageNum * pageNo)
			rowNum = pageNum * pageNo;
		if (pageCount == pageNum)
			tableDataCount = rowNum - (pageNum - 1) * pageNo;
			ClearSelectRedFileData(); //��ն�̬���������Ϣ
		
		//��̬�����������
		newRow = document.getElementById("grdCSZZ").insertRow();
		newRow.align = 'center';
		newRow.style.backgroundColor = "#cccccc";

		for ( var i = 0; i < colNum; i++) {
			oCell = newRow.insertCell(i);
				oCell.align = "center";
				oCell.style.fontSize = "12px";
					oCell.innerHTML = "<label id='message' align='center'>&nbsp;&nbsp;"
						+ colTitle[i] + "</label>";
			
		}
		//��̬���������ǩ��Ϣ
		if (tempArr.length != 0) {
			for ( var i = (pageNum - 1) * pageNo; i < rowNum; i++) {
				if ((i + 1) % pageNo != 0) {
					newRow = document.all("grdCSZZ").insertRow((i + 1) % pageNo);
				} else {
					newRow = document.all("grdCSZZ").insertRow(pageNo);
				}
				newRow.style.height = '30px';
				//newRow.align='center'; 
				for ( var j = 0; j < colNum; j++) {
					oCell = newRow.insertCell(j);
						oCell.style.width = '90px';
						oCell.style.align = 'center';
						//˫�����л����޸Ľ��沢������������޸�
						oCell.ondblclick=function(){
							tronmousedown2(this);
						}
						oCell.innerHTML = "<label id='message' align='center'>&nbsp;&nbsp;"
								+ tempArr[i][j] + "</label>";
					
				}
			}
			
		}
		hiddenInfo();
	}	

	function hiddenInfo(){
	var obj  =  document.getElementById("grdCSZZ");
        for(i=0;i<obj.rows.length;i++)
        {
			obj.rows[i].cells[8].style.display  =  "none";
			
        }
}
	//�����ǩ���������Ϣ
	function ClearSelectRedFileData(){
		var opanel = document.getElementById("grdCSZZ"); 
		var pchildren = opanel.childNodes;     //��ձ��е��к��� 
		for(var a=0; a<pchildren.length; a++){  
			opanel.removeChild(pchildren[a]); 
		}
	}	


	//�����б�ɫ
	function dbChan2() {
		for ( var i = 0; i < trs.length; i++) {
			trs[i].onmousedown = function() {
				tronmousedown(this);
			};
		}
	}

	function tronmousedown(obj) {
		for ( var o = 0; o < trs.length; o++) {
			if (trs[o] == obj) {
				trs[o].style.backgroundColor = '#DFEBF2';
				//dbChan2();
			} else {
				trs[o].style.backgroundColor = '';
			}
		}

	}
	//˫�������ת���޸�ҳ��;
	function tronmousedown2(obj) {
		for ( var o = 0; o < trs.length; o++) {
			for ( var j = 0; j < trs[o].cells.length; j++) {
				if (trs[o].cells[j] == obj) {
					var selectType = document.getElementById("saveType").options[document.getElementById("saveType").selectedIndex].value;
					var OID = trs[o].getElementsByTagName('td')[8].innerText;
					//rsys=selectType.substring(2);
					var app=OID.substring(2);
					//window.location.href("YF_Edit.jsp");
//					window.location.href("CS_ZzglzyUpdate.jsp?selectType="+selectType+"&OID="+app+"");
//					alert('selectType:' + selectType + '\nOID:' + app);
					/*if(selectType == 11) {
						alert('��ѡ��洢״̬!');
						return;
					}*/
					window.location.href = "CS_ZzglzyUpdate.jsp?selectType="+selectType+"&OID="+app;
				}
			}
		}

	}
	
	//��ѯ
	function btnSearch_onclick(){
		QueryInfo();

		
	}
	

	//�ص������������ݿ��ֵ
	function LoadQueryInfo(data){
		 infoObjData = data.recordValues;	
	}	
	
	//���ڿؼ�  ʱ��ؼ�
function HS_DateAdd(interval,number,date){
	number = parseInt(number);
	if (typeof(date)=="string"){var date = new Date(date.split("-")[0],date.split("-")[1],date.split("-")[2])}
	if (typeof(date)=="object"){var date = date}
	switch(interval){
		case "y":return new Date(date.getFullYear()+number,date.getMonth(),date.getDate()); break;
		case "m":return new Date(date.getFullYear(),date.getMonth()+number,checkDate(date.getFullYear(),date.getMonth()+number,date.getDate())); break;
		case "d":return new Date(date.getFullYear(),date.getMonth(),date.getDate()+number); break;
		case "w":return new Date(date.getFullYear(),date.getMonth(),7*number+date.getDate()); break;
	}
}
 //ʱ��ؼ�
    function HS_DateAdd(interval,number,date){
        number = parseInt(number);
        if (typeof(date)=="string"){var date = new Date(date.split("-")[0],date.split("-")[1],date.split("-")[2])}
        if (typeof(date)=="object"){var date = date}
        switch(interval){
            case "y":return new Date(date.getFullYear()+number,date.getMonth(),date.getDate()); break;
            case "m":return new Date(date.getFullYear(),date.getMonth()+number,checkDate(date.getFullYear(),date.getMonth()+number,date.getDate())); break;
            case "d":return new Date(date.getFullYear(),date.getMonth(),date.getDate()+number); break;
            case "w":return new Date(date.getFullYear(),date.getMonth(),7*number+date.getDate()); break;
        }
    }
    function checkDate(year,month,date){
        var enddate = ["31","28","31","30","31","30","31","31","30","31","30","31"];
        var returnDate = "";
        if (year%4==0){enddate[1]="29"}
        if (date>enddate[month]){returnDate = enddate[month]}else{returnDate = date}
        return returnDate;
    }

    function WeekDay(date){
        var theDate;
        if (typeof(date)=="string"){theDate = new Date(date.split("-")[0],date.split("-")[1],date.split("-")[2]);}
        if (typeof(date)=="object"){theDate = date}
        return theDate.getDay();
    }
    function HS_calender(){
        var lis = "";
        var style = "";
        style +="<style type='text/css'>";
        style +=".calender { width:170px; height:auto; font-size:12px; margin-right:14px; background:url(calenderbg.gif) no-repeat right center #fff; border:1px solid #397EAE; padding:1px}";
        style +=".calender ul {list-style-type:none; margin:0; padding:0;}";
        style +=".calender .day { background-color:#EDF5FF; height:20px;}";
        style +=".calender .day li,.calender .date li{ float:left; width:14%; height:20px; line-height:20px; text-align:center}";
        style +=".calender li a { text-decoration:none; font-family:Tahoma; font-size:11px; color:#333}";
        style +=".calender li a:hover { color:#f30; text-decoration:underline}";
        style +=".calender li a.hasArticle {font-weight:bold; color:#f60 !important}";
        style +=".lastMonthDate, .nextMonthDate {color:#bbb;font-size:11px}";
        style +=".selectThisYear a, .selectThisMonth a{text-decoration:none; margin:0 2px; color:#000; font-weight:bold}";
        style +=".calender .LastMonth, .calender .NextMonth{ text-decoration:none; color:#000; font-size:18px; font-weight:bold; line-height:16px;}";
        style +=".calender .LastMonth { float:left;}";
        style +=".calender .NextMonth { float:right;}";
        style +=".calenderBody {clear:both}";
        style +=".calenderTitle {text-align:center;height:20px; line-height:20px; clear:both}";
        style +=".today { background-color:#ffffaa;border:1px solid #f60; padding:2px}";
        style +=".today a { color:#f30; }";
        style +=".calenderBottom {clear:both; border-top:1px solid #ddd; padding: 3px 0; text-align:left}";
        style +=".calenderBottom a {text-decoration:none; margin:2px !important; font-weight:bold; color:#000}";
        style +=".calenderBottom a.closeCalender{float:right}";
        style +=".closeCalenderBox {float:right; border:1px solid #000; background:#fff; font-size:9px; width:11px; height:11px; line-height:11px; text-align:center;overflow:hidden; font-weight:normal !important}";
        style +="</style>";

        var now;
        if (typeof(arguments[0])=="string"){
            selectDate = arguments[0].split("-");
            var year = selectDate[0];
            var month = parseInt(selectDate[1])-1+"";
            var date = selectDate[2];
            now = new Date(year,month,date);
        }else if (typeof(arguments[0])=="object"){
            now = arguments[0];
        }
        var lastMonthEndDate = HS_DateAdd("d","-1",now.getFullYear()+"-"+now.getMonth()+"-01").getDate();
        var lastMonthDate = WeekDay(now.getFullYear()+"-"+now.getMonth()+"-01");
        var thisMonthLastDate = HS_DateAdd("d","-1",now.getFullYear()+"-"+(parseInt(now.getMonth())+1).toString()+"-01");
        var thisMonthEndDate = thisMonthLastDate.getDate();
        var thisMonthEndDay = thisMonthLastDate.getDay();
        var todayObj = new Date();
        today = todayObj.getFullYear()+"-"+todayObj.getMonth()+"-"+todayObj.getDate();

        for (i=0; i<lastMonthDate; i++){  // Last Month's Date
            lis = "<li class='lastMonthDate'>"+lastMonthEndDate+"</li>" + lis;
            lastMonthEndDate--;
        }
        for (i=1; i<=thisMonthEndDate; i++){ // Current Month's Date

            if(today == now.getFullYear()+"-"+now.getMonth()+"-"+i){
                var todayString = now.getFullYear()+"-"+(parseInt(now.getMonth())+1).toString()+"-"+i;
                lis += "<li><a href=javascript:void(0) class='today' onclick='_selectThisDay(this)' title='"+now.getFullYear()+"-"+(parseInt(now.getMonth())+1)+"-"+i+"'>"+i+"</a></li>";
            }else{
                lis += "<li><a href=javascript:void(0) onclick='_selectThisDay(this)' title='"+now.getFullYear()+"-"+(parseInt(now.getMonth())+1)+"-"+i+"'>"+i+"</a></li>";
            }

        }
        var j=1;
        for (i=thisMonthEndDay; i<6; i++){  // Next Month's Date
            lis += "<li class='nextMonthDate'>"+j+"</li>";
            j++;
        }
        lis += style;

        var CalenderTitle = "<a href='javascript:void(0)' class='NextMonth' onclick=HS_calender(HS_DateAdd('m',1,'"+now.getFullYear()+"-"+now.getMonth()+"-"+now.getDate()+"'),this) title='Next_Month'>&raquo;</a>";
        CalenderTitle += "<a href='javascript:void(0)' class='LastMonth' onclick=HS_calender(HS_DateAdd('m',-1,'"+now.getFullYear()+"-"+now.getMonth()+"-"+now.getDate()+"'),this) title='Previous_Month'>&laquo;</a>";
        CalenderTitle += "<span class='selectThisYear'><a href='javascript:void(0)' onclick='CalenderselectYear(this)' title='Click here to select other year' >"+now.getFullYear()+"</a></span>��<span class='selectThisMonth'><a href='javascript:void(0)' onclick='CalenderselectMonth(this)' title='Click here to select other month'>"+(parseInt(now.getMonth())+1).toString()+"</a></span>��";

        if (arguments.length>1){
            arguments[1].parentNode.parentNode.getElementsByTagName("ul")[1].innerHTML = lis;
            arguments[1].parentNode.innerHTML = CalenderTitle;

        }else{
            var CalenderBox = style+"<div class='calender'><div class='calenderTitle'>"+CalenderTitle+"</div><div class='calenderBody'><ul class='day'><li>��</li><li>һ</li><li>��</li><li>��</li><li>��</li><li>��</li><li>��</li></ul><ul class='date' id='thisMonthDate'>"+lis+"</ul></div><div class='calenderBottom'><a href='javascript:void(0)' class='closeCalender' onclick='closeCalender(this)'>��</a><span><span><a href=javascript:void(0) onclick='_selectThisDay(this)' title='"+todayString+"'>Today</a></span></span></div></div>";
            return CalenderBox;
        }
    }
    function _selectThisDay(d){
        var boxObj = d.parentNode.parentNode.parentNode.parentNode.parentNode;
        boxObj.targetObj.value = d.title;
        boxObj.parentNode.removeChild(boxObj);
    }
    function closeCalender(d){
        var boxObj = d.parentNode.parentNode.parentNode;
        boxObj.parentNode.removeChild(boxObj);
    }

    function CalenderselectYear(obj){
        var opt = "";
        var thisYear = obj.innerHTML;
        for (i=1970; i<=2020; i++){
            if (i==thisYear){
                opt += "<option value="+i+" selected>"+i+"</option>";
            }else{
                opt += "<option value="+i+">"+i+"</option>";
            }
        }
        opt = "<select onblur='selectThisYear(this)' onchange='selectThisYear(this)' style='font-size:11px'>"+opt+"</select>";
        obj.parentNode.innerHTML = opt;
    }

    function selectThisYear(obj){
        HS_calender(obj.value+"-"+obj.parentNode.parentNode.getElementsByTagName("span")[1].getElementsByTagName("a")[0].innerHTML+"-1",obj.parentNode);
    }

    function CalenderselectMonth(obj){
        var opt = "";
        var thisMonth = obj.innerHTML;
        for (i=1; i<=12; i++){
            if (i==thisMonth){
                opt += "<option value="+i+" selected>"+i+"</option>";
            }else{
                opt += "<option value="+i+">"+i+"</option>";
            }
        }
        opt = "<select onblur='selectThisMonth(this)' onchange='selectThisMonth(this)' style='font-size:11px'>"+opt+"</select>";
        obj.parentNode.innerHTML = opt;
    }
    function selectThisMonth(obj){
        HS_calender(obj.parentNode.parentNode.getElementsByTagName("span")[0].getElementsByTagName("a")[0].innerHTML+"-"+obj.value+"-1",obj.parentNode);
    }
    function HS_setDate(inputObj){
        var calenderObj = document.createElement("span");
        calenderObj.innerHTML = HS_calender(new Date());
        calenderObj.style.position = "absolute";
        calenderObj.targetObj = inputObj;
        inputObj.parentNode.insertBefore(calenderObj,inputObj.nextSibling);
    }

	function toAddPage() {
		window.location.href = 'CS_ZzglzyAdd.jsp';
	}

	function btnExport_onclick() {
		document.getElementById('exportExcelForm').submit();
	}
  //ITSЭ��ǩԼ�����忪��
    function btnITSxyqyfrt_onclick() {
        var FileName = "SingleOpenWin";
        var tSql = "select dsmpd004,dsmpd004C from dsmpd";
        var SQLClaused = new Array(tSql);
        var SQLLabel = new Array("ITSЭ��ǩԼ������ID", "ITSЭ��ǩԼ����������");//���u�_����Grid Label
        var QBEField = new Array("dsmpd004", "dsmpd004C");//ģ����ԃ,횺�DB Table��λ���Q��ͬ
        var QBELabel = new Array("ITSЭ��ǩԼ������ID", "ITSЭ��ǩԼ����������");//ģ����ԃ��Label
        var ReturnId = new Array("txtITSxyqyfrtID", "txtITSxyqyfrtName");//�����ϵę�λ
        singleOpenWin(FileName, databaseCfgId_GP, SQLClaused, SQLLabel, QBEField, QBELabel, ReturnId, 700, 430);
    }

</script>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



<style type="text/css">
	#boardListOutside{width: 800px; height: 700px; border: solid black 1px; margin: auto;}
	#boardListMenuInside{width: 780px; height: 100px; background-color: #F2F2F2; margin: 10px; border: solid black 1px; }
	ul{list-style: none; width: 780px; height: 100px;  margin: 0px; padding: inherit;}
	.boardListMenuInsideLi{width: 390px; height: 50px;  float: left;}
	.boardListMenuInsideName{width: 390px; height: 50px; text-align: center; margin: 0px;  float:left;  }
	#boardListMenuInsideNameul{width: 390px; height: 50px; text-align: center; margin: 0px;  float:left;  }
	.boardListMenuInsideNameli1{width: 100px; height: 50px; float: left; text-align: center;}
	.boardListMenuInsideNameli2{width: 290px; height: 50px; float: left; text-align: center;}
	.boardListMenuInsideNamediv1{margin: 13px;}
	.divlift{text-align: left;}
	.title{cursor: pointer;}
	a{text-decoration:none;}
	colgroup {
		
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#y").click( function(){
		
		$("#n").prop("checked",false)
	});
	$("#n").click ( function(){
		$("#y").prop("checked",false)
	});
		
});
	
	
var boardInsert = function boardInsert(){
		$.ajax({
			type:"post",
			url:"boardinsert",
			success:function(data){
				$("#boardListOutside").html(data);
			},
			error:function(e){
				alert(e);
			}
		});
	};	
var boardview =	function boardview(boardId){
				
				$.ajax({
					type:"POST",
					url:"boardview",
					data:{"board_id":boardId},
					success:function(data){
						$("#boardListOutside").html(data);
						
				 		$("input[name = title]").attr("readonly",true).attr("disabled",false);
						$("input[name = reg_user]").attr("readonly",true).attr("disabled",false);
						$("input[name = email]").attr("readonly",true).attr("disabled",false);
						$("input[name = phone1]").attr("readonly",true).attr("disabled",false);
						$("input[name = phone2]").attr("readonly",true).attr("disabled",false);
						$("input[name = phone3]").attr("readonly",true).attr("disabled",false);
						$("#phone1").attr("readonly",true).attr("disabled",false);
						$("textarea[name = content]").attr("readonly",true).attr("disabled",false);
 
					},
					error:function(e){
						alert(e);
					}
				});
			};
	
	
	

var boarddelete = function boarddelete(){
		
			 
		if(confirm("삭제하시겠습니까?")){
			
				$.ajax({
					type:"POST",
					url:"boarddelete",
					data:{"board_id":$("input[name=board_id]").val()},
					success:function(data){
						
						if(data == '1'){
							alert("삭제되었습니다.");
						}
						location.href="first";
					}
				});
		};
		
	};
	 
var movetoboardlist =	function movetoboardlist(target){
		if(target===1){
			$.ajax({
				type:"GET",
				url:'first',
				success:function(data){
					$("#boardListOutside").html(data);
				},
				error:function(e){
					alert(e);
				}
			});
			
			
		};

		if(target===2){
			if(confirm("목록으로 이동하시겠습니까?\n ( 수정하지않는 내용은 저장되지 않습니다.)")){
				$.ajax({
					type:"GET",
					url:'first',
					success:function(data){
						$("#boardListOutside").html(data);
					},
					error:function(e){
						alert(e);
					}
				});
			};
		};
		
	};
	
	
var boardInsertPage = function boardInsertPage(){
		$.ajax({
			type:"post",
			url:"boardInsertPage",
			success:function(data){
				$("#boardListOutside").html(data);
			}
			
		});
		
	};
	
	
var boardinsert = function boardinsert(){
		
		
		if($("input[name = title]").val()== ''){
			alert("제목을 입력하세요.");			
			$('input[name = title]').focus();
			return false;

		};
		
		
		if($("input[name = reg_user]").val()==''){
			alert("작성자을 입력하세요.");			
			$('input[name = reg_user]').focus();	
			return false;
		};
		
		
		var emailtest = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var email = $("input[name = email]").val();
		
		if (email == '' || !emailtest.test(email)) {
			alert("올바른 이메일 주소를 입력하세요");
			$('input[name = email]').focus();
			return false;
		};
		
		
		var phonetest = /^\d{3}\d{3,4}\d{4}$/;
		var phone = $("#phone1 option:selected").val()+$("input[name = phone2]").val()+$("input[name = phone3]").val();
		
		if(phone == '' || !phonetest.test(phone)){
			alert("올바른 핸드폰 번호를 입력하세요");			
			$("input[name = phone2]").focus();
			return false;
		};
		
		if($("textarea[name = content]").val()== ''){
			alert("내용을 입력하세요.");			
			$('input[name = content]').focus();
			return false;
		};
		
		if(confirm("등록 하시겠습니까?")){
						$.ajax({
							type:"POST",
							url:"boardinsert",
							data:{
								 "title": $("input[name = title]").val() ,
								 "content":  $("textarea[name = content]").val(),
								 "reg_user": $("input[name = reg_user]").val(),
								 "email":  email,
								 "phone":  phone,
							},
							success:function(data){
								if(data == 1){
									alert("등록 되었습니다");
								}
								location.href="first";
							},
							error:function(e){
								alert(e);
							}
						});
		};
	};
	
	
var boardupdatepage = function boardupdatepage(){
		$.ajax({
			type:"POST",
			url:"boardupdatepage",
			data:{"board_id":$("input[name=board_id]").val()},
			success:function(data){
				$("#boardListOutside").html(data);
			},
			error:function(e){
				alert(e);
			}
		});
		
	};
	
var boardupdate = function boardupdate(){
		

		if($("input[name = title]").val()== ''){
			alert("제목을 입력하세요.");			
			$('input[name = title]').focus();
			return false;

		};
		
		
		if($("input[name = reg_user]").val()==''){
			alert("작성자을 입력하세요.");			
			$('input[name = reg_user]').focus();	
			return false;
		};
		
		
		var emailtest = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var email = $("input[name = email]").val();
		
		if (email == '' || !emailtest.test(email)) {
			alert("올바른 이메일 주소를 입력하세요");
			$('input[name = email]').focus();
			return false;
		};
		
		
		var phonetest = /^\d{3}\d{3,4}\d{4}$/;
		var phone = $("#phone1 option:selected").val()+$("input[name = phone2]").val()+$("input[name = phone3]").val();
		
		if(phone == '' || !phonetest.test(phone)){
			alert("올바른 핸드폰 번호를 입력하세요");			
			$("input[name = phone2]").focus();
			return false;
		};
		
		if($("textarea[name = content]").val()== ''){
			alert("내용을 입력하세요.");			
			$('input[name = content]').focus();
			return false;
		};
		
		if(confirm("수정 하시겠습니까?")){
						$.ajax({
							type:"POST",
							url:"boardupdate",
							data:{
								"board_id":$("input[name=board_id]").val(), 
								"title": $("input[name = title]").val(),
								 "content":  $("textarea[name = content]").val(),
								 "reg_user": $("input[name = reg_user]").val(),
								 "email":  email,
								 "phone":  phone,
							},
							success:function(data){
								if(data == 1){
									alert("수정 되었습니다");
								};
								location.href="first";
							},
							error:function(e){
								alert(e);
							}
						});
		};
		
	};
	
var search = function search(){
	
	
		
		$.ajax({
			type:"get",
			url:"boardlistajax",
			
			data:{
				"dateFirst":$("#date1").val(),
				"dateEnd":$("#date2").val(),
				"reg_user":$("input[name=reg_user]").val(),
				"title":$("input[name=title]").val(),
				"y":$("input[name=y]:checked").val(),
				"n":$("input[name=n]:checked").val()
				},
			success:function(data){
				alert(data.bvo[0].rn);
				for(var i = 0;i < data.bvo.length ;i++){
					var str = "";
					str += "<td>"+data.bvo[i].rn+"</td>";
					str += "<td>"+data.bvo[i].title+"</td>";
					str += "<td>"+data.bvo[i].reg_user+"</td>";
					str += "<td>"+data.bvo[i].reg_datetime+"</td>";
					
					$("#tr"+i).html(str);
				};
				to = data.page;
				
			},
			error:function(e){
				alert(e);
			}
		});
	};
	

	
var to =[];

var pagedo = function(){
	
	<ul style="text-align: center; width: 100px; height: 28px; margin: auto; ">
		<c:if test="${pageMaker.prev}">
			<li style="float: left;"><a
				href="first${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
		</c:if>
	
		<c:forEach begin="${pageMaker.startPage }"
			end="${pageMaker.endPage }" var="idx">
			<li style="float: left;"
				<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
				<a href="first${pageMaker.makeSearch(idx)}">${idx} &nbsp</a>
			</li>
		</c:forEach>
	
		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<li style="float: left;">
				<a href="first${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a>
			</li>
		</c:if>
	</ul>
	
	
}
			
	
	
	
	
	$(function(){ $("#date1").datepicker({
	    dateFormat: 'yymmdd' 
		});
	});
	$(function(){ $("#date2").datepicker({
	    dateFormat: 'yymmdd' 
		});
	});


</script>
		
	





<title>BOARDLIST</title>
</head>
<body>
	<div id="boardListOutside">
		<div id="boardListMenuInside">
			<ul>
				<li class="boardListMenuInsideLi">
					<div class="boardListMenuInsideName">
						<ul id="boardListMenuInsideNameul">
							<li class="boardListMenuInsideNameli1">
								<div class="boardListMenuInsideNamediv1">등록일</div>							
							</li>
							<li class="boardListMenuInsideNameli2">
								<div class="boardListMenuInsideNamediv1">
									<input type="text" size="13" id="date1"> ~ <input type="text" size="13" id = "date2">
								</div>
							</li>
						</ul>
					</div>
				</li>
				<li class="boardListMenuInsideLi">
					<div class="boardListMenuInsideName">
						<ul id="boardListMenuInsideNameul">
							<li class="boardListMenuInsideNameli1">
								<div class="boardListMenuInsideNamediv1">등록자</div>		
							</li>
							<li class="boardListMenuInsideNameli2">
								<div class="boardListMenuInsideNamediv1 divlift">
									<input type="text" size="13" name="reg_user">
								</div>
							</li>
						</ul>
					</div>
				</li>
				<li class="boardListMenuInsideLi">
					<div class="boardListMenuInsideName">
						<ul id="boardListMenuInsideNameul">
							<li class="boardListMenuInsideNameli1">
								<div class="boardListMenuInsideNamediv1">제목</div>
							</li>
							<li class="boardListMenuInsideNameli2">
								<div class="boardListMenuInsideNamediv1">
									<input type="text" size="35" name="title">
								</div>
							</li>
						</ul>
					</div>	
				</li>
				
				<li class="boardListMenuInsideLi">
					<div class="boardListMenuInsideName">
						<ul id="boardListMenuInsideNameul">
							<li class="boardListMenuInsideNameli1">
								<div class="boardListMenuInsideNamediv1">삭제여부</div>
							</li>
							<li class="boardListMenuInsideNameli2">
								<div class="boardListMenuInsideNamediv1">
									<div style="width: 130px; text-align: center; float: left; font-size: 20px">
										Y<input type="radio" size="20" name="y" value="y" id="y"> 
										N<input type="radio" size="20" name="n" value="n" id="n">  
									</div>
									<div style="width: 130px; text-align: right; float: left ;">    
										<input type="button" value="검색" style="width: 100px; background-color: #81BEF7" onclick="search()">
									</div>
								</div>
							</li>
						</ul>				
					</div>
				</li>
			</ul>
		
		</div>
		
		<div style="width: 774px; height: 100px; text-align: right;">
			<input type="button" value="등록" onclick="boardInsertPage()"  style="background-color: #81BEF7;width: 100px">
			
		</div>
		
		<div style="width: 780px; height: 400px; margin: 9px;" id="boardtable">
		
			
			
				<table style="width: 780px; height: 400px; table-layout: fixed; " border="1">
					
					<colgroup>
						<col width="120px">
						<col width="220px">
						<col width="220px">
						<col width="220px">
					</colgroup>
				
					<tr style="text-align: center; background-color: #81BEF7; height: 30px">
						<td>번호</td>
						<td>제목</td>
						<td>등록자</td>
						<td>등록일</td>
					</tr>
					
					
					<tr style="text-align: center; height: 30px" id ="tr0">
						<td>${boardList[0].rn}</td>
						<td class="title" onclick="boardview('${boardList[0].board_id}')">${boardList[0].title}</td>
						<td>${boardList[0].reg_user}</td>
						<td>${boardList[0].reg_datetime}</td>
					</tr>
					<tr style="text-align: center; height: 30px" id ="tr1">
						<td>${boardList[1].rn}</td>
						<td class="title" onclick="boardview('${boardList[1].board_id}')">${boardList[1].title}</td>
						<td>${boardList[1].reg_user}</td>
						<td>${boardList[1].reg_datetime}</td>
					</tr>
					<tr style="text-align: center; height: 30px" id ="tr2">
						<td>${boardList[2].rn}</td>
						<td class="title" onclick="boardview('${boardList[2].board_id}')">${boardList[2].title}</td>
						<td>${boardList[2].reg_user}</td>
						<td>${boardList[2].reg_datetime}</td>
					</tr>
					<tr style="text-align: center; height: 30px" id ="tr3">
						<td>${boardList[3].rn}</td>
						<td class="title" onclick="boardview('${boardList[3].board_id}')">${boardList[3].title}</td>
						<td>${boardList[3].reg_user}</td>
						<td>${boardList[3].reg_datetime}</td>
					</tr>
					<tr style="text-align: center; height: 30px" id ="tr4">
						<td>${boardList[4].rn}</td>
						<td class="title" onclick="boardview('${boardList[4].board_id}')">${boardList[4].title}</td>
						<td>${boardList[4].reg_user}</td>
						<td>${boardList[4].reg_datetime}</td>
					</tr>
					<tr style="text-align: center; height: 30px" id ="tr5">
						<td>${boardList[5].rn}</td>
						<td class="title" onclick="boardview('${boardList[5].board_id}')">${boardList[5].title}</td>
						<td>${boardList[5].reg_user}</td>
						<td>${boardList[5].reg_datetime}</td>
					</tr>
					<tr style="text-align: center; height: 30px" id ="tr6">
						<td>${boardList[6].rn}</td>
						<td class="title" onclick="boardview('${boardList[6].board_id}')">${boardList[6].title}</td>
						<td>${boardList[6].reg_user}</td>
						<td>${boardList[6].reg_datetime}</td>
					</tr>
					<tr style="text-align: center; height: 30px" id ="tr7">
						<td>${boardList[7].rn}</td>
						<td class="title" onclick="boardview('${boardList[7].board_id}')">${boardList[7].title}</td>
						<td>${boardList[7].reg_user}</td>
						<td>${boardList[7].reg_datetime}</td>
					</tr>
					<tr style="text-align: center; height: 30px" id ="tr8">
						<td>${boardList[8].rn}</td>
						<td class="title" onclick="boardview('${boardList[8].board_id}')">${boardList[8].title}</td>
						<td>${boardList[8].reg_user}</td>
						<td>${boardList[8].reg_datetime}</td>
					</tr>
					<tr style="text-align: center; height: 30px" id ="tr9">
						<td>${boardList[9].rn}</td>
						<td class="title" onclick="boardview('${boardList[9].board_id}')">${boardList[9].title}</td>
						<td>${boardList[9].reg_user}</td>
						<td>${boardList[9].reg_datetime}</td>
					</tr>
					
				</table>
					<div style="width: 780px;height: 10px;"></div>
					<div style="width: 780px; height: 30px; text-align: center;">
						<ul style="text-align: center; width: 100px; height: 28px; margin: auto; ">
							<c:if test="${pageMaker.prev}">
								<li style="float: left;"><a
									href="first${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li style="float: left;"
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="first${pageMaker.makeSearch(idx)}">${idx} &nbsp</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li style="float: left;">
									<a href="first${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a>
								</li>
							</c:if>
						</ul>
					</div>
			
		
		
		</div>
		
	
	</div>



</body>
</html>
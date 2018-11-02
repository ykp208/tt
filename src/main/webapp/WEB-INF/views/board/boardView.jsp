<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>

	#boardViewOutLine{width: 800px; height: 650px; border: solid black 1px; margin: auto;};
	#boardViewIn{width: 780px; height: 300px; margin: 10px;}
	table{width: 780px; height: 300px; border: solid black 1px; margin: 10px;}
	.boardviewtdfirst{width: 280px; height: 50px; background-color: #81BEF7; text-align: center; font-size: 20px;}
	.boardviewtdsecond{width: 500px; height: 50px; }
	.boardviewtextcnd{width: 495px; height: 39px; font-size: 18px;}
	.boardviewphone{width: 120px; height: 30px; font-size: 18px;}
	.boardviewbtn{background-color:  #81BEF7; width: 100px; font-size: 18px;}
</style>


<title>BOARD VIEW</title>
</head>
<body>
	<div id="boardViewOutLine">
		<div id="boardViewIn">
		<input type="hidden" value="${bvo.board_id}" name="board_id">
			<table border="1" id="boardviewtable" >
				<tr>
					<td class="boardviewtdfirst" >제목 *</td>
					<td class="boardviewtdsecond">
						<input type="text" class="boardviewtextcnd" value="${bvo.title }" name="title" required>
					</td>
				</tr>
				<tr>
					<td class="boardviewtdfirst">작성자 *</td>
					<td class="boardviewtdsecond">
						<input type="text" class="boardviewtextcnd" value="${bvo.reg_user }" name="reg_user" required>
					</td>
				</tr>
				<tr>
					<td class="boardviewtdfirst">이메일</td>
					<td class="boardviewtdsecond">
						<input type="text" class="boardviewtextcnd" value="${bvo.email }" name="email" required>
					</td>
				</tr>
				<tr>
					<td class="boardviewtdfirst">핸드폰</td>
					<c:if test="${target==1 }">
					<td class="boardviewtdsecond">
						<select class="boardviewphone" id="phone1" >
							<option value="010" >010</option>
							<option value="011" >011</option>
							<option value="017" >017</option>
							<option value="018" >018</option>
							<option value="019" >019</option>
						</select>-
						<input type="text" class="boardviewphone" name="phone2" value="${bvo.phone2}" required>-
						<input type="text" class="boardviewphone" name="phone3" value="${bvo.phone3}" required>
					</td>
					</c:if>
					<c:if test="${target==2 }">
					<td class="boardviewtdsecond">
						<input type="text" class="boardviewphone" name="phone2" value="${bvo.phone1}" required>-
						<input type="text" class="boardviewphone" name="phone2" value="${bvo.phone2}" required>-
						<input type="text" class="boardviewphone" name="phone3" value="${bvo.phone3}" required>
					</td>
					</c:if>
					<c:if test="${target==3 }">
					<td class="boardviewtdsecond">
						<select class="boardviewphone" id="phone1">
							<option value="010" >010</option>
							<option value="011" >011</option>
							<option value="017" >017</option>
							<option value="018" >018</option>
							<option value="019" >019</option>
						</select>-
						<input type="text" class="boardviewphone" name="phone2" value="${bvo.phone2}" required>-
						<input type="text" class="boardviewphone" name="phone3" value="${bvo.phone3}" required>
					</td>
					</c:if>
				</tr>
				<tr>
					<td class="boardviewtdfirst">내용</td>
					<td class="boardviewtdsecond">
						<textarea rows="10" cols="75" name="content" required>${bvo.content}</textarea>
					</td>
				</tr>
			</table>
			
		</div>
		
		<div style="text-align: right; width: 780px; height: 50px; text-align: right; margin: 10px;" >
		<c:if test="${target==1 }">
			<input type="button" value="등록" class="boardviewbtn" onclick="boardinsert()">
			<input type="button" value="목록" class="boardviewbtn" onclick="movetoboardlist(1)">
		</c:if>
		
		
		<c:if test="${target==2}">
			<input type="button" value="수정" class="boardviewbtn" onclick="boardupdatepage()">
			<input type="button" value="삭제" class="boardviewbtn" onclick="boarddelete()">
			<input type="button" value="목록" class="boardviewbtn" onclick="movetoboardlist(1)">
		</c:if>
		
		<c:if test="${target==3}">
			<input type="button" value="수정" class="boardviewbtn" onclick="boardupdate()">
			<input type="button" value="목록" class="boardviewbtn" onclick="movetoboardlist(2)">
		
		</c:if>
			
		</div>
	
	</div>

</body>
</html>
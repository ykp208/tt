<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>




</head>
<body>

			<table style="width: 780px; height: 400px; table-layout: fixed;" border="1">
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
				
					<tr style="text-align: center; height: 30px">
						<td>${boardList[0].rn}</td>
						<td class="title" onclick="boardview('${boardList[0].board_id}')">${boardList[0].title}</td>
						<td>${boardList[0].reg_user}</td>
						<td>${boardList[0].reg_datetime}</td>
					</tr>
					<tr style="text-align: center; height: 30px">
						<td>${boardList[1].rn}</td>
						<td class="title" onclick="boardview('${boardList[1].board_id}')">${boardList[1].title}</td>
						<td>${boardList[1].reg_user}</td>
						<td>${boardList[1].reg_datetime}</td>
					</tr>
					<tr style="text-align: center; height: 30px">
						<td>${boardList[2].rn}</td>
						<td class="title" onclick="boardview('${boardList[2].board_id}')">${boardList[2].title}</td>
						<td>${boardList[2].reg_user}</td>
						<td>${boardList[2].reg_datetime}</td>
					</tr>
					<tr style="text-align: center; height: 30px">
						<td>${boardList[3].rn}</td>
						<td class="title" onclick="boardview('${boardList[3].board_id}')">${boardList[3].title}</td>
						<td>${boardList[3].reg_user}</td>
						<td>${boardList[3].reg_datetime}</td>
					</tr>
					<tr style="text-align: center; height: 30px">
						<td>${boardList[4].rn}</td>
						<td class="title" onclick="boardview('${boardList[4].board_id}')">${boardList[4].title}</td>
						<td>${boardList[4].reg_user}</td>
						<td>${boardList[4].reg_datetime}</td>
					</tr>
					<tr style="text-align: center; height: 30px">
						<td>${boardList[5].rn}</td>
						<td class="title" onclick="boardview('${boardList[5].board_id}')">${boardList[5].title}</td>
						<td>${boardList[5].reg_user}</td>
						<td>${boardList[5].reg_datetime}</td>
					</tr>
					<tr style="text-align: center; height: 30px">
						<td>${boardList[6].bno}</td>
						<td class="title" onclick="boardview('${boardList[6].board_id}')">${boardList[6].title}</td>
						<td>${boardList[6].reg_user}</td>
						<td>${boardList[6].reg_datetime}</td>
					</tr>
					<tr style="text-align: center; height: 30px">
						<td>${boardList[7].rn}</td>
						<td class="title" onclick="boardview('${boardList[7].board_id}')">${boardList[7].title}</td>
						<td>${boardList[7].reg_user}</td>
						<td>${boardList[7].reg_datetime}</td>
					</tr>
					<tr style="text-align: center; height: 30px">
						<td>${boardList[8].rn}</td>
						<td class="title" onclick="boardview('${boardList[8].board_id}')">${boardList[8].title}</td>
						<td>${boardList[8].reg_user}</td>
						<td>${boardList[8].reg_datetime}</td>
					</tr>
					<tr style="text-align: center; height: 30px">
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
			
			
		

</body>
</html>
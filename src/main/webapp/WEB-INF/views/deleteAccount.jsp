<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/resources/css/deleteAccount.css">
<body>
<jsp:include page="./layout/header.jsp"></jsp:include>
	<div class="container">
		<h1>회원 탈퇴</h1>
		<div class="warning">
			<h2>탈퇴시 주의사항</h2>
			<ol>
				<li>회원탈퇴 시, 적립하신 내역이 모두 삭제됩니다
					<ul>
						<li>뱃지, 마니아, 인기글, 리뷰작가, 스마트리뷰 등</li>
						<li>적립된 현금 영수증 등도 일괄 삭제됩니다.</li>
					</ul>
				</li>
				<li>회원정보 및 회원제 서비스의 정보 삭제 및 복구불가
					<ul>
						<li>작성한 게시물 (뱃지, 마니아, 인기글, 리뷰작가 등)</li>
						<li>나의 콘텐츠</li>
						<li>적립금의 경우 즉시 일괄 삭제</li>
					</ul>
				</li>
				<li>단 아래의 공공적 성격의 게시물은 탈퇴 후에도 삭제되지 않습니다
					<ul>
						<li>삭제를 원하실 경우 반드시 탈퇴하기 전 삭제 하시기 바랍니다.</li>
						<li>게시물: 공감, 리뷰, 아카이브, 기타 게시판에 등록된 모든 게시물</li>
					</ul>
				</li>
				<li>회원 탈퇴 후 재가입은 언제든지 가능하지만, 본인 인증한 계정을 탈퇴한 경우 7일 후에 다시 본인 인증이
					가능합니다.
					<ul>
						<li>재가입 시 마니아(1000M) 선물은 지급되지 않습니다.</li>
						<li>회원탈퇴 후 동일한 아이디로 재가입은 불가합니다.</li>
						<li>탈퇴하기 전 모든 내용을 확인 후 신중히 결정해주세요.</li>
					</ul>
				</li>
			</ol>
		</div>

		<div class="confirmation">
			<label> <input type="checkbox" name="checkbox"> 위 내용을
				모두 확인하였으며, 이에 동의합니다.
			</label>
		</div>

		<div class="reason">
			<label for="reason">탈퇴사유</label> 
			<select id="reason" name="reason" onchange="toggleTextarea(this)">
					<option value="not">선택해 주세요</option>
					<option value="서비스 이용 불만족">서비스 이용 불만족</option>
					<option value="이용 빈도 저하">이용 빈도 저하</option>
					<option value="유사 서비스로의 이동">유사 서비스로의 이동</option>
					<option value="부정적인 경험">부정적인 경험</option>
					<option value="custom">직접입력</option>
			</select>
			
			<div id="customReason" style="display: none;">
			    <label for="customInput">직접 입력:</label>
			    <textarea id="customInput" rows="3" cols="30"></textarea>
			</div>
		</div>
			<button onclick="deleteButton()" class="delete-button">탈퇴</button>

		<!-- Modal -->
		<div id="modal" class="modal">
			<div class="modal-content">
				<h2>안내</h2>
				<p>탈퇴하시겠습니까?</p>
				<div class="modal-buttons">
					<button onclick="closeModal()" class="cancel-button">취소</button>
					<button onclick="confirmAction()" class="confirm-button">탈퇴</button>
				</div>
			</div>
		</div>

	</div>

<jsp:include page="./layout/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/resources/js/deleteAccount.js"></script>
</html>
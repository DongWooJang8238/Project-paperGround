<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/writeSidebar.css">
<link rel="stylesheet" href="/resources/css/writeInsert.css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>

	<div id="root">
		<div class="wrap">
			<div class="subpage-container bg-w">
				<div class="literature-edit-wrap">
					<form action="#" method="post">
						<div class="type-select">
							<div class="top-info">
								<div class="label">작품종류</div>
								<div class="input-group">
									<select name="writeType">
										<option value="유료연재">유료연재</option>
										<option value="무료연재">무료연재</option>
									</select>
								</div>
							</div>
						</div>
						<div class="type-select">
							<div class="top-info">
								<div class="label">카테고리</div>
								<div class="input-group">
									<select name="genre" data-testid="joa-CateChoice-cateChoice"><option
											value="판타지">판타지</option>
										<option value="로맨스">로맨스</option>
										<option value="로맨스판타지">로맨스판타지</option>
										<option value="무협">무협</option>
										<option value="퓨전">퓨전</option>
										<option value="현대판타지">현대판타지</option>
										<option value="게임">게임</option>
										<option value="역사">역사</option>
										<option value="스포츠">스포츠</option>
										<option value="라이트노벨">라이트노벨</option>
										<option value="BL">BL</option>
										<option value="GL">GL</option>
										<option value="패러디">패러디</option>
										<option value="팬픽">팬픽</option>
										<option value="SF">SF</option>
										<option value="밀리터리">밀리터리</option>
										<option value="시">시</option>
										<option value="소설">소설</option>
										<option value="수필">수필</option>
										<option value="공포">공포</option>
										<option value="추리">추리</option>
										<option value="아동">아동</option>
										<option value="시나리오/희곡">시나리오/희곡</option>
										<option value="비평">비평</option></select>
								</div>
							</div>
							<ul class="hint">
								<li>작품의 장르가 어떤 장르인지 선택하는 메뉴입니다.</li>
							</ul>
						</div>
						<div class="literature-edit-wrap">
							<div class="type-input pc-type">
								<div class="label">
									작품명<span class="t-caution">*</span>
								</div>
								<div class="input-group">
									<textarea rows="2" name="title" cols="30"
										placeholder="작품명은 40자 이내로 작성해주세요." style="height: 74px;"></textarea>
									<textarea aria-hidden="true" readonly="" tabindex="-1"
										style="visibility: hidden; position: absolute; overflow: hidden; height: 0px; top: 0px; left: 0px; transform: translateZ(0px); width: 833px;"></textarea>
								</div>
							</div>
							<div class="type-input pc-type">
								<div class="label">
									작품소개<span class="t-caution">*</span><span class="t-tiny">(줄거리)</span>
								</div>
								<textarea rows="9" name="description" cols="30"
									placeholder="작품 줄거리를 입력하세요." style="height: 242px;"></textarea>
								<textarea aria-hidden="true" readonly="" tabindex="-1"
									style="visibility: hidden; position: absolute; overflow: hidden; height: 0px; top: 0px; left: 0px; transform: translateZ(0px); width: 833px;"></textarea>
							</div>
						</div>
						<input type="hidden" name="coverImage">
					</form>
					<div class="type-upload pc-type">
						<div class="label">
							표지이미지<span class="t-caution">*</span> <span class="t-tiny">(200
								X 305px)</span>
						</div>
						<div class="preview-col">
							<div class="cover">
								<p>
									이미지를<br>등록해주세요
								</p>
							</div>
							<ul class="info">
								<li>* 초상권 침해/저작권 침해/명예훼손 여지가 있는 이미지의 사용은 삼가하여 주시기 바랍니다.</li>
								<li>* 외부 이미지 사용 시 출처를 반드시 작품소개 (줄거리) 란에 기재해주시길 바랍니다.</li>
								<li><strong>* 이용 약관에 따라 이미지 사용에 대한 법적 책임은 작품 게시자
										본인에게 있습니다.</strong></li>
								<li>* 규정 위반 신고가 접수될 경우 운영자 검토 후 기본 표지 처리될 수 있습니다.</li>
								<li class="action-col"><input type="file"
									accept="image/gif,image/jpg,image/jpeg,image/png"
									name="coverFile" style="display: none;">
									<button id="upload" class="upload" data-testid="joa-CoverImage-onClickFile">
										<img src="/assets/ic/pc-ui/ic_bt_img.png" alt="이미지를 등록해주세요">이미지
										선택
									</button></li>
							</ul>
						</div>
					</div>
					<div class="pc-page-link">
						<a data-testid="joa-BookWriteBottomLink-next"
							href="/book/series/new#step2"><button class="next "
								data-testid="joa-BookWriteBottomLink-next"
								style="cursor: pointer;">다음 &#10095;</button></a>
					</div>
					<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/bundle.min.css" />

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/bundle.min.css" />

<!-- 모달 배경 -->
<div class="modal-overlay">
    <div class="writeEpisodeContentModal">
        <div class="modal-header">
            <h1>이미지 선택</h1>
        </div>
        <div class="modal-body">
        	<div>
        		<div>
        			<!-- 선택된 이미지 보여주는 영역 -->
        			<img id="checkImg" alt="이미지 선택" src="https://cf.joara.com/version_3_0/gnb_section_content/20241108_104851.png">
        		</div>
        	</div>
            <!-- 하단 슬라이드 영역 -->
            <div class="main-slider">
                <div class="wrapper">
                    <div class="slide" data-no="1">
                        <img alt="이미지 선택" src="https://cf.joara.com/version_3_0/gnb_section_content/20241108_104851.png">
                    </div>
                    <div class="slide" data-no="2">
                        <img alt="이미지 선택" src="https://cf.joara.com/banner_file/20241114_093035.jpg">
                    </div>
                    <div class="slide" data-no="3">
                        <img alt="이미지 선택" src="https://cf.joara.com/version_3_0/gnb_section_content/20241108_104930.jpg">
                    </div>
                    <div class="slide" data-no="4">
                        <img alt="이미지 선택" src="https://cf.joara.com/version_3_0/gnb_section_content/20241108_103126.jpg">
                    </div>
                    <div class="slide" data-no="5">
                        <img alt="이미지 선택" src="https://cf.joara.com/literature_file/962670_1729775431_thumb.jpg">
                    </div>
                    <div class="slide" data-no="6">
                        <img alt="이미지 선택" src="https://cf.joara.com/version_3_0/gnb_section_content/20241114_120843.jpg">
                    </div>
                    <div class="slide" data-no="7">
                        <img alt="이미지 선택" src="https://cf.joara.com/version_3_0/gnb_section_content/20241029_144605.jpg">
                    </div>
                    <div class="slide" data-no="8">
                        <img alt="이미지 선택" src="https://cf.joara.com/version_3_0/gnb_section_content/20241029_144535.jpg">
                    </div>
                    <div class="slide" data-no="9">
                        <img alt="이미지 선택" src="https://cf.joara.com/version_3_0/gnb_section_content/20241101_161904.jpg">
                    </div>
                    <div class="slide" data-no="10">
                        <img alt="이미지 선택" src="https://cf.joara.com/version_3_0/gnb_section_content/20240906_101310.jpg">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/resources/js/write/writeInsert.js"></script>
<script type="text/javascript" src="/resources/js/write/writeSidebar.js"></script>
</html>
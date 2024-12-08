console.log('중고리스트페이지');

// =================================================  검색 관련   ================================================================================
let gener = new URLSearchParams(location.search).get('gener');
let filterType = new URLSearchParams(location.search).get('filterType');
const selectVl = document.querySelector('input[name="selectBook"]');
const filter = document.querySelector('input[name="filter"]');
let checkCategorys = [];

//필터 타입 선언
document.querySelectorAll('.filterType-body button').forEach(btn => {
	console.log('필터타입 : ' + filter.value);
	if(filter.value === ''){
		btn.addEventListener('click', e => {
			filterType = btn.id;
			if(checkCategorys.length > 0 && selectVl.value != ''){
				console.log(filterType);
				console.log('풀생성자');
	        	location.href = `/used/list?gener=${checkCategorys}&filterType=${filterType}&selectValue=${selectVl.value}`;
	        }else if(checkCategorys.length > 0 && selectVl.value == ''){
	        	console.log(filterType);
	        	console.log('카테고리만');
	        	location.href = `/used/list?gener=${checkCategorys}&filterType=${filterType}`;
	        }else if(selectVl.value != ''){
	        	console.log(filterType);
	        	console.log(selectVl.value);
	        	console.log('검색만');
	        	location.href = `/used/list?selectValue=${selectVl.value}`
	        }else {
	        	console.log(filterType);
	        	console.log('기본생성자');
	        	location.href = `/used/list?filterType=${filterType}`;
	        }
		});
	}else {
		filterType = filter.value;
	}
});

//DOMContentLoaded 이벤트가 발생하면 label에서 값 가져오기
document.addEventListener("DOMContentLoaded", function() {
    // label에 저장된 selectedGener 값 가져오기
    const label = document.querySelector('#tt'); // ID에 맞는 label 요소
    let selectedGener = label.getAttribute('data-check-check');
    console.log("라벨 : " + label + ",장르 : " + selectedGener);

    // selectedGener가 값이 있으면 배열로 변환
    if (selectedGener) {
        checkCategorys = selectedGener.split(',')
            .map(value => Number(value.trim())) // 숫자로 변환하면서 공백 제거
            .filter(value => !isNaN(value)); // NaN 제거
    }
    
    console.log("배열로 변환 된 카테고리 : " + checkCategorys);
    // 체크박스 상태 유지
    document.querySelectorAll('input[name="gno"]').forEach(checkbox => {
        if (checkCategorys.includes(Number(checkbox.value))) { // value를 숫자로 비교
            checkbox.checked = true; // 선택된 카테고리는 체크박스 체크
            const span = checkbox.previousElementSibling; // 가장 가까운 span
            span.style.backgroundColor = '#cccccc'; // 색상 변경
        }
    });
});

//초기화 버튼 누를 시 검색내용,선택된 카테고리 초기화
let resetBtn = document.querySelector('#resetBtn');

resetBtn.addEventListener('click', e => {
	checkCategorys = [];
	location.href = `/used/list`;
});

// 카테고리 선택 시 발동 이벤트
document.querySelectorAll('input[name="gno"]').forEach(checkbox => {
    checkbox.addEventListener('change', e => {
        console.log("타겟 벨류 : " + e.target.value);
        console.log(e.target.checked);
        
        const valueAsNumber = Number(e.target.value); // value를 숫자로 변환
        console.log("숫자로 변환 한 벨류 : " + valueAsNumber);
        const span = e.target.previousElementSibling; // 가장 가까운 span
        console.log(span);
        
        if (e.target.checked) {
        	console.log("배열에 추가 전 : " + checkCategorys);
            // 체크된 경우 배열에 추가
            checkCategorys.push(valueAsNumber);
            console.log("배열에 추가 후 : " + checkCategorys);
            console.log("색상 변경 전: ", span.style.backgroundColor);
            span.style.backgroundColor = '#cccccc';
            console.log("색상 변경 후: ", span.style.backgroundColor);
        } else {
            // 체크 해제된 경우 배열에서 제거
            checkCategorys = checkCategorys.filter(value => value !== valueAsNumber);
            span.style.backgroundColor = '';
        }

        console.log(checkCategorys);
        if(checkCategorys.length > 0 && selectVl.value != null && selectVl.value != ''){
        	location.href = `/used/list?gener=${checkCategorys}&filterType=${filterType}&selectValue=${selectVl.value}`;
        }else if(checkCategorys.length > 0 && selectVl.value == null){
        	location.href = `/used/list?gener=${checkCategorys}&filterType=${filterType}`;
        }else if(selectVl.value != null && selectVl.value != ''){
        	location.href = `/used/list?selectValue=${selectVl.value}`
        }else if(checkCategorys.length === 0){
        	location.href = `/used/list`;
        }else {
        	location.href = `/used/list?gener=${checkCategorys}`;
        }
    });
});

//검색 이벤트
function selectBookShoping() {
	console.log(checkCategorys);
	if(checkCategorys > 0){
		location.href = `/used/list?gener=${checkCategorys}&selectValue=${selectVl.value}`
	}else {
		location.href = `/used/list?selectValue=${selectVl.value}`
		
	}
}

let visibleCount = 10; // 처음 보여줄 상품 수
const productRows = document.querySelectorAll('.product-row'); // 모든 상품 행 선택
const loadMoreButton = document.getElementById('load-more');

// 초기 로드 시 첫 10개 상품 보여주기
function loadInitialProducts() {
    for (let i = 0; i < visibleCount && i < productRows.length; i++) {
        productRows[i].style.display = ''; // 상품 보여주기
    }
    updateLoadMoreButton();
}

// 더보기 버튼 업데이트
function updateLoadMoreButton() {
    if (visibleCount < productRows.length) {
        loadMoreButton.style.display = 'block'; // 더보기 버튼 표시
    } else {
        loadMoreButton.style.display = 'none'; // 더보기 버튼 숨김
    }
}

// 더보기 버튼 클릭 핸들러
function loadMoreProducts() {
    const nextVisibleCount = visibleCount + 10; // 다음에 보여줄 상품 수
    for (let i = visibleCount; i < nextVisibleCount && i < productRows.length; i++) {
        productRows[i].style.display = ''; // 상품 보여주기
    }
    visibleCount = nextVisibleCount; // 보여준 상품 수 업데이트
    updateLoadMoreButton(); // 버튼 상태 업데이트
}

// 페이지 로드 시 초기 상품 로드
window.onload = loadInitialProducts;

// 더보기 버튼 클릭 이벤트 등록
loadMoreButton.addEventListener('click', loadMoreProducts);


function goShopInsert() {
//	console.log('중고상품 등록');
	if(mno.value === ""){
		alert('로그인이 필요한 기능입니다!');
		return;
	}else{
		location.href = '/used/goInsert';
	}
}

function goGet(ubno){
	console.log("중고상품보기");
	console.log(mno.value);
	if(mno.value === ""){
		location.href = `/used/goGet?ubno=${ubno}&mno=0`;
	}else {
		location.href = `/used/goGet?ubno=${ubno}&mno=${mno.value}`;
	}
}
// 카테고리 클릭 이벤트 - 조회
//document.querySelectorAll('.sidebar a').forEach(a => {
//	a.addEventListener('click', e => {
//		e.preventDefault();
//		
//		gener = a.getAttribute('href');
//		filterType = a.getAttribute('filterType');
//		if(gener === null){
//			gener = new URLSearchParams(location.search).get('gener');
//		}
//		if(filterType === null){
//			filterType = new URLSearchParams(location.search).get('filterType');
//		}
//		setStorageData(pageNum, amount, gener, filterType);
//		
//		let sendData = `pageNum=1&amount=${amount}&gener=${gener}&filterType=${filterType}`;
//		console.log(sendData);
//		
//		location.href = `/shop/list?${sendData}`;
//	});
//});
// 페이지 정보 부여 이벤트
let pageNum = new URLSearchParams(location.search).get('pageNum');
let amount = new URLSearchParams(location.search).get('amount');
let gener = new URLSearchParams(location.search).get('gener');
let filterType = new URLSearchParams(location.search).get('filterType');
let selectValue = new URLSearchParams(location.search).get('selectValue');
let selectOption = new URLSearchParams(location.search).get('selectOption');
const selectOp = document.querySelector('select[name="selectOption"]');
const selectVl = document.querySelector('input[name="selectBook"]');


if(!pageNum || !amount || !gener || !filterType){
	pageNum = 1;
	amount = 20;
	gener = 0;
	filterType = 'status';
}
setStorageData(pageNum, amount, gener, filterType, selectOption, selectValue);

//페이지 버튼 클릭 이벤트
document.querySelectorAll(".page-nation li a").forEach( a => {
	a.addEventListener('click', e => {
		e.preventDefault();
		
		pageNum = a.getAttribute('href');
		setStorageData(pageNum, amount, gener, filterType);
		
		let sendData = null;
		if(checkCategorys.length > 0 && selectVl.value != ''){
			sendData = `pageNum=${pageNum}&amount=${amount}&gener=${checkCategorys}&filterType=${filterType}&selectOption=${selectOp.value}&selectValue=${selectVl.value}`;
        }else if(checkCategorys.length > 0 && selectVl.value == ''){
        	sendData = `pageNum=${pageNum}&amount=${amount}&gener=${checkCategorys}&filterType=${filterType}`;
        }else if(selectVl.value != ''){
        	sendData = `pageNum=${pageNum}&amount=${amount}&filterType=${filterType}&selectOption=${selectOp.value}&selectValue=${selectVl.value}`;
        }else {
        	sendData = `pageNum=${pageNum}&amount=${amount}&filterType=${filterType}`;
        }
		location.href = `/shop/list?${sendData}`;
	});
});
//선택된 카테고리를 배열에 담기
let checkCategorys = [];
// 선택된 필터 타입 선언
filterType = 'bno';
const filter = document.querySelector('input[name="filter"]');
// 필터 타입 선언
document.querySelectorAll('.filterType-body button').forEach(btn => {
	console.log('필터타입 : ' + filter.value);
	if(filter.value === ''){
		btn.addEventListener('click', e => {
			filterType = btn.id;
			if(checkCategorys.length > 0 && selectVl.value != ''){
				console.log(filterType);
				console.log('풀생성자');
	        	location.href = `/shop/list?gener=${checkCategorys}&pageNum=1&amount=20&filterType=${filterType}&selectOption=${selectOp.value}&selectValue=${selectVl.value}`;
	        }else if(checkCategorys.length > 0 && selectVl.value == ''){
	        	console.log(filterType);
	        	console.log('카테고리만');
	        	location.href = `/shop/list?gener=${checkCategorys}&pageNum=1&amount=20&filterType=${filterType}`;
	        }else if(selectVl.value != ''){
	        	console.log(filterType);
	        	console.log(selectVl.value);
	        	console.log('검색만');
	        	location.href = `/shop/list?pageNum=1&amount=20&selectOption=${selectOp.value}&selectValue=${selectVl.value}`
	        }else {
	        	console.log(filterType);
	        	console.log('기본생성자');
	        	location.href = `/shop/list?pageNum=1&amount=20&filterType=${filterType}`;
	        }
		});
	}else {
		filterType = filter.value;
	}
});

// DOMContentLoaded 이벤트가 발생하면 label에서 값 가져오기
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

// 초기화 버튼 누를 시 검색내용,선택된 카테고리 초기화
let resetBtn = document.querySelector('#resetBtn');

resetBtn.addEventListener('click', e => {
	checkCategorys = [];
	location.href = `/shop/list?pageNum=1&amount=20&filterType=bno`;
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
        if(checkCategorys.length > 0 && selectVl.value != null){
        	location.href = `/shop/list?gener=${checkCategorys}&pageNum=1&amount=20&filterType=${filterType}&selectOption=${selectOp.value}&selectValue=${selectVl.value}`;
        }else if(checkCategorys.length > 0 && selectVl.value == null){
        	location.href = `/shop/list?gener=${checkCategorys}&pageNum=1&amount=20&filterType=${filterType}`;
        }else if(selectVl.value != null){
        	location.href = `/shop/list?pageNum=1&amount=20&selectOption=${selectOp.value}&selectValue=${selectVl.value}`
        }else {
        	location.href = `/shop/list?pageNum=1&amount=20&filterType=${filterType}`;
        }
    });
});


// 검색 옵션 이벤트
selectOp.addEventListener('change', e => {
	console.log(e.target.value);
	if(e.target.value === "title"){
		document.querySelector('input[name="selectBook"]').placeholder = "제목으로 검색";
	}else if(e.target.value === "writer"){
		document.querySelector('input[name="selectBook"]').placeholder = "작가명으로 검색";
	}
});


// 검색 이벤트
function selectBookShoping() {
	console.log(selectOp.value);
	console.log(checkCategorys);
	if(checkCategorys.length > 0 && selectVl.value != null){
    	location.href = `/shop/list?gener=${checkCategorys}&pageNum=1&amount=20&filterType=${filterType}&selectOption=${selectOp.value}&selectValue=${selectVl.value}`;
    }else if(checkCategorys.length > 0 && selectVl.value == null){
    	location.href = `/shop/list?gener=${checkCategorys}&pageNum=1&amount=20&filterType=${filterType}`;
    }else if(selectVl.value != null){
    	location.href = `/shop/list?pageNum=1&amount=20&selectOption=${selectOp.value}&selectValue=${selectVl.value}`
    }else {
    	location.href = `/shop/list?pageNum=1&amount=20&filterType=${filterType}`;
    }
}

document.querySelectorAll('.card-title a').forEach(a => {
	a.addEventListener('click', e => {
		e.preventDefault();
	});
});

// 상품 클릭 이벤트 - 조회
function goGet(bno) {
//	console.log(bno);
	location.href = '/shop/get?bno=' + bno;
}

// 상품 등록 이벤트
function goShopInsert() {
	if(mno.value === ""){
		alert('로그인이 필요한 기능입니다!');
		return;
	}else{
		location.href = '/shop/goInsert';
	}
}

//별점 js
document.addEventListener("DOMContentLoaded", function() {
    document.querySelectorAll('.stars').forEach(starsContainer => {
        const rating = parseFloat(starsContainer.getAttribute('data-rating'));
        const stars = starsContainer.querySelectorAll('.star');
        stars.forEach((star, index) => {
            if (index < Math.floor(rating)) {
                star.style.color = '#FFD700'; // 노란색
            } else if (index === Math.floor(rating) && rating % 1 >= 0.5) {
                star.style.color = '#FFD700'; // 노란색 반 개
            } else {
                star.style.color = '#FFF'; // 흰색
            }
        });
    });
});



// 새 상품 등록 이벤트 (권한 필요)


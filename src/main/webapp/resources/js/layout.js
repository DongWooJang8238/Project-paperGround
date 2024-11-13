/*-------------- Form 관련 요소들 ------*/
//const f = document.forms[0];

// 헤더 요소들 (로그인,로그아웃,회원가입,마이페이지,카트)
const loginButton = document.getElementById('login');
const logoutButton = document.getElementById('logout');
const signupButton = document.getElementById('signup');
const mypageButton = document.getElementById('mypage');
const cart = document.getElementById('cart');
const userId = document.querySelector('input[name="userId"]');
const mno = document.querySelector('input[name="mno"]');
const books = document.querySelector('#books');

// 헤더 각 버튼 이벤트 핸들러
document.querySelectorAll(".user-options button").forEach(a => {
	a.addEventListener('click', ()=>{
		let menu = a.id;
		 console.log(menu);
		if(menu === "login"){
			location.href = '/User/login';
		}else if(menu === "logout"){
			// 추후 적용 예정 ( 시큐리티 )
			location.href = '/customLogout';
		}else if(menu === "signup"){
			location.href = '/User/signup';
		}else if(menu === "cart"){
			goToCart();
		}else if(menu === "myPage"){
			if(mno.value === ""){
				if(confirm('로그인이 필요한 서비스입니다. 로그인 하시겠습니까?')){
					location.href = '/User/login';
				}else {
					console.log('로그인안함');
				}
			}else {
				location.href = '/User/myPage?mno=' + mno.value;
			}
		}else if(menu === "gogack"){
			location.href = '/report/entrance?mno=' + mno.value;
		}
		
	});
});
function setStorageData(pageNum, amount, gener) {
	let pageData = {
			pageNum : pageNum,
			amount : amount,
			gener : gener
	};
	localStorage.setItem('page_data', JSON.stringify(pageData));
}
function getStorageData() {
	return JSON.parse( localStorage.getItem('page_data') );
}

function shopListGo() {
//	console.log(123);
	// 상단바에서 쇼핑리스트로 이동 시 gener = 0, pageNum = 1 으로 전송
	location.href = '/shop/list';
}
function shopUsedList() {
	location.href = '/used/list';
}
function writeHomeGo() {
	location.href = '/write/home';
}
function goToCart() {
	location.href = '/shop/cartListBuy?mno=' + mno.value;
}
function goBoard() {
	location.href = '/board/list?pageNum=1&amount=10';
}
function goGame(){
	if(mno.value === ""){
		alert('로그인이 필요한 기능입니다!');
		return;
	}else{
		location.href = '/game/entrance?mno='+mno.value;
	}
}

function toggleSubcategories(e){
	if(books.style.display === "none"){
		books.style.display = "block";
	}else if(books.style.display === "block"){
		books.style.display = "none";
	}
}

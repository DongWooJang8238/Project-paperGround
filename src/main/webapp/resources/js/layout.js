/*-------------- Form 관련 요소들 ------*/
//const f = document.forms[0];

console.log(1);

// 헤더 요소들 (로그인,로그아웃,회원가입,마이페이지,카트)
const loginButton = document.getElementById('login');
const logoutButton = document.getElementById('logout');
const signupButton = document.getElementById('signup');
const mypageButton = document.getElementById('mypage');
const cart = document.getElementById('cart');
const userId = document.querySelector('input[name="userId"]');
const mno = document.querySelector('input[name="mno"]');
const books = document.querySelector('#books');
const searchBox = document.querySelector('.search-box img');
const searchInput = document.querySelector('.search-box input');
const searchOption = document.querySelector('.search-box select');

// 검색 이벤트 핸들러 ( 돋보기 클릭 )
searchBox.addEventListener('click', e => {
   location.href = `/Total?selectOption=${searchOption.value}&selectValue=${searchInput.value}`;
});

searchInput.addEventListener('keydown', e => {
   if(e.key === 'Enter'){
      location.href = `/Total?selectOption=${searchOption.value}&selectValue=${searchInput.value}`;
   }
});


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
      }else if(menu === "seviceCenter"){
         if(mno.value == ''){
            location.href = '/report/entrance?mno=' + 0;
         }else{
            location.href = '/report/entrance?mno=' + mno.value;
         }
      }else if(menu === "adminPage"){
         location.href = '/admin/adminEntrance?mno=' + mno.value;
      }
      
   });
});

function seviceCenter() {
   if(mno.value === ''){
      if(confirm('로그인이 필요한 서비스입니다. 로그인하시겠습니까?')){
         location.href = '/report/entrance?mno=' + 0;
      }else{
         console.log(1);
      }
   }
}

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


function shopListGo(num) {
   if(num === 'all'){
      location.href = '/shop/list';
      return;
   }
   location.href = '/shop/list?gener=' + num;
}

function shopUsedList(num) {
	if(num === 'all'){
		location.href = '/used/list';
		return;
	}
	location.href = '/used/list?gener=' + num;
}
function writeHomeGo(filter) {
		if(filter === 'home'){
			if(mno.value === ''){
				location.href = '/write/home?mno=0';
				return;
			}
			
			location.href = '/write/home?mno=' + mno.value;
			
		}else if(filter === 'all'){
			if(mno.value === ''){
				location.href = '/write/AllList?mno=0';
				return;
			}
			location.href = '/write/AllList?mno=' + mno.value;
			return;
		}else if(filter === 'goMyEp'){
			if(mno.value === ''){
				alert('로그인이 필요한 기능입니다.');
				return;
			}
			location.href = '/write/goMyEpiosde?mno=' + mno.value;
			return;
		}
	
}
function goToCart() {
   location.href = '/shop/cartListBuy?mno=' + mno.value;
}
function goBoard() {
   location.href = '/board/list?pageNum=1&amount=10';
}

function goBoard(num) {
   if(Number(num) === 10){
      location.href = '/board/bestList?pageNum=1&amount=20';
      return;
   }
   location.href = '/board/list?pageNum=1&amount=10&category=' + num;
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


function godirectReport() {
//   console.log(1);
   console.log(mno.value);
   location.href = '/report/directReport?mno=' + mno.value;
}

function godirectReportCheck() {
//   console.log(2);
   location.href = '/report/directReportList?mno='  + mno.value;
}

function qna() {
//   console.log(3);
   location.href = '/report/qna';
}

function adminPage() {
//  console.log(3);
	location.href = '/admin/adminEntrance';
}
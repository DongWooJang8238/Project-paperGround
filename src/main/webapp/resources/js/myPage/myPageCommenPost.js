let filterType = null;

const myBoard = document.querySelectorAll('tbody tr');

myBoard.forEach(mb => {
	mb.addEventListener('click', e => {
		const boardno = mb.getAttribute('data-bno');
		location.href = `/board/get?boardno=${boardno}`;
	});
});
function showContent(tis, tabId) {
	const tabs = document.querySelectorAll('.tab');
	const contents = document.querySelectorAll('.content');

	tabs.forEach(tab => tab.classList.remove('active'));
	contents.forEach(content => content.style.display = 'none');

	tis.classList.add('active');
	console.log(tis);
	contents.forEach(content => {
		console.log("컨텐트아이디 : " + content.id);
		if(content.id === tabId){
			content.style.display = 'block';
		}

		console.log(tabId);
		if(tabId === 'comments'){
			filterType = 'comments';
			console.log("댓글" + filterType);
			let sendData = `pageNum=1&amount=${amount}&userMno=${mno.value}&filterType=${filterType}`;
			location.href = '/User/myCommenPost?' + sendData;
		}
		else if(tabId === 'posts'){
			filterType = 'posts';
			console.log("게시글 : " + filterType);
			let sendData = `pageNum=1&amount=${amount}&userMno=${mno.value}&filterType=${filterType}`;
			location.href = '/User/myCommenPost?' + sendData;
		}
		else if(tabId === 'liked'){
			filterType = 'liked';
			console.log("좋아요 : " + filterType);
			let sendData = `pageNum=1&amount=${amount}&userMno=${mno.value}&filterType=${filterType}`;
			location.href = '/User/myCommenPost?' + sendData;
		}
	});


} 


let pageNum = new URLSearchParams(location.search).get('pageNum');
let amount = new URLSearchParams(location.search).get('amount');
const tabButtons = document.querySelectorAll('.tab-button');


function setStorageData(pageNum, amount){
	let pageData = {
			pageNum : pageNum,
			amount : amount
	};
	localStorage.setItem('page_data', JSON.stringify(pageData));
}
function getStorageData(){
	return JSON.parse(localStorage.getItem('page_data'));

}

if(!pageNum || !amount ){
	pageNum = 1;
	amount = 5;
}

setStorageData(pageNum, amount);
//console.log(filterType);
document.querySelectorAll(".page-nation li a").forEach( a => {
	a.addEventListener('click', e => {
		e.preventDefault();
		const pageWrap = document.querySelector('.page-wrap');
		let filterType = document.getElementById('filterType').value;
		
		pageNum = a.getAttribute('href');
		console.log("pageNum : " +  pageNum);
		setStorageData(pageNum, amount);

		console.log(e.target.value);
		console.log(filterType);
		
		
		let sendData = `pageNum=${pageNum}&amount=${amount}&userMno=${mno.value}&filterType=${filterType}`;
		location.href = `/User/myCommenPost?${sendData}`;

	});
});



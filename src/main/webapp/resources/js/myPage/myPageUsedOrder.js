
//console.log("ddd" + mno.value);

//console.log(1);

//console.log(pageNum)
let pageNum = new URLSearchParams(location.search).get('pageNum');
let amount = new URLSearchParams(location.search).get('amount');
const tabButtons = document.querySelectorAll('.tab-button');
const tabContents = document.querySelectorAll('.order-table');
const sellBtn = document.querySelector('#sell');
const endBtn = document.querySelector('#end');
const saleEndContents = document.querySelector('#saleEnd')
const onSaleContents = document.querySelector('#onSale')
let filterType = '';

//tabBtn.forEach(btn => {
//	btn.addEventListener('click', () => {
//		tabBtn.forEach(btn => btn.classList.remove('active'));
//		
//	})
//		tabCon.forEach(content => content.classList.remove('avtive'));
//	btn.classList.add('active');
//	let tabId = btn.getAttribute('data-tab');
//	document.getElementById(tabId).classList.add('active');
//	
//});



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


tabButtons.forEach(button => {
	button.addEventListener('click', e => {
		console.log(e.target.value);
//		console.log(tabContents);
//		console.log(onSaleContents)
//		console.log(saleEndContents)
		
		// 판매완료 버튼
		if(e.target.value == 'saleEnd'){
			button.classList.add('active');
			sellBtn.classList.remove('active');
			let filterType = '0';
			console.log("saleEnd filterType : " + filterType);
//			let sendData = `pageNum=${pageNum}&amount=${amount}&userMno=${mno.value}&filterType=0`
//			location.href = `/User/saleEnd?${sendData}`;
			
			
//			saleEndContents.classList.add('active');
//			onSaleContents.classList.remove('active');
			// 판매중 버튼	
		}else {
			button.classList.add('active');
			endBtn.classList.remove('active');
			let filterType = '1';
			console.log("saleEnd filterType : " + filterType);
			let sendData = `pageNum=${pageNum}&amount=${amount}&userMno=${mno.value}&filterType=${filterType}`
			location.href = `/User/saleEnd?${sendData}`;
//			onSaleContents.classList.add('active');
//			saleEndContents.classList.remove('active');
			
		}
	});
});


//console.log("filterType : " + filterType);

//페이지 버튼 클릭 이벤트
document.querySelectorAll(".page-nation li a").forEach( a => {
	a.addEventListener('click', e => {
		e.preventDefault();
		const pageWrap = document.querySelector('.page-wrap');
		const startDate = pageWrap.getAttribute('data-startDate');
		const endDate = pageWrap.getAttribute('data-endDate');
		console.log("startDate" + startDate);
		console.log("endDate" + endDate);
//		console.log("filterType : " + document.getElementById('filterType').value);
		let filterType = document.getElementById('filterType').value;
		
		
		pageNum = a.getAttribute('href');
		console.log("pageNum : " +  pageNum);
		setStorageData(pageNum, amount);
		console.log("dawdadad" + setStorageData);
		console.log("filterType 페이지123123 : " + filterType)
		
		
//		if(filterType === '1' && startDate == '' && endDate == ''){
//			console.log(1234);
//			let sendData = `pageNum=${pageNum}&amount=${amount}&userMno=${mno.value}&filterType=${filterType}`
//				location.href = `/User/saleEnd?${sendData}`;
//		}
		
		if(startDate == '' && endDate == '' && filterType != '1'){
		let sendData = `pageNum=${pageNum}&amount=${amount}&userMno=${mno.value}`;
		location.href = `/User/myUsedProductsSelect?${sendData}`;
			
		}else if(startDate != '' && endDate != ''&& filterType != '1'){
		let sendData = `pageNum=${pageNum}&amount=${amount}&userMno=${mno.value}&startDate=${startDate}&endDate=${endDate}`;
		location.href = `/User/selectUsedProductDate?${sendData}`;
		}
		else if(filterType === '1'){
		console.log(1234);
		let sendData = `pageNum=${pageNum}&amount=${amount}&userMno=${mno.value}&filterType=${filterType}`
		location.href = `/User/saleEnd?${sendData}`;
		}
		
			
//		}else if(filterType == '1' && startDate != '' && endDate != ''){
//			let sendData = `pageNum=${pageNum}&amount=${amount}&userMno=${mno.value}&filterType=1&startDate=${startDate}&endDate=${endDate}`
//			location.href = `/User/saleEnd?${sendData}`;
		
		
		
		

     
	});
});



function queryData() {
	let startDate = document.getElementById('startDate').value;
	let endDate = document.getElementById('endDate').value;
//	let table = document.querySelectorAll('.book-data');
//	let startDate = new Date(start);
//	let endDate = new Date(end);
//	console.log(startDate);
//	console.log(endDate);
//	table.forEach(tbl => {
//		let tableDate = new Date(tbl.getAttribute('data-date'));
//		console.log(tableDate);
//	});
	let str = '';
	
	if(startDate > endDate){
		alert('흠냐뤼리링');
		return;
	}

//	obj = {mno : mno.value, startDate : startDate, endDate : endDate};
	
	
	let sendDate = `startDate=${startDate}&endDate=${endDate}&userMno=${mno.value}`;
//	console.log(obj);
	location.href = "/User/selectUsedProductDate?" + sendDate;
//	fetch(`/asycn/selectUsedCalendar/${mno}/${startDate}/${endDate}`)
//	.then(response => response.json())
//	.then(list => {
////		console.log(list);
//		list.forEach(date => {
//			
//			
//		});
//	
//	})
//	.catch(err => console.log(err))
//	
}

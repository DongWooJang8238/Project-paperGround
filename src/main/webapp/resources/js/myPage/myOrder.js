
/*-------------- 버튼 클릭시 동작 함수------*/
function setPeriod(day) {
	let mno = document.getElementById('mno').value;
//	console.log(day);
//	let obj = {mno : mno, selectDay : day};
	let str = '';
	
	fetch(`/asycn/selectDay/${mno}/${day}`)
		.then(response => response.json())
		.then(list => {
			console.log(list);
			if(list.length > 0){
				list.forEach( order =>{
					const date = new Date(order.orderDate);
					const sqlDate = date.toLocaleDateString('en-CA');	
					
					str += `<tr class="order-row visible" data-odno="${order.odno}" data-title="${order.title}">`;	
					str += `<td>
						<a href="/shop/get?bno=${order.bno }" >
						<img style="margin: 0px 0;" class="card-image" src="${order.bookCover}" alt="책 이미지" width="150" height="150">
						</a> 
						</td>`;	
					str += `<td>${order.title}</td>`;	
					str += `<td>총 ${order.totalPrice.toLocaleString()} 원 (${order.orderStatus}) </td>`;
					str += `<td>${sqlDate} <button type="button" id="odno" onclick="orderDetail('${order.odno }')">상세 주문내역</button></td>`;	
					str += `</tr>`;	
				});
				document.querySelector('#tbody').innerHTML = str;
			}else if(list.length == 0){
				str += `<tr >`;
				str += `<td style="text-align:center" height = "200px" colspan="6">조회된 데이터가 없습니다</td>`;
				str += `</tr>`;
				document.querySelector('#tbody').innerHTML = str;
			}
		})
		.catch(err => console.log(err))
	
}

function showOrder(odno) {
	console.log(odno);
	// 하위 주문 내역을 보여줄 tbody를 찾습니다.
	const tbody = document.getElementById('tbody');
	// odno에 해당하는 부모 tr 아래에 추가합니다.
	const parentRow = document.querySelector(`tr[data-odno='${odno}']`);
	fetch(`/asycn/selectOrderDetail?odno=${odno}`)
	.then(response => response.json())
	.then(data => {
		console.log(data);
		let str = '';
		data.forEach(list => {
			if(parentRow.getAttribute('data-title') === list.title){
				console.log('중복된 제목');
			}else {
				const date = new Date(list.orderDate);
				const sqlDate = date.toLocaleDateString('en-CA');
				str += `<tr class="orderNewDetail">`;
				str += `<td><a><img style="margin: 0px 0;" class="card-image" src="${list.bookCover}" alt="책 이미지" width="100" height="150"></a></td>`;
				str += `<td><a>${list.title}</a></td>`;
				str += `<td>총 ${list.bookPrice.toLocaleString()} 원 ( ${list.count} )</td>`;
				str += `<td>${sqlDate}(${list.orderStatus})</td>`;
				str += `</tr>`;
			}
		});
		
        console.log(parentRow.getAttribute('data-title'));
        // 이미 하위 내역이 표시되면, 숨기거나 제거하는 로직 추가
        const existingDetails = parentRow.nextElementSibling;

        if (existingDetails && existingDetails.classList.contains('orderNewDetail')) {
            // 이미 존재할 경우, 토글하는 로직
            existingDetails.style.display = existingDetails.style.display === 'none' ? '' : 'none';
        } else {
            // 새로운 하위 주문 내역 추가
            const newRow = document.createElement('tr');
            newRow.classList.add('orderNewDetail');
            newRow.innerHTML = str;
            parentRow.after(newRow); // 부모 row 바로 아래에 추가
        }
	})
	.catch(err => console.log(err))
}
/*-------------- 기간별 조회 함수 ------*/
function queryData() {
//	console.log(document.getElementById('startDate').value);
//	console.log(document.getElementById('endDate').value);
	let startDate = document.getElementById('startDate').value;
	let endDate = document.getElementById('endDate').value;
	let mno = document.getElementById('mno').value;
	let str = '';
	
	if(startDate > endDate){
		alert('흠냐뤼리링');
		return;
	}

	obj = {mno : mno, startDate : startDate, endDate : endDate};
	console.log(obj);
	
	fetch(`/asycn/selectCalendar/${mno}/${startDate}/${endDate}`)
	.then(response => response.json())
	.then(list => {
		if(list.length > 0){
			list.forEach( order =>{
				const date = new Date(order.orderDate);
				const sqlDate = date.toLocaleDateString('en-CA');	
				
				str += `<tr class="order-row visible" data-odno="${order.odno}" data-title="${order.title}">`;	
				str += `<td>${sqlDate }<button type="button" onclick="orderDetail(${order.odno})">상세 주문내역</button></td>`;	
				str += `<td>${order.odno}</td>`;	
				str += `<td>
							<a href="/shop/get?bno=${order.bno }" >
							<img src="${order.bookCover}" alt="책 이미지" width="150" height="150">
							</a> 
						</td>`;		
				str += `<td>${order.title}</td>`;	
				str += `<td>${order.orderStatus}</td>`;	
				if(order.totalPrice > 20000){
					str += `<td>총 ${order.totalPrice} 원 <button type="button" onclick="showOrder(${order.odno})">더보기</button></td>`;	
				}else{
					str += `<td>총 ${order.totalPrice} 원 </td>`;
				}
				str += `</tr>`;	
			});
			document.querySelector('#tbody').innerHTML = str;
		}else if(list.length == 0){
			str += `<tr >`;
			str += `<td style="text-align:center" height = "200px" colspan="6">조회된 주문내역이 없습니다.</td>`;
			str += `</tr>`;
			document.querySelector('#tbody').innerHTML = str;
		}
	})
	.catch(err => console.log(err))
	
}

/*-------------- 주문 상세 이동 페이지------*/
function orderDetail(odno) {
	let mno = document.getElementById('mno').value;
	console.log(mno);
	console.log(odno)
	
	location.href = '/User/myPageUserOrderDetail?mno=' + mno + "&odno=" + odno;
}


/*-------------- 더보기 클릭 전(3개 출력), 클릭 후(전체 출력 함수)------*/
document.addEventListener('DOMContentLoaded', () => {
	const rows = document.querySelectorAll('.order-row');
	rows.forEach((row, index) => {
		if (index < 3) {
			row.classList.add('visible'); // 처음 3개는 visible 클래스를 추가하여 보이게 설정
		}
	});
});

function toggleDetails() {
	const rows = document.querySelectorAll('.order-row'); // 모든 주문 행 선택
	if(document.querySelector('.toggle-button').innerHTML === '더보기'){
		rows.forEach(row => {
			row.classList.add('visible'); // 모든 행에 visible 클래스 추가
			document.querySelector('.toggle-button').innerHTML = '접기';
		});
	}else {
		rows.forEach(row => {
			row.classList.remove('visible'); // 모든 행에 visible 클래스 추가
			document.querySelector('.toggle-button').innerHTML = '더보기';
		});
	}
	rows[0].classList.add('visible');
	rows[1].classList.add('visible');
	rows[2].classList.add('visible');
//	rows.forEach(row => {
//	console.log(row);
//	row.classList.add('visible'); // 모든 행에 visible 클래스 추가
//	document.querySelector('.toggle-button').innerHTML = '접기';
//	});

//	document.querySelector('.toggle-button').addEventListener('click' ,()=>{
//	const rows = document.querySelectorAll('.order-row');
//	rows.forEach((row, index) => {
//	if (index > 2) {
//	console.log('인덱스1:' + index);
//	row.classList.remove('visible'); 

//	}else if(index < 3) {
//	console.log('인덱스2:' + index);
//	row.classList.add('order-row');
//	document.querySelector('.toggle-button').innerHTML = '더보기';

//	}
//	});

//	});
}
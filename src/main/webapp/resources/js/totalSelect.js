const seop = document.querySelector('.card_name').getAttribute('data-selectop'); // 검색 옵션
const seva = document.querySelector('.card_name').getAttribute('data-selectva'); // 검색 내용

// 더보기 클릭 이벤트
document.querySelectorAll('.lst_more').forEach(a => {
	a.addEventListener('click', e => {
		dataType = e.target.getAttribute('data-type');
		console.log(dataType);
		if(dataType === 'board'){
			location.href = '/board/list';
		}else if(dataType === 'book'){
			location.href = `/shop/list?selectOption=${seop}&selectValue=${seva}`;
		}else if(dataType === 'ubook'){
			location.href = `/used/list?selectOption=${seop}&selectValue=${seva}`;
		}else if(dataType === 'write'){
			if(mno.value === '' || !mno.value || mno.value === null){
				mno.value = 0;
			}
			location.href = '/write/AllList?mno=' + mno.value;
		}
	});
});

// 아이템 클릭 이벤트
document.querySelectorAll('li a').forEach(a => {
	a.addEventListener('click', e => {
		e.preventDefault();
		const eno = e.target.getAttribute('data-no');
		if(e.target.href === 'http://localhost:9090/board'){
			location.href = `/board/get?boardno=${eno}`;
		}else if(e.target.href === 'http://localhost:9090/book'){
			location.href = `/shop/get?bno=${eno}`;
		}else if(e.target.href === 'http://localhost:9090/ubook'){
			if(!mno){
				location.href = `/used/goGet?ubno=${eno}&mno=0`;
			}else if(mno.value === ''){
				location.href = `/used/goGet?ubno=${eno}&mno=0`;
			}else {
				location.href = `/used/goGet?ubno=${eno}&mno=${mno.value}`;
			}
		}else if(e.target.href === 'http://localhost:9090/write'){
			if(!mno){
				location.href = `/write/goEpisodeList?wno=${eno}&mno=0`;
			}else if(mno.value === ''){
				location.href = `/write/goEpisodeList?wno=${eno}&mno=0`;
			}else {
				location.href = `/write/goEpisodeList?wno=${eno}&mno=${mno.value}`;
			}
		}
	});
});
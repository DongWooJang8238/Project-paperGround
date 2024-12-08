console.log('여긴 올리시트');

document.addEventListener('DOMContentLoaded', function () {
    const tabMenu = document.querySelectorAll('.section-tab-menu ul li button');
    const tabli = document.querySelectorAll('.section-tab-menu ul li');
    const inner = document.querySelector('.inner button');
    const rightButton = document.querySelector('.react-horizontal-scrolling-menu--arrow-right button');
    const scrollContainer = document.querySelector('.react-horizontal-scrolling-menu--scroll-container');
    const favorite = document.querySelectorAll('.icon-favorite button');
    const tagA = document.querySelectorAll('a');
    const filterDiv = document.querySelector('#filterDiv');
    const closeButton = document.querySelector('.react-modal-sheet-backdrop');
    const filterGenre = document.querySelectorAll('#filterGenre li');
    const filterType = document.querySelectorAll('#filterType li');
    const writeLi = document.querySelectorAll('.writeLi');
    let filterValue = [];
    let filterOption = '전체';
    
    // 필터 버튼 클릭 이벤트
    inner.addEventListener('click', e => {
    	filterDiv.style.display = 'block';
    });
    
    // 장르 필터 선택  시 이벤트
    filterGenre.forEach(li => {
    	li.addEventListener('click', e => {
    		if(e.target.tagName === 'LABEL'){
    			if(e.target.innerHTML === '전체'){
    				filterGenre.forEach(fil => fil.style.backgroundColor = 'white');
    				filterValue = [];
    			}else if(li.style.backgroundColor === 'rgb(119, 119, 119)'){
    				li.style.backgroundColor = 'white';
    				const value = filterValue.filter(val => val !== e.target.innerHTML);
    				filterValue = value;
    			}else{
    				li.style.backgroundColor = '#777';
    				filterValue.push(e.target.innerHTML);
    			}
    		}
    	});
    });
    
    // 필터 타입 선택 시 이벤트
    filterType.forEach(li => {
    	li.addEventListener('click', e => {
    		if(e.target.tagName === 'LABEL'){
    			if(e.target.innerHTML === '전체'){
    				filterType.forEach(fil => fil.style.backgroundColor = 'white');
    				filterOption = '전체';
    				console.log(filterOption);
    			}else if(li.style.backgroundColor === 'rgb(119, 119, 119)'){
    				li.style.backgroundColor = 'white';
    				filterOption = '전체';
    				console.log(filterOption);
    			}else{
    				filterType.forEach(fil => fil.style.backgroundColor = 'white');
    				li.style.backgroundColor = '#777';
    				filterOption = e.target.innerHTML;
    				console.log(filterOption);
    			}
    		}
    	});
    });
    
    // 초기화 버튼 누를 시 이벤트
    document.querySelector('.btn-reset').addEventListener('click', e => {
    	writeLi.forEach(li => li.style.display = 'block');
    	filterGenre.forEach(fil => fil.style.backgroundColor = 'white');
    	filterType.forEach(fil => fil.style.backgroundColor = 'white');
    	filterValue = [];
    	filterOption = '전체';
    });
    
    // 적용 버튼 누를 시 이벤트
    document.querySelector('.btn-apply').addEventListener('click', e => {
    	if(filterValue.length === 0){
    		if(filterOption === '전체'){
    			writeLi.forEach(li => li.style.display = 'block');
    		}else {
    			writeLi.forEach(li => {
    				li.style.display = 'none';
    				let writeType = li.getAttribute('data-filter');
    				if(writeType === filterOption){
    					li.style.display = 'block'
    				}
    			});
    		}
    	}else {
    		console.log('일단뭔가선택됬어.')
    		filterValue.forEach(val => {
    			writeLi.forEach(li => {
    				let genre = li.getAttribute('data-genre');
    				let writeType = li.getAttribute('data-filter');
    				li.style.display = 'none';
    				if(filterOption === '전체'){
    					if(genre === val){
    						li.style.display = 'block';
    					}
    				}else {
    					if(genre === val && writeType === filterOption){
    						li.style.display = 'block';
    					}
    				}
    			});
    		});
    	}
    	
    	filterDiv.style.display = 'none';
    });
    
    
    // 영역 바깥 클릭 시 모달 창 닫기
    closeButton.addEventListener('click', e => {
    	filterDiv.style.display = 'none';
    });
    
    // 좋아요 버튼 클릭 이벤트
    favorite.forEach(btn => {
    	btn.addEventListener('click', e => {
    		e.preventDefault();
    		if(mno.value === ''){
    			alert('로그인이 필요합니다.');
    			return;
    		}
    		let wno = e.target.getAttribute('data-wno');
    		console.log(wno);
    		console.log(mno.value);
    		// 내 북마크 목록에 추가하는 비동기 함수 ( 패치 ) 실행
    		fetch(`/write/likeUpdate?wno=${wno}&mno=${mno.value}`)
    			.then(response => response.text())
    			.then(result => {
    				console.log("리솔트 : " + result);
    				// 이후 좋아요 눌러진 작품 이미지 변경
    				if(e.target.src === 'https://cf.joara.com/joara30FE/assets/icon/ico_star_toggle.png'){
    					e.target.src = 'https://cf.joara.com/joara30FE/assets/icon/ico_star.png';
    				}else {
    					e.target.src = 'https://cf.joara.com/joara30FE/assets/icon/ico_star_toggle.png';
    				}
    			})
    			.catch(err => console.log(err));
    		
    	});
    });
    
    // 작품 클릭 이벤트 ( tagA )
    tagA.forEach(a => {
    	a.addEventListener('click', e => {
    		const bookPre = a.getAttribute('data-link-type');
    		if(bookPre === 'book-preview'){
    			e.preventDefault();
    			const wno = a.getAttribute('data-wno');
    			console.log(e.target.tagName);
    			console.log(e.target.getAttribute('alt'));
    			if(e.target.getAttribute('alt') === '선호작 등록'){
    				console.log('여긴이미지');
    			}else if(mno.value === ''){
    				location.href = '/write/goEpisodeList?wno=' + wno + "&mno=0";
    			}else {
    				location.href = '/write/goEpisodeList?wno=' + wno + "&mno=" + mno.value;
    			}
    		}
    	});
    });
    
});
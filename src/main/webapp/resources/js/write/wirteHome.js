document.querySelector('#myEp').addEventListener('click', e => {
	e.preventDefault();
	location.href = '/write/goMyEpiosde?mno=' + mno.value;
});

//Swiper 초기화
const swiper = new Swiper('.swiper', {
    slidesPerView: 'auto', // 한 번에 보여줄 슬라이드 개수
    spaceBetween: 15, // 슬라이드 간 간격
    navigation: {
        nextEl: '.slide-button-next', // '다음' 버튼
        prevEl: '.slide-button-prev', // '이전' 버튼
    },
    loop: false, // 반복하지 않음 (필요에 따라 true로 설정 가능)
});

// 다음 버튼 클릭 시
document.querySelector('.slide-button-next').addEventListener('click', () => {
    swiper.slideNext(); // 다음 슬라이드로 이동
});

// 이전 버튼 클릭 시
document.querySelector('.slide-button-prev').addEventListener('click', () => {
    swiper.slidePrev(); // 이전 슬라이드로 이동
});


document.addEventListener('DOMContentLoaded', function () {
    const slideTrack = document.querySelector('.slick-track');
    const slides = document.querySelectorAll('.slick-slide');
    const btnLeft = document.querySelector('.ic-arrow.left');
    const btnRight = document.querySelector('.ic-arrow.right');
    const favorite = document.querySelectorAll('.icon-favorite button');
    const categoriDiv = document.querySelectorAll('.react-horizontal-scrolling-menu--item');
    const tagA = document.querySelectorAll('a');
    const div = document.querySelectorAll('div');
    const slideWidth = slides[0].offsetWidth; // 슬라이드 하나의 너비
    const tabMenu = document.querySelectorAll('.section-tab-menu ul li button');
    const tabli = document.querySelectorAll('.section-tab-menu ul li');
    const inner = document.querySelectorAll('.inner ul li a');
    const rightButton = document.querySelector('.react-horizontal-scrolling-menu--arrow-right button');
    const scrollContainer = document.querySelector('.react-horizontal-scrolling-menu--scroll-container');

    const scrollAmount = 300; // 한 번에 스크롤할 픽셀 수

    // "Right" 버튼 클릭 시
    rightButton.addEventListener('click', function () {
        scrollContainer.scrollBy({
            left: scrollAmount, // 오른쪽으로 스크롤
            behavior: 'smooth'  // 부드러운 스크롤
        });
    });
    // 슬라이드 배열을 복사하여 순서를 조정할 수 있게 만듦
    let slideArray = Array.from(slides);

    // 초기 슬라이드 배치
    function renderSlides() {
        slideTrack.innerHTML = ''; // 기존 슬라이드 제거
        slideArray.forEach(slide => {
            slideTrack.appendChild(slide);
        });
    }

    // 슬라이드 이동 함수
    function moveSlidesLeft() {
        // 왼쪽으로 이동하면 배열의 첫 번째 요소를 뒤로 보냄
        const firstSlide = slideArray.shift();
        slideArray.push(firstSlide);
        renderSlides();
    }

    function moveSlidesRight() {
        // 오른쪽으로 이동하면 배열의 마지막 요소를 앞으로 보냄
        const lastSlide = slideArray.pop();
        slideArray.unshift(lastSlide);
        renderSlides();
    }

    // 초기 렌더링
    renderSlides();

    // 오른쪽 버튼 클릭 이벤트
    btnRight.addEventListener('click', function () {
        moveSlidesRight();
    });

    // 왼쪽 버튼 클릭 이벤트
    btnLeft.addEventListener('click', function () {
        moveSlidesLeft();
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
    			console.log(e.target.src);
    			if(mno.value === ''){
    				alert('로그인이 필요한 기능입니다.');
    				return;
    			}else if(e.target.src === 'https://cf.joara.com/joara30FE/assets/icon/ico_star.png'){
    				console.log('즐겨찾기 클릭!');
    			}else if(e.target.src === 'https://cf.joara.com/joara30FE/assets/icon/ico_star_toggle.png'){
    				console.log('즐겨찾기 클릭!');
    			}else if(e.target.src === 'https://cf.joara.com/joara30FE/assets/icon/ico_star_shadow.png'){
    				console.log('즐겨찾기 클릭!');
    			}else {
    				location.href = '/write/goEpisodeList?wno=' + wno + "&mno=" + mno.value;
    			}
    		}
    	});
    });
    
    // 게시판 버튼 클릭 이벤트
    inner.forEach(a => {
    	a.addEventListener('click', e => {
    		console.log(e.target.alt);
    		if(e.target.alt === '전체작품'){
    			location.href = '/write/AllList';
    		}
    	});
    });
    
    // 카테고리 클릭 이벤트
    tabMenu.forEach(li => {
    	li.addEventListener('click', e => {
    		const no = e.target.getAttribute('data-tab_no');
    		const listyle = e.target.parentElement;
    		if(no === '75'){
    			tabli[0].className = 'active';
    			tabli[1].className = '';
    			tabli[2].className = '';
    			tabli[3].className = '';
    			tabli[4].className = '';
    			categoriDiv.forEach(cadiv => {
    				const genre = cadiv.getAttribute('data-genre');
    		    	if(genre === '판타지'){
    		    		cadiv.style.display = 'block';
    		    	}else {
    		    		cadiv.style.display = 'none';
    		    	}
    		    });
    		}else if(no === '76'){
    			tabli[0].className = '';
    			tabli[1].className = 'active';
    			tabli[2].className = '';
    			tabli[3].className = '';
    			tabli[4].className = '';
    			categoriDiv.forEach(cadiv => {
    				const genre = cadiv.getAttribute('data-genre');
    		    	if(genre === '무협'){
    		    		cadiv.style.display = 'block';
    		    	}else {
    		    		cadiv.style.display = 'none';
    		    	}
    		    });
    		}else if(no === '77'){
    			tabli[0].className = '';
    			tabli[1].className = '';
    			tabli[2].className = 'active';
    			tabli[3].className = '';
    			tabli[4].className = '';
    			categoriDiv.forEach(cadiv => {
    				const genre = cadiv.getAttribute('data-genre');
    		    	if(genre === '로맨스'){
    		    		cadiv.style.display = 'block';
    		    	}else {
    		    		cadiv.style.display = 'none';
    		    	}
    		    });
    		}else if(no === '78'){
    			tabli[0].className = '';
    			tabli[1].className = '';
    			tabli[2].className = '';
    			tabli[3].className = 'active';
    			tabli[4].className = '';
    			categoriDiv.forEach(cadiv => {
    				const genre = cadiv.getAttribute('data-genre');
    		    	if(genre === 'BL'){
    		    		cadiv.style.display = 'block';
    		    	}else {
    		    		cadiv.style.display = 'none';
    		    	}
    		    });
    		}else if(no === '79'){
    			tabli[0].className = '';
    			tabli[1].className = '';
    			tabli[2].className = '';
    			tabli[3].className = '';
    			tabli[4].className = 'active';
    			categoriDiv.forEach(cadiv => {
    				const genre = cadiv.getAttribute('data-genre');
    		    	if(genre === '패러디'){
    		    		cadiv.style.display = 'block';
    		    	}else {
    		    		cadiv.style.display = 'none';
    		    	}
    		    });
    		}
    	});
    });
});


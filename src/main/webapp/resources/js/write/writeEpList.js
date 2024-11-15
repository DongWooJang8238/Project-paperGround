console.log('여긴 독자의 영역');

// 집필 게시판 바로가기 이벤트
document.querySelectorAll('.writeHome').forEach(link => {
	link.addEventListener('click', e => {
		if(mno.value === ''){
			location.href = '/write/home?mno=0';
		}else {
			location.href = '/write/home?mno=' + mno.value;
		}
	});
});

// 에피소드 회차 이벤트
document.querySelectorAll('.banner-secondary').forEach(div => {
	div.addEventListener('click', e => {
		const episodeno = div.getAttribute('data-epno');
		const modal = document.querySelector('.writeEpisodeContentModal');
		
		modalContentLoad(episodeno, modal);
	});
});

// 각종 클릭 이벤트
document.addEventListener('click', e => {
	const modal = document.querySelector('.writeEpisodeContentModal');
	if(modal.style.display === 'flex'){
		if(!modal.contains(e.target)){
			modal.style.display = 'none';
		}
	}
	if(e.target.id === 'prev-btn'){
		const epno = Number(e.target.getAttribute('data-epno')) - 1;
		modalContentLoad(epno, modal);
	}else if(e.target.id === 'next-btn'){
		const epno = Number(e.target.getAttribute('data-epno')) + 1;
		modalContentLoad(epno, modal);
	}else if(e.target.id === 'list-btn'){
		modal.style.display = 'none';
	}
});

// 모달 창 내용 이벤트
function modalContentLoad(episodeno, modal) {
	
	fetch(`/write/episodeContent?episodeno=${episodeno}`)
	.then(response => response.json())
	.then(result => {
		let str = `<div class="modal-header">
				        <h1>${result.episodeTitle}</h1>
				    </div>
				    <div class="modal-body">
				        <div class="content">
				            <ol>
				                <b>${result.episodeCount}</b>
				                <p>
				                    ${result.content}
				                </p>
				            </ol>
				        </div>
				        <div class="comment">
				            <h2>작가의 한줄</h2>
				            <b>${result.episodeComment}</b>
				        </div>
				        <div class="reply">
				            <h2>리뷰(댓글) 영역</h2>
				        </div>
				    </div>
				    <div class="modal-footer">
				        <button id="prev-btn" data-epno="${episodeno}">이전편</button>
				        <button id="list-btn">목록</button>
				        <button id="next-btn" data-epno="${episodeno}">다음편</button>
				    </div>`;
		
		modal.innerHTML = str;
		
		modal.style.display = 'flex';
		
		const prevBtn = document.querySelector('#prev-btn');
		const nextBtn = document.querySelector('#next-btn');
		
		if(prevBtn.getAttribute('data-epno') == 1){
			prevBtn.disabled = true;
		}
	})
	.catch(err => alert('다음화가 없습니다.'));
}

//document.addEventListener('DOMContentLoaded', () => {
//	
//	const prevBtn = document.querySelector('#prev-btn');
//	console.log(prevBtn);
//});


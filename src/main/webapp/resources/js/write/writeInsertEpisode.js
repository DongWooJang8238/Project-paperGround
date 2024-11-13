const formData = new FormData();

document.querySelector('.pc-page-link a').addEventListener('click', e => {
	e.preventDefault();
	sendData();
});

// 전송 데이터
function sendData() {
	const episodeTitle = document.querySelector('textarea[name="episodeTitle"]');
	const content = document.querySelector('textarea[name="content"]');
	const episodecomment = document.querySelector('textarea[name="episodecomment"]');
	const wno = document.querySelector('input[name="wno"]');
	if(episodeTitle.value === ''){
		alert('에피소드 제목을 입력하세요');
		return;
	}else if(episodeTitle.value.length < 5){
		alert('에피소드 제목은 최소 5글자 이상 입력 해 주세요');
		return;
	}else if(content.value === ''){
		alert('내용을 입력 해 주세요');
		return;
	}else if(episodecomment.value === ''){
		episodecomment.value = '...';
	}
	
	console.log(episodeTitle.value);
	console.log(content.value);
	console.log(episodecomment.value);
	console.log(wno.value);
	
	const obj = {
		episodeTitle : episodeTitle.value,
		content : content.value,
		episodeComment : episodecomment.value,
		wno : wno.value
	};
	
	fetch('/write/writeInsertEpisode', {
		method: 'POST',
	    body: JSON.stringify(obj),
	    headers: {
	        'Content-Type': 'application/json'
	    }
	})
		.then(response => response.text())
		.then(result => {
			console.log(result);
			if(result === 'success'){
				alert('작품 등록이 완료되었습니다.');
				location.href = '/write/home';
			}else {
				alert('문제가 발생하였습니다.');
				return;
			}
		})
		.catch(err => console.log(err));
}
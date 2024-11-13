const f = document.forms[0];

document.querySelector('.pc-page-link a').addEventListener('click', e => {
	e.preventDefault();
	sendData();
})

function sendData() {
	const writeType = document.querySelector('select[name="writeType"]');
	const genre = document.querySelector('select[name="genre"]');
	const title = document.querySelector('textarea[name="title"]');
	const description = document.querySelector('textarea[name="description"]');
	// 빈칸 예외처리 해야됨
	if(title.value === ''){
		alert('제목은 반드시 입력해야 합니다.');
		title.focus();
		return;
	}else if(title.value.length < 5){
		alert('제목은 최소 5글자 이상으로 작성해야 합니다.');
		title.focus();
		return;
	}else if(description.value === ''){
		alert('작품소개를 적어주세요.');
		description.focus();
		return;
	}else if(description.value.length < 10){
		alert('작품소개는 최소 10글자 이상으로 작성해야 합니다.');
		description.focus();
		return;
	}
	
	const mnoInput = document.createElement('input');
	mnoInput.type = 'hidden';
	mnoInput.name = 'mno';
	mnoInput.value = mno.value;
	
	const writecover = document.createElement('input');
	writecover.type = 'hidden';
	writecover.name = 'coverimage';
	writecover.value = '';
	
	f.appendChild(mnoInput);
//	f.appendChild(writecover);

	console.log(f.writeType.value);
	console.log(f.genre.value);
	console.log(f.title.value);
	console.log(f.description.value);
	console.log(f.mno.value);
	
	f.action = "/write/writeInsert";
	f.submit();
}
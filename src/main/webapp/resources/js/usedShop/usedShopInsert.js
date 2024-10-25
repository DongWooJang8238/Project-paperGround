// 필드
const f = document.forms[0];
let imgName = f.ubookImage;
let usedImgs = document.querySelectorAll('.usedImgs');

// 버튼 이벤트
document.querySelectorAll('button').forEach(btn => {
	btn.addEventListener('click', () => {
//		console.log(btn.innerHTML);
		if(btn.innerHTML === "등록"){
			usedShopInsert();
		}else if(btn.innerHTML === "취소"){
			location.href = "/used/list?genre=0&pageNum=1&amount=10";
		}
	});
});

// 상품 등록 함수
function usedShopInsert() {
	console.log(f.title.value);
	console.log(f.ubookPrice.value);
	console.log(f.gno.value);
	console.log(f.status.value);
	console.log("대표 이미지 : " + f.ubookImage.value);
	console.log(f.content.value);
	console.log(f.mno.value);
	document.querySelectorAll('.usedImgs').forEach(img => {
		console.log("이미지들 : " + img.value);
	});
	f.action = "/used/insert";
	f.submit();
	
}
/*
 * 이미지 업로드 시 비동기로 물리 폴더에 저장 후
 * 이미지 미리보기 영역에 이미지 출력 ( 이미지 여러장이면 옆으로 쭉 나열 )
 */
document.querySelector('.fileUpload input').addEventListener('change', e => {
	const files = e.target.files; // 선택한 이미지 파일 필드 저장
	const fileResult = document.querySelector('.fileResult ul'); // 미리보기 표시할 영역 지정
	const formData = new FormData();	// 파일 업로드 비동기를 위한 폼 객체 생성
	fileResult.innerHTML = '';
	
	// 이미지 파일이 여러장 일 수 있으니 for문 돌면서 사용
	for (let i = 0; i < files.length; i++) {
		let imgFile = new FileReader(); // 미리보기 파일 필드
		imgFile.onload = (event) => {
			// 파일이 로드되면, 새로운 리스트 아이템(li)을 생성하고 그 안에 이미지 추가
			const li = document.createElement('li');
			const img = document.createElement('img');
			img.src = event.target.result; // 로드된 파일의 데이터 URL을 이미지의 소스로 설정
			img.style.width = '100px'; // 이미지 크기 조정
			img.style.height = '100px'; // 이미지 크기 조정
			li.appendChild(img); // 리스트 아이템에 이미지 추가
			fileResult.appendChild(li); // 미리보기 영역에 리스트 아이템 추가
			
		};
		formData.append('uploadFile', files[i]); // 각 파일을 FormData에 추가
		imgFile.readAsDataURL(files[i]); // 파일을 읽고 데이터 URL로 변환
	}
	
	// 파일 업로드 비동기 패치 실행
	fetch('/shopUpload/uploadMost', {
		method: 'POST',
		body: formData,
	})
	.then(response => response.json())
	.then(data => {
		let str = '';
		let i = 0;
		if(data){
			// vo에 담긴 파일명들을 hidden으로 form 내부에 저장
			data.forEach(file => {
				console.log(file.ubookimage);
				str += `<input type="hidden" class="usedImgs" name="usedBookImgs[${i}].ubookimage" value="${file.ubookimage}">`;
				i++;
			});
			// 첫번째 이미지를 대표 이미지로 사용하기 위해 저장
			console.log("1c" + data[0].ubookimage);
			imgName.value = data[0].ubookimage; 
			// jsp 폼 태그 안에 str 데이터 추가삽입
			f.insertAdjacentHTML('beforeend', str);
		}else {
			alert('서버 오류');
		}
	})
	.catch(err => {
		console.log(err);
	});
});

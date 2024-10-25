// 전역 변수 설정
const f = document.forms[0];
const shortText = document.querySelector('textarea[name="content"]');
const bookcover = f.bookcover;

// 이미지 업로드 이벤트 ( 물리 폴더에 데이터 저장 )
function previewImage(event) {
    const imagePreview = document.getElementById('imagePreview');
    const file = event.target.files[0];
    
    const formData = new FormData();
    
    formData.append("uploadFile", file);
    
    fetch('/shopUpload/uploadAsyncAction', {
		method : 'post',
		body : formData
	})
		.then(response => response.json())
		.then(data => {
//			console.log(data.reviewimguuid);
			
			if(data){
				const imgName = data.reviewimgname;
				const imgUuid = "/images/" + data.reviewimguuid + "_" + imgName;
//				const imgPath = "/resources/images/" + imgUuid + "_" + imgName;
//				inputImgName.value = imgName;
				bookcover.value = imgName;
				console.log("책 저장 이름 : " + bookcover.value);
//				console.log(inputImgName.value);
			}else {
				alert('서버 오류');
			}
			
			
			if (file) {
				const reader = new FileReader();
				
				reader.onload = function (e) {
					imagePreview.src = e.target.result; // 선택한 파일의 URL을 미리보기 이미지의 src에 설정
					imagePreview.style.display = 'block'; // 이미지 표시
				};
				
				reader.readAsDataURL(file); // 파일 읽기
			}
			
		})
		.catch(err => console.log(err));

}

// 등록 버튼 클릭
function goInsert() {
	let input = document.createElement('input'); // input 태그 생성
	input.type = 'hidden'; // input 타입 설정
	input.name = 'shortText'; // name 속성 설정
	input.value = shortText.value;

	// 생성한 input을 원하는 위치에 추가
	f.append(input); // body에 input 태그 추가
	
//	console.log(f.title.value);
//	console.log(f.writer.value);
//	console.log(f.publisher.value);
//	console.log(f.isbn.value);
//	console.log(f.ordDate.value);
//	console.log(f.inventory.value);
//	console.log(f.gno.value);
//	console.log(f.bookcover.value);
//	console.log(f.bookPrice.value);
//	console.log(f.shortText.value);
	
	f.action = '/shop/insert';
	f.submit();
	
}
const MAX_SIZE = 15242880; // 15MB
let uploadDiv = document.querySelector('.uploadDiv');
let cloneObj = uploadDiv.firstElementChild.cloneNode(true);

// 문서가 로드된 후 코드 실행
document.addEventListener('DOMContentLoaded', () => {
    let uploadResult = document.querySelector('.uploadResult ul'); // 파일 업로드 결과를 표시할 요소
    const inputFile = document.querySelector('input[type="file"]'); // 파일 선택 input 요소
    
    // 선택한 카테고리에 따라 파일 확장자 정규 표현식을 반환하는 함수
    function getRegexByCategory() {
        const selectedCategory = document.querySelector('select[name="category"]').value;
        return selectedCategory === "5" ? /\.(zip|7z|rar|exe)$/ : /\.(png|jpg|webp|jpeg|jfif)$/;
    }

    // 파일 이름과 크기를 검사하는 함수
    function checkExtension(fileName, fileSize) {
        const regex = getRegexByCategory(); // 현재 카테고리의 파일 형식에 맞는 정규 표현식 가져오기
        if (fileSize >= MAX_SIZE) { // 파일 크기 초과 확인
            alert("파일 사이즈 초과");
            return false;
        }
        if (!regex.test(fileName)) { // 파일 확장자 형식 확인
            alert("해당 카테고리에서 지원되지 않는 파일 형식입니다.");
            return false;
        }
        return true; // 파일 형식과 크기가 적절할 경우 true 반환
    }

    // 카테고리 변경 시 파일 형식을 검사하여 불일치 시 파일을 리셋
    document.querySelector('select[name="category"]').addEventListener('change', () => {
        const files = inputFile.files;
        for (let i = 0; i < files.length; i++) {
            if (!checkExtension(files[i].name, files[i].size)) {
                inputFile.value = ''; // 카테고리 변경 시 파일 리셋
                return;
            }
        }
    });

    // 파일 선택 시 파일 형식과 크기 검사 후 서버로 전송하는 이벤트
    inputFile.addEventListener('change', () => {
        const formData = new FormData(); // 서버로 전송할 폼 데이터 생성
        const files = inputFile.files;

        for (let i = 0; i < files.length; i++) {
            if (!checkExtension(files[i].name, files[i].size)) { // 파일 확장자와 크기 검사
                return;
            }
            formData.append("uploadFile", files[i]); // 통과한 파일만 폼 데이터에 추가
        }

        // 서버에 비동기 요청을 통해 파일 전송
        fetch('/uploadAsyncAction', {
            method: 'post',
            body: formData
        })
        .then(response => response.json())
        .then(json => {
            console.log(json);
            inputFile.value = ''; // 파일 input 초기화
            showUploadFile(json); // 업로드된 파일 표시
        })
        .catch(err => console.log(err));
    });

    // 업로드된 파일을 화면에 표시하는 함수
    function showUploadFile(uploadResultArr) {
        if (!uploadResultArr || uploadResultArr.length === 0) return;

        let str = '';
        uploadResultArr.forEach(file => {
            // 서버에 저장된 파일 경로 생성 및 인코딩
            let fileCallPath = encodeURIComponent(`${file.uploadPath}/${file.uuid}_${file.fileName}`);
            
            // 업로드 결과를 리스트 아이템으로 생성
            str += `<li path="${file.uploadPath}" uuid="${file.uuid}" fileName="${file.fileName}">`;
            str += `<a href="/download?fileName=${fileCallPath}">${file.fileName}</a>`;
            str += `<span data-file="${fileCallPath}"> X </span>`; // 삭제 버튼 생성
            str += `</li>`;
        });
        uploadResult.innerHTML = str; // 업로드 결과를 HTML로 추가
    }

    // 파일 삭제 이벤트 핸들러
    if (uploadResult) {
        uploadResult.addEventListener('click', (e) => {
            if (e.target.tagName.toLowerCase() === 'span') { // 삭제 버튼 클릭 여부 확인
                const targetFile = e.target.getAttribute('data-file');
                
                // 서버에 비동기 요청을 통해 파일 삭제
                fetch('/deleteFile', {
                    method: 'post',
                    body: targetFile,
                    headers: {
                        'Content-type': 'text/plain'
                    }
                })
                .then(response => response.text())
                .then(result => {
                    console.log(result);
                    
                    // 삭제된 파일의 리스트 아이템 제거
                    let targetLi = e.target.closest('li');
                    targetLi.parentNode.removeChild(targetLi);
                })
                .catch(err => console.log(err));
            }
        });
    }
});

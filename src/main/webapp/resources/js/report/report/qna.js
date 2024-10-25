console.log("kaak");

document.addEventListener('DOMContentLoaded', function() {
    // 카테고리 버튼 클릭 이벤트 설정
    const buttons = document.querySelectorAll('.category-tabs button');
    
    buttons.forEach(button => {
        button.addEventListener('click', function() {
            const categoryId = button.id;

            buttons.forEach(btn => btn.classList.remove('active'));
            this.classList.add('active');
            
            fetchData(categoryId);
        });
    });
});

// 데이터베이스에서 QnA 데이터를 가져오는 함수
function fetchData(categoryId) {
    // 서버로 AJAX 요청 보내기
    fetch(`/report/qna/category/${categoryId}`)
    .then(response => response.json()) // JSON 형식으로 응답 받기
    .then(checkList => {
    	console.log(checkList);
       updateQnaList(checkList);
    	
    })
    .catch(error => {
        console.error('Error fetching data:', error);
    });
}

// QnA 목록을 업데이트하는 함수
function updateQnaList(qnaList) {
    const qnaTableBody = document.querySelector('table tbody');
    qnaTableBody.innerHTML = ''; // 기존 내용 삭제

    // 데이터 리스트를 순회하며 테이블에 추가
    qnaList.forEach(qna => {
        const row = document.createElement('tr');
        const categoryCell = document.createElement('td');
        const questionCell = document.createElement('td');

        categoryCell.textContent = `[${qna.qnaQuestion}] ${qna.qnaQuestion}`;
        questionCell.textContent = qna.qnaAnswer;

        row.appendChild(categoryCell);
        row.appendChild(questionCell);
        qnaTableBody.appendChild(row);
    });
}
fetchData(0);
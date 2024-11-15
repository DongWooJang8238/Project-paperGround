// DOMContentLoaded 이벤트 리스너 설정
// 페이지가 완전히 로드된 후에 내부 코드가 실행되도록 함
document.addEventListener('DOMContentLoaded', function() {

    // 게시글 좋아요 버튼 클릭 이벤트
    const likeBtn = document.getElementById('like-btn');
    if (likeBtn) {
        // like-btn 버튼이 클릭될 때 발생하는 이벤트 리스너
        likeBtn.addEventListener('click', function() {
            const boardno = this.getAttribute('data-boardno'); // 게시글 번호
            
            // 서버에 전송할 좋아요 데이터 객체
            const likeData = {
                boardno: boardno,
                mno: mno.value // 사용자 ID
            };
            console.log(JSON.stringify(likeData));
            
            // 게시글 좋아요 추가 요청
            fetch('/like/get', {
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify(likeData) // JSON 데이터로 변환하여 전송
            })
            .then(response => response.text()) // 서버 응답 텍스트 받기
            .then(data => {
                console.log(data); // "Like added" 또는 "Already liked" 메시지 출력
                // 좋아요 개수 업데이트
                if (data === "Like added") {
                    updateLikeCount(boardno); // 새로운 좋아요일 때만 개수 업데이트
                } else if (mno.value == '') {
                    alert("로그인시 추천 가능합니다."); // 비로그인 시 알림
                    return;
                } else {
                    alert("이미 좋아요를 눌렀습니다."); // 이미 좋아요 눌렀을 때 경고
                }
            })
            .catch(error => console.error('Error:', error)); // 오류 발생 시 콘솔에 출력
        });
    }

    // 게시글 좋아요 개수 업데이트 함수
    function updateLikeCount(boardno) {
        // 특정 게시글의 좋아요 수를 조회하는 GET 요청
        fetch('/like/count/' + boardno)
        .then(response => response.text()) // 서버 응답 텍스트 받기
        .then(count => {
            // like-countMy 요소에 좋아요 개수 업데이트
            document.getElementById('like-countMy').innerHTML = count;
        })
        .catch(error => console.error('updateLikeCount Error:', error)); // 오류 출력
    }

    // 댓글 좋아요 버튼 클릭 이벤트
    const replyLikeBtn = document.getElementById('reply-like-btn');
    if (replyLikeBtn) {
        // reply-like-btn 버튼이 클릭될 때 발생하는 이벤트 리스너
        replyLikeBtn.addEventListener('click', function() {
            const boardno = this.getAttribute('data-boardno'); // 게시글 번호
            const replyno = this.getAttribute('data-replyno'); // 댓글 번호
            
            console.log(1);
            
            // 서버에 전송할 댓글 좋아요 데이터 객체
            const likeData = {
                replyno: replyno,
                boardno: boardno,
                mno: mno.value // 사용자 ID
            };	
            console.log("좋아요버튼" + JSON.stringify(likeData));
            
            // 댓글 좋아요 토글 요청
            fetch('/commentLike/get', {
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify(likeData) // JSON 데이터로 변환하여 전송
            })
            .then(response => response.text()) // 서버 응답 텍스트 받기
            .then(data => {
                console.log(data); // "Like added" 또는 "Already liked" 메시지 출력
                // 좋아요 개수 업데이트
                if (data === "comLike added") {
                    updateComLikeCount(replyno); // 새로운 좋아요일 때만 개수 업데이트
                } else if (mno.value == '') {
                    alert("로그인시 추천 가능합니다."); // 비로그인 시 알림
                    return;
                } else {
                    alert("이미 좋아요를 눌렀습니다."); // 이미 좋아요 눌렀을 때 경고
                }
            })
            .catch(error => console.error('getElementById Error:', error)); // 오류 출력
        });
    }

    // 댓글 좋아요 개수 업데이트 함수
    function updateComLikeCount(replyno) {
        // 특정 댓글의 좋아요 수를 조회하는 GET 요청
        fetch('/commentLike/count/' + replyno)
        .then(response => response.text()) // 서버 응답 텍스트 받기
        .then(count => {
            // reply-like-count-{replyno} 요소에 좋아요 개수 업데이트
            document.getElementById('reply-like-count-' + replyno).innerHTML = count;
        })
        .catch(error => console.error('updateComLikeCount Error:', error)); // 오류 출력
    }
});
	
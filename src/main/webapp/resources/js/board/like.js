document.addEventListener('DOMContentLoaded', function() {
    // 게시글 좋아요 버튼 클릭 이벤트
    const likeBtn = document.getElementById('like-btn');
    if (likeBtn) {
        likeBtn.addEventListener('click', function() {
            const boardno = this.getAttribute('data-boardno');
            const mno = this.getAttribute('data-mno');
            
            const likeData = {
                boardno: boardno,
                mno: mno
            };
            console.log(JSON.stringify(likeData));
            
            // 게시글 좋아요 추가 요청
            fetch('/like/get', {
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify(likeData)
            })
            .then(response => response.text()) 
            .then(data => {
                console.log(data); // "Like added" 또는 "Already liked" 메시지 표시
                // 좋아요 개수 업데이트
                if (data === "Like added") {
                    updateLikeCount(boardno); // 새로운 좋아요만 개수 업데이트
                } else {
                    alert("이미 좋아요를 눌렀습니다."); // 이미 좋아요를 눌렀다면 경고창
                }
            })
            .catch(error => console.error('Error:', error));
        });
    }

    // 게시글 좋아요 개수 업데이트 함수
    function updateLikeCount(boardno) {
        fetch('/like/count/' + boardno)
        .then(response => response.text())
        .then(count => {
            document.getElementById('like-countMy').innerHTML = count;
        })
        .catch(error => console.error('updateLikeCount Error:', error));
    }

    // 댓글 좋아요 버튼 클릭 이벤트
    const replyLikeBtn = document.getElementById('replyLikeBtn');
    if (replyLikeBtn) {
        replyLikeBtn.addEventListener('click', function() {
            const replyno = this.getAttribute('data-replyno');
            const boardno = this.getAttribute('data-boardno');
            const mno = this.getAttribute('data-mno');
            
            const likeData = {
                replyno: replyno,
                boardno: boardno,
                mno: mno
            };
            console.log(JSON.stringify(likeData));
            
            // 댓글 좋아요 토글 요청
            fetch('/like/get', {
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify(likeData)
            })
            .then(response => response.text())
            .then(data => {
                console.log(data); // "Like added" 또는 "Like removed" 메시지 표시
                // 댓글 좋아요 개수 업데이트
                updateComLikeCount(replyno);
            })
            .catch(error => console.error('getElementById Error:', error));
        });
    }

    // 댓글 좋아요 개수 업데이트 함수
    function updateComLikeCount(replyno) {
        fetch('/commentlike/count/' + replyno)
        .then(response => response.text())
        .then(count => {
            document.getElementById('comment-like-count-' + replyno).innerHTML = count;
        })
        .catch(error => console.error('updateComLikeCount Error:', error));
    }
});
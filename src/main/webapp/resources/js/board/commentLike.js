//document.addEventListener('DOMContentLoaded', function() {
//    // 좋아요 버튼 클릭 이벤트
//    document.getElementById('replyLikeBtn').addEventListener('click', function() {
//        var replyno = this.getAttribute('data-replyno');
//        var boardno = this.getAttribute('data-boardno');
//        var mno = this.getAttribute('data-mno');
//        
//        var likeData = {
//        	replyno: replyno,
//            boardno: boardno,
//            mno: 1
//        };
//        
//        console.log(JSON.stringify(likeData));
//        
//        // 좋아요 토글 요청
//        fetch('/like/get', {
//            method: 'POST',
//            headers: {'Content-Type': 'application/json'},
//            body: JSON.stringify(likeData)
//        })
//        .then(response => response.text()) // text으로 변환
//        .then(data => {
//            console.log(data); // "Like added" 또는 "Like removed" 메시지 표시
//            // 좋아요 개수 업데이트
//            updateComLikeCount(replyno);
//        })
//        .catch(error => console.error('getElementById Error:', error));
//    });
//
//    // 좋아요 개수 업데이트 함수
//    function updateComLikeCount(boardno) {
//        fetch('/commentlike/count/' + replyno)
//        .then(response => response.text())
//        .then(count => {
//            document.getElementById('like-countMy').innerHTML = count;
//        })
//        .catch(error => console.error('updateComLikeCount Error:', error));
//    }
//});
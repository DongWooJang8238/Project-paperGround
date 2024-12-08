

// 게시글 좋아요 버튼
// 게시글 좋아요
const likeBtn = document.querySelector('#like-btn');
likeBtn &&
likeBtn.addEventListener('click', function(e){
   const boardno = document.querySelector('input[name="boardno"]'); // 게시글 번호
   
   if(mno.value == ''){
      alert('로그인 이후 가능합니다.');
      return;
   }
   
   // 서버에 전송할 좋아요 데이터 객체
    const likeData = {
        boardno: boardno.value,
        mno: mno.value // 사용자 ID
    };
   
    // 게시글 좋아요 추가 요청
    fetch('/like/get', {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify(likeData) // JSON 데이터로 변환하여 전송
    })
    .then(response => response.text()) // 서버 응답 텍스트 받기
    .then(data => {
       // "Like added" 또는 "Already liked" 메시지 출력
        // 좋아요 개수 업데이트
        if (data === "Like added") {
            updateLikeCount(boardno.value); // 새로운 좋아요일 때만 개수 업데이트
        }else {
            alert("이미 좋아요를 눌렀습니다."); // 이미 좋아요 눌렀을 때 경고
        }
    })
    .catch(error => console.error('Error:', error)); // 오류 발생 시 콘솔에 출력
});

//게시글 좋아요 개수 업데이트 함수
function updateLikeCount(boardno) {
    fetch('/like/count/' + boardno)
    .then(response => response.text()) 
    .then(count => {
        document.getElementById('like-countMy').innerHTML = count;
    })
    .catch(error => console.error('updateLikeCount Error:', error)); 
}

// 댓글 좋아요 클릭 이벤트
const chatUl = document.querySelector('.chat');
chatUl.addEventListener('click', function(e){
   if(e.target.className === 'reply-like-btn'){
      
      if(mno.value == ''){
         alert('로그인 이후 가능합니다.');
         return;
      }
      
      const boardNo = document.forms[0].boardno.value; 
      const replyNo = e.target.getAttribute('data-replyno');
      
      const likeData = {
            replyno: replyNo,
            boardno: boardNo,
            mno : mno.value // 사용자 ID
        };
      
      console.log("좋아요버튼" + JSON.stringify(likeData));
      
      fetch('/commentLike/get', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify(likeData) 
        })
        .then(response => response.text()) 
        .then(data => {
            console.log('테이터' + data); 
            
            if (data === "comLike added") {
                updateComLikeCount(replyNo); 
            } else {
                alert("이미 좋아요를 눌렀습니다."); 
            }
        })
        .catch(error => console.error('getElementById Error:', error));
   }
});
// 댓글 좋아요 수 업데이트 
function updateComLikeCount(replyno) {
    fetch('/commentLike/count/' + replyno)
    .then(response => response.text()) 
    .then(count => {
    	console.log(count);
        document.getElementById('reply-like-count-' + replyno).innerHTML = count;
    })
    .catch(error => console.error('updateComLikeCount Error:', error)); 
}

/*
document.addEventListener('DOMContentLoaded', function() {

    // 부모 요소에 이벤트 위임을 설정 (여기서는 문서 전체를 감지하기 위해 body 사용)
    document.body.addEventListener('click', function(event) {
        // 좋아요 버튼을 클릭한 경우만 처리
        if (event.target && event.target.id === 'like-btn') {
            const likeBtn = event.target;
            const boardno = likeBtn.getAttribute('data-boardno'); // 게시글 번호

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
        }
    });

    // 게시글 좋아요 개수 업데이트 함수
    function updateLikeCount(boardno) {
        fetch('/like/count/' + boardno)
        .then(response => response.text()) 
        .then(count => {
            document.getElementById('like-countMy').innerHTML = count;
        })
        .catch(error => console.error('updateLikeCount Error:', error)); 
    }

    // 동일한 방식으로 댓글 좋아요 이벤트 위임
    document.body.addEventListener('click', function(event) {
        if (event.target && event.target.id === 'reply-like-btn') {
            const replyLikeBtn = event.target;
            const boardno = replyLikeBtn.getAttribute('data-boardno'); // 게시글 번호
            const replyno = replyLikeBtn.getAttribute('data-replyno'); // 댓글 번호
            
            const likeData = {
                replyno: replyno,
                boardno: boardno,
                mno: mno.value // 사용자 ID
            };
            console.log("좋아요버튼" + JSON.stringify(likeData));
            
            fetch('/commentLike/get', {
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify(likeData) 
            })
            .then(response => response.text()) 
            .then(data => {
                console.log(data); 
                if (data === "comLike added") {
                    updateComLikeCount(replyno); 
                } else if (mno.value == '') {
                    alert("로그인시 추천 가능합니다.");
                    return;
                } else {
                    alert("이미 좋아요를 눌렀습니다."); 
                }
            })
            .catch(error => console.error('getElementById Error:', error)); 
        }
    });

    function updateComLikeCount(replyno) {
        fetch('/commentLike/count/' + replyno)
        .then(response => response.text()) 
        .then(count => {
            document.getElementById('reply-like-count-' + replyno).innerHTML = count;
        })
        .catch(error => console.error('updateComLikeCount Error:', error)); 
    }
});
*/

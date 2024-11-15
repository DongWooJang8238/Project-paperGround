console.log("kaak");

$(document).ready(function() {
    // 모달이 열릴 때 실행되는 함수
    $('#roleModal').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget); // 권한 변경 버튼
        var userId = button.data('id'); // 유저 ID
        var username = button.data('username'); // 유저 이름
        var userRole = button.data('role'); // 유저 역할
        
        // username 값을 tempUsername 변수에 저장
        var tempUsername = username;
        
        $('#userId').val(userId);
        $('#username').val(username);
        $('#userRole').val(userRole);
        // modal의 username input 요소에 tempUsername 값을 설정, role 추가
        
        $('#roleModal form').on('submit', function(event) {
            event.preventDefault(); // 기본 동작 방지
            
            // 폼 데이터 가져오기
            var formDataArray = $(this).serializeArray();
            
            // formDataArray를 이용해 객체 생성
            const userVO = {};
            formDataArray.forEach(function(item) {
                userVO[item.name] = item.value;
            });
            
            console.log(userVO); // userVO 확인
            
           
            
          
            fetch('/admin/changeRole',{
            	method : 'POST',
            	headers: {'Content-Type': 'application/json'},
            	body : JSON.stringify(userVO)
            })
            .then(response => response.text())
            .then(data => {
                console.log("서버 응답:", data);
                console.log("서버 응답:", userRole);
                alert("변경 완료");
                location.reload();
            })
            .catch(error => {
                console.error("에러 발생:", error);
            });
        });

    });
});

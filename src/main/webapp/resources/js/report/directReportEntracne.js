console.log("kaakDRreportEntrance");


document.addEventListener('DOMContentLoaded', function() {
    let gameMode;
    const form = document.forms[0];  // 'f' 대신 'form'으로 변수 이름 변경

    // 모든 버튼에 이벤트 핸들러 연결
    document.querySelectorAll(".btns").forEach(btn => {
        btn.addEventListener('click', () => {
            let type = btn.getAttribute('id');
            console.log(type);  // 클릭된 버튼의 id 확인
            
            if (type === 'godirectReport') {
                location.href = `/report/directReport?mno=${mno.value}`;
            } else if (type === 'godirectReportCheck') {
                location.href = `/report/directReportList?mno=${mno.value}`;
            }else if( type === 'goqna'){
            	location.href = `/report/qna`;
            }
            
        });
    });
});
var message = document.querySelector('.alertMessage').value;
if (message) {
    alert(message);
}







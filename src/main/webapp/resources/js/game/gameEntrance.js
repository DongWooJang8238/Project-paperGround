console.log("kaak");
document.addEventListener('DOMContentLoaded', function() {
    let gameMode;
    const form = document.forms[0];  // 'f' 대신 'form'으로 변수 이름 변경

    // 모든 버튼에 이벤트 핸들러 연결
    document.querySelectorAll(".btns").forEach(btn => {
        btn.addEventListener('click', () => {
            let type = btn.getAttribute('id');
            console.log(type);  // 클릭된 버튼의 id 확인
            
            if (type === 'easyBtn') {
                gameMode = 0;
            } else if (type === 'nomalBtn') {
                gameMode = 1;
            }
            
            // gameMode와 mno 값을 URL로 전달하여 이동
            if (gameMode !== undefined) {
                location.href = `/game/JenreCheck?gameMode=${gameMode}&mno=${mno.value}`;
            }
        });
    });
});
var message = document.querySelector('.alertMessage').value;
if (message) {
    alert(message);
}







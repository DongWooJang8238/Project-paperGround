console.log("kaak");

var currentIndex = 0;
var correctAnswers = 0;

function showNextQuest() {
    const questList = document.getElementsByClassName("quest");
    if (currentIndex < questList.length) {
        questList[currentIndex].style.display = 'block';
    }
}

function checkAnswer(answer) {
    const questList = document.getElementsByClassName("quest");
    const correctAnswer = document.getElementsByClassName("correctAnswer")[currentIndex].value;

    if (answer === correctAnswer) {
        alert("정답입니다!");
        questList[currentIndex].style.display = 'none';
        currentIndex++;
        if (currentIndex < questList.length) {
            showNextQuest();
        } else {
            alert("모든 퀘스트를 완료했습니다!");
            location.href = "/game/entrance?mno="+1;
        }
    } else {
        alert("오답입니다. 다시 시도하세요.");
    }
}

document.getElementById("btn-o").addEventListener("click", function() {
    checkAnswer("참");  // O 버튼을 누르면 "참"으로 처리
});

document.getElementById("btn-x").addEventListener("click", function() {
    checkAnswer("거짓");  // X 버튼을 누르면 "거짓"으로 처리
});

window.onload = function() {
    showNextQuest(); 
};

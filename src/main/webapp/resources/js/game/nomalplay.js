console.log("kaak");


let currentIndex = 0;
let questNo = 1;

function showNextQuest() {
    const questList = document.getElementsByClassName("quest");
    if (currentIndex < questList.length) {
        questList[currentIndex].style.display = 'block';
    }
}

function checkAnswer() {

	const questList = document.getElementsByClassName("quest");
	const answerInput = document.getElementById("answerInput").value;
	const correctAnswer = document.getElementsByClassName("correctAnswer")[currentIndex].value;
    if (answerInput.trim() === correctAnswer) {
        alert("정답입니다! "+(3-questNo)+" 개 문제 남음" );

        questList[currentIndex].style.display = 'none';
        
        questNo++;
        currentIndex++;
        document.getElementById("answerInput").value = ''; // 입력창 비우기

        if (currentIndex < questList.length) {
            showNextQuest(); 
        } else {
            alert("모든 퀘스트를 완료했습니다!");
            location.href='/game/gameDone?mno='+1;
        }
    } else {
        alert("오답입니다. 정답은 "+correctAnswer + " 입니다");
    }
}
function goBack() {
	const questList = document.getElementsByClassName("quest");
	const answerInput = document.getElementById("answerInput").value;
	const correctAnswer = document.getElementsByClassName("correctAnswer")[currentIndex].value;
	
	if(currentIndex == 0 ){
		return;
	}
	
	questList[currentIndex].style.display = 'none';
	document.getElementById("answerInput").value = ''; // 입력창 비우기
	currentIndex--;
	questNo--;
	questList[currentIndex].style.display = 'block';
	
	//location.href = '/game/entrance?mno='+1;
}


window.onload = function() {
    showNextQuest(); 
};






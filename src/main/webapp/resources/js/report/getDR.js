// Add CSS file to the document head
const CSS_FILE_PATH = '/resources/css/get.css';
let linkEle = document.createElement('link');
linkEle.rel = 'stylesheet';
linkEle.href = CSS_FILE_PATH;
document.head.appendChild(linkEle);

document.addEventListener('DOMContentLoaded', () => {
    const f = document.forms[0];

    // Initialize variables at the start of DOMContentLoaded

    function setStorageData(pageNum, amount) {
        let pageData = { pageNum: pageNum, amount: amount };
        localStorage.setItem('page_data', JSON.stringify(pageData));
    }

    function getStorageData() {
        return JSON.parse(localStorage.getItem('page_data'));
    }

    // Button event listeners
    document.querySelectorAll("button").forEach(btn => {
        btn.addEventListener('click', (e) => {
            let type = btn.getAttribute('id');

            if (type === 'indexBtn') {
                let pageData = getStorageData();
                let sendData = `pageNum=${pageData.pageNum}&amount=${pageData.amount}`;
                location.href = `/report/directReportList?${sendData}&mno=${mno.value}`;
            	} else if (type === 'markAsCompleted') {
//            		markAsCompleted();
            } 
        });
    });
    

});

function markAsCompleted() {
	const titleInput = document.getElementById("title");
	titleInput.value = "처리완료: " + titleInput.value;
	titleInput.classList.add("completed");
	
	const drno = document.querySelector("input[name='drno']").value;
	console.log(drno);
	
	const DRVO = 
	{
			drno : drno,
			status : '처리완료'
	};
	
	console.log("DRVO : " + DRVO.drno);
	console.log("DRVO : " + DRVO.status);
	
	fetch("/report/updateStatus", {
		method: "POST",
		headers: {
			"Content-Type": "application/json"
		},
		body: JSON.stringify(DRVO)
	})
	.then(response => response.text())
	.then(data => {
		console.log(data);
		if(data === 'Success'){
			alert("처리완료 상태가 저장되었습니다.");
		}else {
			alert("상태 업데이트에 실패했습니다.");
		}
	})
	.catch(error => {
		console.error("Error:", error);
		alert("상태 업데이트에 실패했습니다.");
	});
}
console.log("kaak");

document.addEventListener('DOMContentLoaded', function() {
    // 공통으로 사용할 함수
	let qna =1;
    function loadData(category) {
    	switch(category){
        case reportUser:
        	qna=1;
          break;
        case reportWriter:
        	qna = 2;
        	break;
        case reportSystem:
        	qna = 3;
        	break;
        case reportShop:
        	qna = 4;
        	break;
        case reportRefund:
        	qna = 5;
        	break;
        case reportProfile:
        	qna = 6;
        	break;
        case reportFesta:
        	qna = 7;
        	break;
        case reportHeadhunter:
        	qna = 8;
        	break;
        }
    	
        fetch(`/report/reportCategory?qna=${qna}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('기능고장');
                }
                return response.text();  
            })
            .then(data => {
                document.getElementById('dataList').innerHTML = data; 
            })
            .catch(error => {
                console.error('Error fetching data:', error);
            });
    }

    // 버튼 클릭 이벤트
    document.querySelectorAll('.btn').forEach(button => {
        button.addEventListener('click', function() {
            const category = this.id.replace('report', '').toLowerCase();  
            loadData(category);
        });
    });
   
   
});

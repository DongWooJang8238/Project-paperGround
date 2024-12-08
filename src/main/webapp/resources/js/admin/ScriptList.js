console.log("kaak");


document.querySelectorAll('.btn-danger').forEach(button =>{
	button.addEventListener('click', function(e){
		e.preventDefault();
		
		const rptlrmfForm = this.parentElement;
		const boardno = rptlrmfForm.querySelector('input[name="boardno"]').value;
		
		 fetch('/admin/scriptCut', {
	            method: 'POST',
	            headers: { 'Content-Type': 'application/json' },
	            body: boardno
	        })
		.then(response => response.text())
		.then(data =>{
		console.warn("서버 응답:", data);
		location.reload()}            	
		).catch(error=>{
			console.error("에러 발생:", error)
			});
		});	
  });

//document.querySelectorAll('.category').forEach(btn => {
//    btn.addEventListener('click', (event) => {
//        let category = event.target.value; // 클릭된 버튼의 value를 가져옴
//        console.log(category);
//
//        location.href = `/admin/scriptCategoryList?category=${category}`;        
//    });
//});

document.querySelectorAll('.pagination a').forEach(btn => {
    btn.addEventListener('click', (event) => {
        event.preventDefault(); // 기본 동작 중단

        const category = new URLSearchParams(window.location.search).get('category') || 0; // URL에서 카테고리 값을 가져옴
        const amount = new URLSearchParams(window.location.search).get('amount') || 10; // 기본 게시글 수 10
        const pageNum = event.target.textContent.trim(); // 페이지 번호 가져오기

        // 페이지 이동
        location.href = btn.href;
    });
});